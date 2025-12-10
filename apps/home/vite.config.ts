import deno from '@deno/vite-plugin'
import Macros from '@unplugin/macros/vite'
import env from '@wes/env'
import { FrontmatterEta } from '@wes/frontmatter-eta'
import { defineConfig } from 'vite'
import vitePluginDevtoolsJson from 'vite-plugin-devtools-json'

export default defineConfig({
  root: './',
  server: {
    host: true,
    allowedHosts: ['localhost', ...env.DEV_HOSTS],
  },
  plugins: [
    deno(),
    vitePluginDevtoolsJson(),
    Macros(),
    FrontmatterEta(),
  ],
})
