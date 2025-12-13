import { Eta, type EtaConfig } from '@bgub/eta'
import { denoPlugin } from '@deno/esbuild-plugin'
import { parse as parseToml } from '@std/toml'
import { parse as parseYaml } from '@std/yaml'
import * as esbuild from 'esbuild'
import { readFileSync } from 'node:fs'
import { basename, dirname } from 'node:path'
import type { CompilerOptions } from 'typescript'
import { ModuleKind, ScriptTarget } from 'typescript'
import type { Plugin, ResolvedConfig } from 'vite'
import { getPrefixedConsole } from './logger.ts'

/** @see https://regex101.com/r/iJoES1/1 */
const frontmatterRegex = /(?<fm>(?:(?<prepend>.*?)---[ \t]*(?<lang>[\w-]*)\s*)?(?<code>[\s\S]*?)\n---\n)?/s

type Config = {
  eta: Partial<EtaConfig>
  ts: Partial<CompilerOptions>
}

const defaultConfig: Config = {
  eta: {},
  ts: {
    target: ScriptTarget.ESNext,
    module: ModuleKind.ESNext,
  },
}

type RenderFn = (data: Record<string, unknown>) => Promise<string> | string

type RunFn = (
  code: string,
  filename: string,
  cfg: Partial<Config & { vite?: ResolvedConfig }>,
) => Promise<Record<string, unknown>> | Record<string, unknown>

const runTs: RunFn = async (code, filepath, cfg) => {
  const filename = basename(filepath)
  const baseDir = dirname(filepath)

  const ctx = await esbuild.context({
    bundle: true,
    stdin: {
      contents: code,
      resolveDir: baseDir,
      sourcefile: `${filename}.ts`,
      loader: 'ts',
    },
    plugins: [denoPlugin()],
    tsconfigRaw: `{"compilerOptions": ${JSON.stringify({ ...defaultConfig.ts, ...cfg.ts })}}`,
    format: 'esm',
    write: false,
    target: 'esnext',
  })

  const originalConsole = globalThis.console
  const originalProcess = globalThis.process
  globalThis.process = { cwd: originalProcess.cwd, env: cfg.vite?.env } as NodeJS.Process
  globalThis.__fm_console__ = getPrefixedConsole(filename, originalConsole)
  globalThis.it = {}

  try {
    const wrappedCode = `
      // ${Date.now()} -> avoid caching
      import.meta.env ??= ${JSON.stringify(cfg.vite?.env)}
      globalThis.console = globalThis.__fm_console__ ?? globalThis.console
      ${(await ctx.rebuild()).outputFiles[0].text}
    `
    const encodedJs = encodeURIComponent(wrappedCode)
    const dataUri = `data:text/javascript;charset=utf-8,${encodedJs}`
    await import(dataUri)
    return globalThis.it
  } catch (error) {
    originalConsole.error(`Failed to execute frontmatter code: \n${code}\n`, error)
    throw error
  } finally {
    delete globalThis.__fm_console__
    globalThis.console = originalConsole
    globalThis.process = originalProcess
    globalThis.it = {}
    await ctx.dispose()
  }
}

function runYaml(code: string, _filename: string, _cfg: Partial<Config>) {
  return parseYaml(code) as Record<string, unknown>
}

function runToml(code: string, _filename: string, _cfg: Partial<Config>) {
  return parseToml(code) as Record<string, unknown>
}

function runJson(code: string, _filename: string, _cfg: Partial<Config>) {
  return JSON.parse(code) as Record<string, unknown>
}

type Langs = 'js' | 'ts' | 'yaml' | 'toml' | 'json'
const runners: Record<
  Langs,
  (
    code: string,
    filename: string,
    cfg: Partial<Config & { vite?: ResolvedConfig }>,
  ) => Promise<Record<string, unknown>> | Record<string, unknown>
> = {
  js: runTs,
  ts: runTs,
  yaml: runYaml,
  toml: runToml,
  json: runJson,
}

const createRender = (
  template: string,
  config?: Config['eta'],
) =>
(data: Record<string, unknown>) => new Eta(config).renderString(template, data)

const processHtml = async (html: string, filename: string, cfg: Config & { vite: ResolvedConfig }) => {
  const match = html.match(frontmatterRegex)
  if (!match || !match.groups?.code) return ''
  const code = match.groups.code
  const lang = (match.groups.lang || 'yaml') as Langs
  const pre = match.groups.prepend ?? ''
  const fm = match.groups.fm ?? ''
  const template = pre + (fm ? html.replace(fm, '') : html)

  const render = createRender(template, {
    ...cfg.eta,
    views: dirname(filename),
  })

  const ctx = await runners[lang](code, filename, { ...cfg })
  return render(ctx)
}

export function FrontmatterEta(config: Partial<Config> = defaultConfig): Plugin {
  let viteConfig: ResolvedConfig
  const cfg: Config = {
    ...defaultConfig,
    ...config,
  }

  return {
    name: 'frontmatter-eta',
    enforce: 'pre',
    config: (config) => ({
      ...config,
      envPrefix: ['PUBLIC_', 'VITE_', ...(config.envPrefix ?? [])],
    }),
    configResolved(config) {
      viteConfig = config
    },
    async load(filename) {
      if (!filename.endsWith('.html') || viteConfig.mode === 'development') return null
      const html = readFileSync(filename, 'utf-8')
      return await processHtml(html, filename, { ...cfg, vite: viteConfig }) || null
    },
    transformIndexHtml: {
      order: 'pre',
      async handler(html, { filename }) {
        if (viteConfig.mode === 'production') return html
        const processedHtml = await processHtml(html, filename, { ...cfg, vite: viteConfig })
        return processedHtml || html
      },
    },
  }
}
