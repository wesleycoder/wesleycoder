import ButtonStory from '@/src/button.story.tsx'
import { ThemeProvider } from '@/src/theme-context.tsx'
import '@total-typescript/ts-reset'

export default () => {
  return (
    <ThemeProvider>
      <ButtonStory />
    </ThemeProvider>
  )
}
