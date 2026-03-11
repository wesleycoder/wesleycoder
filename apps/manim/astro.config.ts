import { defineConfig } from 'astro/config'

export default defineConfig({
  srcDir: '.',
  devToolbar: {
    enabled: false,
  },
  server: {
    host: true,
  },
  vite: {
    server: {
      allowedHosts: ['localhost', '0.0.0.0', '127.0.0.1', 'guimabook.local', 'dev.guima.localhost'],
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
