/// <reference types="vitest/config" />
import { playwright } from '@vitest/browser-playwright'
import { defineConfig } from 'vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [],
  define: {
    'process.env': {},
  },
  test: {
    projects: [{
      extends: true,
      test: {
        name: 'storybook',
        browser: {
          enabled: true,
          headless: true,
          // deno-lint-ignore no-explicit-any
          provider: playwright() as any, // plugin has a version mismatch but it should work
          instances: [{
            browser: 'chromium',
          }],
        },
      },
    }],
  },
})
