import { addons } from 'storybook/manager-api'
import { getPreferredColorScheme, themes } from 'storybook/theming'

addons.setConfig({
  theme: themes[getPreferredColorScheme()],
})
