import { Accessor, createContext, createEffect, createSignal, JSXElement, onMount, Setter, useContext } from 'solid-js'

export type Theme = 'light' | 'dark' | null
const STORAGE_KEY = 'theme'

type Context = { theme: Accessor<Theme>; select: Setter<Theme> }
export const ThemeContext = createContext<Context>()

export const ThemeProvider = (props: { children: JSXElement }) => {
  const [theme, setTheme] = createSignal<Theme>(null)

  onMount(() => {
    const savedTheme = localStorage.getItem(STORAGE_KEY) as Theme
    const initialTheme: Theme = savedTheme || null
    setTheme(initialTheme)
    if (initialTheme) document.documentElement.classList.add(initialTheme)
  })

  createEffect(() => {
    const currentTheme = theme()

    if (typeof window !== 'undefined') {
      if (currentTheme) localStorage.setItem(STORAGE_KEY, currentTheme)
      else localStorage.removeItem(STORAGE_KEY)

      document.documentElement.dataset.theme = currentTheme || undefined
    }
  })

  return <ThemeContext.Provider value={{ theme, select: setTheme }}>{props.children}</ThemeContext.Provider>
}

export function useTheme() {
  const value = useContext(ThemeContext)
  if (!value) throw new Error('useTheme must be used within a ThemeProvider')
  return value
}
