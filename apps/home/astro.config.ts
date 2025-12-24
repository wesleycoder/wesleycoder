import mdx from '@astrojs/mdx'
import solid from '@astrojs/solid-js'
import deno from '@deno/vite-plugin'
import tailwindcss from '@tailwindcss/vite'
import { defineConfig } from 'astro/config'
import type { Rollup } from 'vite'
import env, { isDevelopment } from '../../pkgs/env/index.ts'
import wesUIPlugin from '../../pkgs/ui/vite-plugin.ts'

export default defineConfig({
  srcDir: './',
  root: '../../',
  devToolbar: { enabled: isDevelopment },
  integrations: [mdx(), solid()],
  server: {
    host: true,
    allowedHosts: ['localhost', ...env.DEV_HOSTS],
  },
  vite: {
    plugins: [
      deno(),
      tailwindcss(),
      wesUIPlugin(),
    ] as Rollup.Plugin<unknown>[][],
  },
})
