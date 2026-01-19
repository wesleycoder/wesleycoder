import { ComponentTypes, getVariantOptions } from '@/lib/components.ts'
import { cva, cx } from 'class-variance-authority'
import { JSX, JSXElement, splitProps } from 'solid-js'

const variants = {} as const
export const variantOptions = getVariantOptions(variants)
export const defaultVariants = {} as const
export const classes = cva([
  // tw`field-sizing-content inline-flex items-center`,
  // tw`px-2 py-1`,
  // tw`border-b-4`,
], { variants, defaultVariants })

export type T = ComponentTypes<typeof variantOptions, typeof classes>
export type Props = { children?: JSXElement } & T['props'] & JSX.InputHTMLAttributes<HTMLInputElement>

export const Input = (props: Props) => {
  const [local, others] = splitProps(props, ['class'])
  return (
    <input
      class={cx(classes(others), local.class)}
      {...props}
    />
  )
}
