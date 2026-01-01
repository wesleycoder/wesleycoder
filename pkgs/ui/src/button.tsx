import { cva, cx, type VariantProps } from 'class-variance-authority'
import { type JSX, splitProps } from 'solid-js'
import { getVariantOptions, tw, VariantOptions } from '../lib/components.ts'

const variants = {
  intent: {
    primary: tw`bg-primary-contrast text-primary`,
    secondary: tw`bg-transparent text-foreground-contrast`,
    success: tw`bg-success-contrast text-success`,
    warning: tw`bg-warning-contrast text-warning`,
    error: tw`bg-error-contrast text-error`,
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
  tw`border-4`,
  tw`inline-flex items-center justify-center gap-2`,
  tw`whitespace-nowrap rounded-base`,
  tw`font-base text-sm`,
  tw`ring-offset-white`,
  tw`transition-all`,
  tw`focus-visible:outline-hidden focus-visible:ring-2 focus-visible:ring-black focus-visible:ring-offset-2`,
  tw`disabled:pointer-events-none disabled:cursor-not-allowed disabled:opacity-50`,
  tw`[&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0`,
  tw`cursor-pointer`,
  tw`hover:scale-102`,
  tw`active:translate-x-0.5 active:translate-y-0.5 active:shadow-xs`,
], {
  variants,
  defaultVariants,
})

export type VariantConfig = VariantProps<typeof classes>
type Props = JSX.HTMLElementTags['button'] & VariantConfig

export const Button = (props: Props) => {
  const [local, others] = splitProps(props, ['class'])
  return (
    <button type='button' class={cx(classes(others), local.class)} {...others}>
      {props.children ?? <>&nbsp;</>}
    </button>
  )
}
