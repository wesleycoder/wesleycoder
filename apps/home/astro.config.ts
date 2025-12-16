import tailwindcss from '@tailwindcss/vite'
import { defineConfig } from 'astro/config'
import type { Rollup } from 'vite'
import env, { isDevelopment } from '../../pkgs/env/index.ts'

export default defineConfig({
  srcDir: './',
  devToolbar: { enabled: isDevelopment },
  vite: {
    server: {
      host: true,
      allowedHosts: ['localhost', ...env.DEV_HOSTS],
    },
    plugins: [tailwindcss() as Rollup.Plugin<unknown>[]],
  },
})
