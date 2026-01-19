import { cva, cx } from 'class-variance-authority'
import { JSX, JSXElement, splitProps } from 'solid-js'
import { ComponentTypes, getVariantOptions, tw } from '../lib/components.ts'

const variants = {} as const
export const variantOptions = getVariantOptions(variants)
export const defaultVariants = {} as const
export const classes = cva([
  tw`field-sizing-content inline-flex items-center`,
  tw`px-2 py-1`,
  tw`border-b-4`,
], { variants, defaultVariants })

export type T = ComponentTypes<typeof variantOptions, typeof classes>
export type Props = { children?: JSXElement } & T['config'] & JSX.InputHTMLAttributes<HTMLInputElement>

export const Input = (props: Props) => {
  const [local, others] = splitProps(props, ['class'])
  return (
    <input
      class={cx(classes(others), local.class)}
      {...props}
    />
  )
}
