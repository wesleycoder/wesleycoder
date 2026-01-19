// deno-lint-ignore-file jsx-button-has-type
import { ComponentTypes, getVariantOptions, tw } from '@/lib/components.ts'
import { cva, cx } from 'class-variance-authority'
import { type JSX, JSXElement, splitProps } from 'solid-js'

const variants = {} as const
export const variantOptions = getVariantOptions(variants)
export const defaultVariants = {} as const
export const classes = cva([
  // tw`inline-flex cursor-pointer gap-2`,
  // tw`border-b-4 px-2 py-1`,
  // tw`bg-background`,
  // tw`[&,&::picker(select)]:[appearance:base-select] [&::picker(select)]:flex-col [&::picker(select)]:border-none [&::picker(select):popover-open]:flex`,
], { variants, defaultVariants })

export type T = ComponentTypes<typeof variantOptions, typeof classes>
type Props = { children?: JSXElement } & T['props'] & JSX.SelectHTMLAttributes<HTMLSelectElement>

export const Select = (props: Props) => {
  const [local, others] = splitProps(props, ['class'])
  return (
    <>
      <select
        class={cx(classes(others), local.class)}
        {...others}
      >
        <button>
          <selectedcontent class='inline-flex items-center gap-2'></selectedcontent>
        </button>
        {props.children}
      </select>
    </>
  )
}

const optionClasses = cva([
  tw`field-sizing-content inline-flex gap-2`,
  tw`px-2 py-1`,
  tw`bg-background`,
  tw`checked:bg-foreground checked:text-foreground-contrast`,
  tw`hover:underline [&::checkmark]:content-none`,
], { variants, defaultVariants })

export const Option = (props: JSX.OptionHTMLAttributes<HTMLOptionElement>) => {
  const [local, others] = splitProps(props, ['class'])
  return (
    <option
      class={cx(optionClasses(others), local.class)}
      {...others}
    />
  )
}
