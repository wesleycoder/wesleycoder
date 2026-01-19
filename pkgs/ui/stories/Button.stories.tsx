import { Button, defaultVariants, type T as ButtonT } from '@/button/index.tsx'
import { expect, fn } from 'storybook/test'
import preview from '../.storybook/preview.ts'

const defaultArgs = {
  ...defaultVariants,
  disabled: false,
  onClick: fn(),
  children: 'Click me!!',
}

// deno-lint-ignore no-explicit-any
const propsToString = (props: Record<string, any>) =>
  Object.entries(props)
    .map(([key, value]) => `${key}="${value}"`)
    .join(' ')

const buttonCode = (props: ButtonT['props'] = defaultVariants) => `
  <Button
    ${propsToString(props)}
    disabled={false}
    onClick={fn()}
    children="Click me!!"
  />
`

const meta = preview.meta({
  title: 'UI/Button',
  component: Button,
  args: {
    ...defaultArgs,
  },
})
export default meta

export const Primary = meta.story({
  args: {
    ...defaultArgs,
  },
  parameters: {
    docs: {
      source: {
        code: buttonCode({ intent: 'primary' }),
      },
    },
  },
})

Primary.test('should have been clicked', async ({ canvas, userEvent, args }) => {
  const button = await canvas.findByRole('button')
  await userEvent.click(button)

  await expect(args.onClick).toHaveBeenCalled()
})

export const Secondary = meta.story({
  args: {
    ...defaultArgs,
  },
  parameters: {
    docs: {
      source: {
        code: buttonCode({ intent: 'secondary' }),
      },
    },
  },
})

Secondary.test('should have been clicked', async ({ canvas, userEvent, args }) => {
  const button = await canvas.findByRole('button')
  await userEvent.click(button)

  await expect(args.onClick).toHaveBeenCalled()
})
