import { ComponentTypes, getVariantOptions } from '@/lib/components.ts'
import { cva, cx } from 'class-variance-authority'
import { type JSX, splitProps } from 'solid-js'
import styles from './button.module.css'

const variants = {
  intent: {
    primary: styles.primary,
    secondary: styles.secondary,
    success: styles.success,
    warning: styles.warning,
    danger: styles.danger,
    info: styles.info,
  },
  mode: {
    solid: styles.solid,
    ghost: styles.ghost,
    clear: styles.clear,
    outline: styles.outline,
  },
  size: {
    xs: styles.xs,
    sm: styles.sm,
    md: styles.md,
    lg: styles.lg,
    xl: styles.xl,
  },
} as const

export const variantOptions = getVariantOptions(variants)

export const defaultVariants = {
  intent: 'primary',
  mode: 'solid',
  size: 'md',
} as const

export const classes = cva(styles.base, { variants, defaultVariants })

export type T = ComponentTypes<typeof variantOptions, typeof classes>
export type Props = T['props'] & JSX.HTMLElementTags['button']

export const Button = (props: Props) => {
  const [local, others] = splitProps(props, ['class'])
  return (
    <button type='button' class={cx(classes(others), local.class)} {...others}>
      {props.children}
    </button>
  )
}
