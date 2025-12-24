import { Button } from './src/button.tsx'

export default () => {
  return (
    <>
      <section class='light bg-background text-foreground p-4'>
        <Button type='default' />
      </section>
      <section class='dark bg-background text-foreground p-4'>
        <Button type='action' />
      </section>
    </>
  )
}
