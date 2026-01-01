// deno-lint-ignore-file no-explicit-any
import { cx } from 'class-variance-authority'
import { JSX, Ref, splitProps } from 'solid-js'

export function mergeRefs<T>(
  ...refs: (Ref<T> | undefined)[]
): Ref<T> {
  return (node: T) => {
    for (const ref of refs) {
      if (typeof ref === 'function') {
        ;(ref as (node: T) => void)(node)
      } else if (ref && typeof ref === 'object') {
        ;(ref as any).current = node
      }
    }
  }
}

export const combineProps = (slotProps: any, childProps: any) => ({
  ...slotProps,
  ...childProps,
  class: cx(slotProps.class, childProps.class),
  style: { ...slotProps.style, ...childProps.style },
  ref: mergeRefs(slotProps.ref, childProps.ref),
})

export type SlotProps = JSX.HTMLAttributes<HTMLElement> & {
  children: (props: JSX.HTMLAttributes<HTMLElement>) => JSX.Element
}

export function Slot(props: SlotProps) {
  const [local, elementProps] = splitProps(props, ['children'])

  return local.children(elementProps)
}
