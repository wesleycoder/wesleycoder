// deno-lint-ignore-file no-explicit-any
import addonA11y from '@storybook/addon-a11y'
import addonDocs, { DocsRenderer, type DocsTypes } from '@storybook/addon-docs'
import { withThemeByDataAttribute } from '@storybook/addon-themes'
import { definePreview } from 'storybook-solidjs-vite'
import { type PreviewAddon } from 'storybook/internal/csf'
import { type Renderer } from 'storybook/internal/types'
import { getPreferredColorScheme, themes } from 'storybook/theming'
import '../global.css'
import './manager.css'

class ThemeDocsRenderer extends DocsRenderer<Renderer> {
  constructor() {
    super()

    const originalRender = this.render

    this.render = function (this: ThemeDocsRenderer, ...args: any[]) {
      const [context, docsParameter] = args
      const theme = context?.store?.userGlobals?.globals?.theme || getPreferredColorScheme()
      docsParameter.theme = theme === 'dark' ? themes.dark : themes.light

      return (originalRender as any).apply(this, args)
    } as unknown as typeof originalRender
  }
}

export default definePreview({
  addons: [addonDocs() as PreviewAddon<DocsTypes>, addonA11y()],
  globalTypes: {
    theme: {
      name: 'Theme',
      description: 'Global theme for components',
      defaultValue: getPreferredColorScheme(),
    },
  },
  tags: ['!test'],
  decorators: [
    withThemeByDataAttribute({
      themes: {
        light: 'light',
        dark: 'dark',
      },
      defaultTheme: getPreferredColorScheme(),
      parentSelector: 'html',
      attributeName: 'data-theme',
    }),
  ],
  parameters: {
    actions: {
      argTypesRegex: '^on.*',
    },
    backgrounds: {
      disable: true,
    },
    controls: {
      matchers: {
        color: /(background|color)$/i,
        date: /Date$/i,
      },
    },
    a11y: {
      test: 'todo',
    },
    docs: ({
      toc: { headingSelector: 'h2, h3' },
      theme: themes.light,
      renderer: () => new ThemeDocsRenderer(),
    } as any),
  },
})
