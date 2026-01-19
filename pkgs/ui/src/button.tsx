import { cva, cx } from 'class-variance-authority'
import { type JSX, splitProps } from 'solid-js'
import { ComponentTypes, getVariantOptions, tw } from '../lib/components.ts'
import styles from './button.module.css'

const variants = {
  intent: {
    primary: tw`bg-primary-contrast text-primary`,
    secondary: tw`bg-transparent text-background-contrast`,
    success: tw`bg-success-contrast text-success`,
    warning: tw`bg-warning-contrast text-warning`,
    error: tw`bg-error-contrast text-error`,
    info: tw`bg-info-contrast text-info`,
  },
  border: {
    none: tw`border-none`,
    solid: tw`border-solid`,
    dashed: tw`border-dashed`,
    dotted: tw`border-dotted`,
    double: tw`border-double`,
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

export const defaultVariants = {
  intent: 'primary',
  border: 'solid',
  shadow: 'md',
  size: 'md',
} as const

export const classes = cva(styles.base, { variants, defaultVariants })

export type T = ComponentTypes<typeof variantOptions, typeof classes>
type Props = T['config'] & JSX.HTMLElementTags['button']

export const Button = (props: Props) => {
  const [local, others] = splitProps(props, ['class'])
  return (
    <button type='button' class={cx(classes(others), local.class)} {...others}>
      {props.children}
    </button>
  )
}
