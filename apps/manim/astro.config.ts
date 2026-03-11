import { defineConfig } from 'astro/config'

export default defineConfig({
  srcDir: '.',
  server: {
    host: true,
  },
  vite: {
    server: {
      fs: {
        allow: [
          '.',
          '../../node_modules',
        ],
      },
      watch: {
        ignored: [
          '**/android/build/**',
          '**/android/app/build/**',
          '**/android/.gradle/**',
          '**/android/app/.cxx/**',
          '**/build/**',
        ],
      },
    },
  },
})
