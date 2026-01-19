import { Button } from '@/button.tsx'
import { expect, fn } from 'storybook/test'
import preview from '../.storybook/preview.ts'

const meta = preview.meta({
  title: 'UI/Button',
  component: Button,
  args: {
    intent: 'primary',
    size: 'md',
    disabled: false,
    onClick: fn(),
    children: 'Click me!!',
  },
})
export default meta

export const Primary = meta.story({
  args: {
    intent: 'primary',
    size: 'md',
    disabled: false,
    onClick: fn(),
    children: 'Click me!!',
  },
  parameters: {
    docs: {
      source: {
        code: `<Button
          intent="primary"
          size="md"
          disabled={false}
          onClick={fn()}
          children="Click me!!"
        />`,
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
    intent: 'secondary',
    size: 'md',
    disabled: false,
    onClick: fn(),
    children: 'Click me!!',
  },
  parameters: {
    docs: {
      source: {
        code: `<Button
          intent="secondary"
          size="md"
          disabled={false}
          onClick={fn()}
          children="Click me!!"
        />`,
      },
    },
  },
})

Secondary.test('should have been clicked', async ({ canvas, userEvent, args }) => {
  const button = await canvas.findByRole('button')
  await userEvent.click(button)

  await expect(args.onClick).toHaveBeenCalled()
})
