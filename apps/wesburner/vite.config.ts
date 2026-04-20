import { resolve } from 'node:path'
import { defineConfig } from 'viteburner'

export default defineConfig({
  resolve: {
    alias: {
      '@/': resolve(__dirname, 'src'),
    },
  },
  viteburner: {
    watch: [{ pattern: 'src/**/*.{js,ts,jsx,tsx}', transform: true }, { pattern: 'src/**/*.{script,txt}' }],
    sourcemap: 'inline',
  },
})
