import type { JSXElement } from 'solid-js'

type SomeObject<V = unknown> = Record<string, V>

export type WithChildren<T = SomeObject> = T & { children?: JSXElement }

export type VariantOptions<V> = { [K in keyof V]: (keyof V[K])[] }

/** No-op template string literal which returns the input string */
export function tw(strings: TemplateStringsArray | string, ...values: string[]) {
  if (typeof strings === 'string') return strings
  return strings.reduce((acc, str, i) => acc + str + (values[i] ?? ''), '')
}

// deno-lint-ignore no-explicit-any
export const getVariantOptions = <T extends Record<string, any>>(variants: T) =>
  Object.entries(variants).reduce((acc, [key, value]) => ({
    ...acc,
    [key]: Object.keys(value),
  }), {} as VariantOptions<typeof variants>)
