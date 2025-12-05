import { Eta, type EtaConfig } from '@bgub/eta'
import { denoPlugin } from '@deno/esbuild-plugin'
import { parse as parseToml } from '@std/toml'
import { parse as parseYaml } from '@std/yaml'
import * as esbuild from 'esbuild'
import { basename, dirname } from 'node:path'
import type { CompilerOptions } from 'typescript'
import { ModuleKind, ScriptTarget } from 'typescript'
import type { Plugin } from 'vite'

const frontmatterRegex = /(?:---[ \t]*(?<lang>[\w-]+)?\s*)?(?<code>[\s\S]*?)\n---\n?/s

type Config = {
  eta: Partial<EtaConfig>
  ts: Partial<CompilerOptions>
}

const defaultConfig: Partial<Config> = {
  eta: {},
  ts: {
    target: ScriptTarget.ESNext,
    module: ModuleKind.ESNext,
  },
}

const logMethods = ['log', 'info', 'warn', 'error', 'debug']
const methodStyles: Record<(typeof logMethods)[number], string> = {
  log: 'color: cyan;',
  info: 'color: blue;',
  warn: 'color: orange;',
  error: 'color: red;',
  debug: 'color: gray;',
}

const getPrefixedConsole = (prefix = 'vm', logger = globalThis.console) => {
  const handler: ProxyHandler<typeof console> = {
    get(target, prop, receiver) {
      const originalMethod = Reflect.get(target, prop, receiver)

      if (typeof originalMethod === 'function') {
        return (...args: unknown[]) => {
          const methodName = String(prop)
          let prefixedArgs = args

          if (logMethods.includes(methodName)) {
            prefixedArgs = [`%c[${prefix}:${methodName}]:`, methodStyles[methodName], ...args]
          }

          return Function.prototype.apply.call(originalMethod, target, prefixedArgs)
        }
      }

      return originalMethod
    },
  }

  return new Proxy(logger, handler)
}

async function runTs(code: string, filepath: string, cfg: Partial<Config>) {
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
    format: 'cjs',
    write: false,
    target: 'esnext',
  })

  const result = await ctx.rebuild()

  const originalConsole = globalThis.console
  globalThis.__fm_console__ = getPrefixedConsole(filename, originalConsole)

  try {
    const AsyncFunction = Object.getPrototypeOf(async function () {}).constructor
    console.log(result.outputFiles)
    const fn = new AsyncFunction(
      'it',
      `
        globalThis.console = globalThis.__fm_console__ ?? globalThis.console
        ${result.outputFiles[0].text};
        return it;
      `,
    )
    return await fn({}) || {}
  } catch (error) {
    originalConsole.error(`Failed to execute frontmatter code: \n${code}\n`, error)
    throw error
  } finally {
    delete globalThis.__fm_console__
    globalThis.console = originalConsole
  }
}

function runYaml(code: string, _filename: string) {
  return parseYaml(code) as Record<string, unknown>
}

function runToml(code: string, _filename: string) {
  return parseToml(code) as Record<string, unknown>
}

function runJson(code: string, _filename: string) {
  return JSON.parse(code) as Record<string, unknown>
}

type Langs = 'js' | 'ts' | 'yaml' | 'toml' | 'json'
const runners: Record<
  Langs,
  (
    code: string,
    filename: string,
    cfg: Partial<Config>,
  ) => Promise<Record<string, unknown>> | Record<string, unknown>
> = {
  js: runTs,
  ts: runTs,
  yaml: runYaml,
  toml: runToml,
  json: runJson,
}

export function FrontmatterEta(cfg: Partial<Config> = defaultConfig): Plugin {
  return {
    name: 'frontmatter-eta',
    enforce: 'pre',

    config: (config) => ({
      ...config,
      envPrefix: ['PUBLIC_', 'VITE_', ...(config.envPrefix ?? [])],
    }),

    async transformIndexHtml(html, { path, filename }) {
      const match = html.match(frontmatterRegex)
      if (!match || !match.groups?.code) return html
      const code = match.groups.code
      const lang = (match.groups.lang || 'yaml') as Langs
      const ctx = await runners[lang](code, filename, cfg)

      return new Eta({
        ...defaultConfig.eta,
        ...cfg.eta,
        views: path,
      }).renderString(html.replace(match[0], ''), ctx)
    },
  }
}
