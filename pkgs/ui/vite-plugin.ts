import { deepMerge } from '@std/collections/deep-merge'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import type { Plugin, SSROptions, UserConfig } from 'vite'

/**
 * Vite plugin to make local `@wes/ui` resolve cleanly for consumers.
 *
 * - Adds aliases for `@wes/ui` and `@wes/ui/global.css` to the local package files
 * - Adds `@wes/ui` to `ssr.noExternal` and `optimizeDeps.include` (minimal)
 * - Provides a small `resolveId` fallback so CSS imports can be resolved reliably
 *
 * Usage:
 * import wesUIPlugin from '../../pkgs/ui/vite-plugin.ts'
 *
 * { plugins: [ wesUIPlugin() ] }
 */
export default function wesUIPlugin(): Plugin {
  const pkgRoot = path.dirname(fileURLToPath(import.meta.url))
  const globalCss = path.resolve(pkgRoot, 'global.css')

  return {
    name: 'wes-ui-plugin',
    enforce: 'pre',

    resolveId(id: string) {
      if (id === '@wes/ui/global.css') return globalCss
      if (id === '@wes/ui') return path.resolve(pkgRoot, 'mod.ts')
      if (id.startsWith('@wes/ui/')) return path.resolve(pkgRoot, id.replace('@wes/ui/', 'src/'))
      return null
    },

    config(userConfig: Partial<UserConfig> = {}) {
      let noExternal: SSROptions['noExternal']
      const userNoExt: SSROptions['noExternal'] = userConfig.ssr?.noExternal ?? true

      if (typeof userNoExt === 'boolean') {
        noExternal = ['@wes/ui']
      } else {
        noExternal = [
          ...(Array.isArray(userNoExt) ? userNoExt : [userNoExt]),
          '@wes/ui',
        ]
      }

      return deepMerge(
        userConfig,
        {
          resolve: {
            alias: [
              { find: '@wes/ui/global.css', replacement: globalCss },
            ],
          },
          ssr: { noExternal },
          optimizeDeps: { include: ['@wes/ui'] },
        } satisfies Omit<UserConfig, 'plugins'>,
      )
    },
  }
}
