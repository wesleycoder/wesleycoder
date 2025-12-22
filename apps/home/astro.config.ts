import mdx from '@astrojs/mdx'
import solid from '@astrojs/solid-js'
import deno from '@deno/vite-plugin'
import tailwindcss from '@tailwindcss/vite'
import { defineConfig } from 'astro/config'
import type { Rollup } from 'vite'
import env, { isDevelopment } from '../../pkgs/env/index.ts'

export default defineConfig({
  srcDir: './',
  output: 'server',
  devToolbar: { enabled: isDevelopment },
  integrations: [mdx(), solid()],
  vite: {
    server: {
      host: true,
      allowedHosts: ['localhost', ...env.DEV_HOSTS],
    },
    plugins: [
      deno(),
      tailwindcss(),
    ] as Rollup.Plugin<unknown>[][],
  },
})
