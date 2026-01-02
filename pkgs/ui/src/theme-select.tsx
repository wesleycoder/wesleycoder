import { Icon } from '@iconify-icon/solid'
import { JSX } from 'solid-js'
import { For } from 'solid-js/web'
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
      <select
        class='[&,&::picker(select)]:[appearance:base-select] bg-background capitalize'
        value={theme() || 'system'}
        onInput={selectTheme}
      >
        <button type='button'>
          <selectedcontent></selectedcontent>
        </button>
        <For each={['system', 'light', 'dark']}>
          {(theme) => (
            <option
              class='bg-background checked:bg-foreground checked:text-foreground-contrast hover:underline [&::checkmark]:content-none'
              value={theme}
            >
              <Icon icon={icons[theme]} aria-hidden='true' />
              {theme}
            </option>
          )}
        </For>
      </select>
    </>
  )
}
