import { Icon } from '@iconify-icon/solid'
import { For, type JSX } from 'solid-js'
import { Option, Select } from './select.tsx'
import { useTheme } from './theme-context.tsx'

export type Theme = 'light' | 'dark' | null

const icons: Record<string, string> = {
  system: 'mdi:sun-moon-stars',
  light: 'mdi:weather-sunny',
  dark: 'mdi:moon-and-stars',
}

export const ThemeSelect = () => {
  const { theme, select } = useTheme()

  const selectTheme: JSX.EventHandler<HTMLSelectElement, InputEvent> = (e) => {
    const theme = e.currentTarget.value as Theme | 'system'
    if (theme !== 'system') select(theme)
    else select(null)
  }

  return (
    <>
      <Select
        class='capitalize'
        value={theme() || 'system'}
        onInput={selectTheme}
      >
        <For each={['system', 'light', 'dark']}>
          {(theme) => (
            <Option value={theme}>
              <Icon icon={icons[theme]} aria-hidden='true' />
              {theme}
            </Option>
          )}
        </For>
      </Select>
    </>
  )
}
