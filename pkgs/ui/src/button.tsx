import { cva, cx, type VariantProps } from 'class-variance-authority'
import { type JSX, splitProps } from 'solid-js'
import { getVariantOptions, tw, VariantOptions } from '../lib/components.ts'

const variants = {
  intent: {
    primary: tw`bg-primary text-primary-contrast`,
    secondary: tw`bg-secondary text-secondary-contrast`,
    success: tw`bg-success text-success-contrast`,
    warning: tw`bg-warning text-warning-contrast`,
    error: tw`bg-error text-error-contrast`,
  },
  border: {
    none: tw`border-none`,
    solid: tw`border-current border-solid`,
    dashed: tw`border-current border-dashed`,
    dotted: tw`border-current border-dotted`,
    double: tw`border-current border-double`,
  },
  shadow: {
    sm: tw`shadow-sm`,
    md: tw`shadow-md`,
    lg: tw`shadow-lg`,
  },
  size: {
    xs: tw`px-1 py-0.5 text-xs`,
    sm: tw`px-2 py-1 text-sm`,
    md: tw`px-4 py-2 text-base`,
    lg: tw`px-6 py-3 text-lg`,
  },
} as const

export const variantOptions = getVariantOptions(variants)
export type Variant<V extends VariantOptions<W>, W = unknown> = keyof V
export type VariantEntries = ([Variant<typeof variantOptions>, typeof variantOptions[Variant<typeof variantOptions>]])[]

export const defaultVariants = {
  intent: 'primary',
  border: 'solid',
  shadow: 'md',
  size: 'md',
} as const

export const classes = cva([
  // tw`cursor-pointer`,
  tw`border-4`,
  // tw`hover:translate-x-0.5 hover:translate-y-0.5 hover:shadow-xs`,
  // tw`active:cursor-pointer`,
  // tw`disabled:cursor-not-allowed`,
  'inline-flex items-center justify-center whitespace-nowrap rounded-base text-sm font-base ring-offset-white transition-all gap-2 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0 focus-visible:outline-hidden focus-visible:ring-2 focus-visible:ring-black focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50',
], {
  variants,
  defaultVariants,
})

export type VariantConfig = VariantProps<typeof classes>
type Props = JSX.HTMLElementTags['button'] & VariantConfig

export const Button = (props: Props) => {
  const [local, others] = splitProps(props, ['class'])
  return (
    <button type='button' class={cx(local.class, classes(others))} {...others}>
      {props.children ?? <>&nbsp;</>}
    </button>
  )
}
