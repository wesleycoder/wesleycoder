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
    plugins: [
      {
        name: 'vite-plugin-no-timeout',
        configureServer(server) {
          if (server.httpServer) {
            // deno-lint-ignore no-explicit-any
            const nodeServer = server.httpServer as any
            nodeServer.timeout = 0
            nodeServer.keepAliveTimeout = 0
            nodeServer.headersTimeout = 0
            nodeServer.requestTimeout = 0
          }
        },
      },
    ],
    server: {
      allowedHosts: ['0.0.0.0', '127.0.0.1', '.localhost', '.local', '.shares.zrok.io'],
      fs: {
        allow: [
          '.',
          '../../node_modules',
        ],
      },
      proxy: {
        '/rpc': {
          target: 'http://127.0.0.1:4567',
          changeOrigin: true,
          secure: false,
          timeout: 0,
          proxyTimeout: 0,
          configure: (proxy, _options) => {
            proxy.on('proxyReq', (proxyReq, req, res) => {
              if (req.socket) req.socket.setTimeout(0)
              req.setTimeout(0)
              proxyReq.setTimeout(0)
              res.setTimeout(0)
            })
          },
        },
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
