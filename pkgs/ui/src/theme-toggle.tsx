import { cx } from 'class-variance-authority'
import { Button } from './button.tsx'
import { useTheme } from './theme-context.tsx'

export type Theme = 'light' | 'dark' | null

export const ThemeToggle = () => {
  const { theme, toggle } = useTheme()

  return (
    <Button
      type='button'
      onClick={toggle}
      class={cx({ theme, size: 'sm', variant: 'ghost', color: 'foreground' })}
    >
      {theme() === 'light' ? '☀︎' : '☽'}
    </Button>
  )
}
