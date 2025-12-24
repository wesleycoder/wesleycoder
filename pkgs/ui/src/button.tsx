import { cva, type VariantProps } from 'class-variance-authority'
import type { JSX } from 'solid-js'

type Props = {
  children?: JSX.Element
}

const variants = {
  type: {
    default: 'bg-transparent text-foreground',
    action: 'bg-transparent text-green-800',
  },
  border: {
    default: 'border-4 border-foreground',
    rounded: 'border-4 border-solid border-foreground rounded-md',
    circle: 'border-4 border-solid border-foreground rounded-full',
  },
  shadow: {
    none: 'shadow-none',
    small: 'shadow-sm',
    medium: 'shadow-md',
    large: 'shadow-lg',
  },
} as const

export const classes = cva('button px-4 py-2', {
  variants,
  defaultVariants: {
    type: 'default',
    border: 'default',
    shadow: 'large',
  },
})

export const Button = (props: Props & VariantProps<typeof classes>) => (
  <button
    type='button'
    class={classes(props)}
    onClick={() => console.log('ok')}
  >
    {props.children ?? <>&nbsp</>}
  </button>
)
