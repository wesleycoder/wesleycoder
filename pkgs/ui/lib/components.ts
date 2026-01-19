import { VariantProps } from 'class-variance-authority'
import type { JSXElement } from 'solid-js'

export type WithChildren<T = SomeObject> = T & { children?: JSXElement }

export type VariantOptions<V> = { [K in keyof V]: (keyof V[K])[] }

/** No-op template string literal which returns the input string */
export function tw(strings: TemplateStringsArray | string, ...values: string[]) {
  if (typeof strings === 'string') return strings
  return strings.reduce((acc, str, i) => acc + str + (values[i] ?? ''), '')
}

/** Utility to expose component types that uses class-variance-authority */
// deno-lint-ignore no-explicit-any
export type ComponentTypes<V extends any, C extends (props?: any) => string> = {
  keys: keyof V
  entries: ([keyof V, V[keyof V]])[]
  props: VariantProps<C>
}

/** Utility to expose variant options object */
// deno-lint-ignore no-explicit-any
export const getVariantOptions = <T extends Record<string, any>>(variants: T) =>
  Object.entries(variants).reduce((acc, [key, value]) => ({
    ...acc,
    [key]: Object.keys(value),
  }), {} as VariantOptions<typeof variants>)
