import { defineConfig } from 'astro/config'

export default defineConfig({
  srcDir: '.',
  vite: {
    server: {
      fs: {
        allow: [
          '.',
          '../../node_modules',
        ],
      },
    },
  },
})
