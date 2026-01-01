import { Accessor, createContext, createEffect, createSignal, JSXElement, onMount, Setter, useContext } from 'solid-js'

export type Theme = 'light' | 'dark' | null
const STORAGE_KEY = 'theme'

type Context = { theme: Accessor<Theme>; toggle: Setter<Theme> }
export const ThemeContext = createContext<Context>()

export const ThemeProvider = (props: { children: JSXElement }) => {
  const [theme, setTheme] = createSignal<Theme>(null)

  onMount(() => {
    const savedTheme = localStorage.getItem(STORAGE_KEY) as Theme | null
    const initialTheme: Theme = savedTheme ||
      (globalThis.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light')
    setTheme(initialTheme)
    document.documentElement.classList.add(initialTheme)
  })

  createEffect(() => {
    const currentTheme = theme()
    if (typeof window !== 'undefined') {
      if (currentTheme) localStorage.setItem(STORAGE_KEY, currentTheme)
      else localStorage.removeItem(STORAGE_KEY)

      if (currentTheme === 'dark') {
        document.documentElement.classList.add('dark')
        document.documentElement.classList.remove('light')
      } else {
        document.documentElement.classList.add('light')
        document.documentElement.classList.remove('dark')
      }
    }
  })

  const value = {
    theme,
    toggle() {
      setTheme((t) => t === 'light' ? 'dark' : 'light')
    },
  }

  return <ThemeContext.Provider value={value}>{props.children}</ThemeContext.Provider>
}

export function useTheme() {
  const value = useContext(ThemeContext)
  if (!value) throw new Error('useTheme must be used within a ThemeProvider')
  return value
}
