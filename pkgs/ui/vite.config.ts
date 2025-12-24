import tailwind from '@tailwindcss/vite'
import env from '@wes/env'
import { defineConfig } from 'vite'
import solid from 'vite-plugin-solid'

export default defineConfig({
  root: './',
  plugins: [solid(), tailwind()],
  server: {
    host: true,
    allowedHosts: ['localhost', ...env.DEV_HOSTS],
  },
})
