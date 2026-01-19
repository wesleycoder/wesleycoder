import deno from '@deno/vite-plugin'
import tailwind from '@tailwindcss/vite'
import env from '@wes/env'
import { dirname, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'
import { defineConfig } from 'vite'
import solid from 'vite-plugin-solid'

const hideWarningPlugin = () => ({
  name: 'hide-malformed-html-warning',
  transform(code: string, id: string) {
    // This is a "hack" to silence the specific client-side warning
    // if it interferes with your development workflow.
    if (id.includes('vite/dist/client/client.mjs')) {
      return code.replace(
        'console.warn(`[vite] (client) ${msg}`)',
        'if(!msg.includes("selectedcontent")) console.warn(`[vite] (client) ${msg}`)',
      )
    }
  },
})

export default defineConfig({
  root: './',
  plugins: [deno(), solid(), hideWarningPlugin(), tailwind()],
  server: {
    host: true,
    allowedHosts: ['localhost', ...env.DEV_HOSTS],
  },
  resolve: {
    alias: {
      '@/lib/': `${resolve(dirname(fileURLToPath(import.meta.url)), 'lib')}/`,
      '@/': `${resolve(dirname(fileURLToPath(import.meta.url)), 'src')}/`,
    },
  },
})
