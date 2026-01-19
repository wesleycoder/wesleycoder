// deno-lint-ignore-file no-explicit-any
import { defineMain } from 'storybook-solidjs-vite'

export default defineMain({
  framework: {
    name: 'storybook-solidjs-vite',
    options: {},
  },
  core: {
    builder: '@storybook/builder-vite',
  },
  addons: [
    '@storybook/addon-docs',
    '@storybook/addon-a11y',
    '@storybook/addon-links',
    '@storybook/addon-themes',
    {
      name: '@storybook/addon-vitest',
      options: {
        cli: false,
      },
    },
  ],
  stories: [
    '../stories/**/*.mdx',
    '../stories/**/*.stories.@(js|jsx|mjs|ts|tsx)',
  ],
  features: {
    experimentalTestSyntax: true,
  },
  typescript: ({
    reactDocgen: 'react-docgen-typescript',
    reactDocgenTypescriptOptions: {
      shouldExtractLiteralValuesFromEnum: true,
      propFilter: (prop: any) => prop.parent ? !/node_modules/.test(prop.parent.fileName) : true,
    },
  } as any),
})
