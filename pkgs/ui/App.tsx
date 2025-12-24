import '@total-typescript/ts-reset'
import { cx, VariantProps } from 'class-variance-authority'
import { For } from 'solid-js'
import { createStore } from 'solid-js/store'
import { tw } from './lib/components.ts'
import { Button, type classes, defaultVariants, type VariantEntries, variantOptions } from './src/button.tsx'

const strToBool = (s: string) => s === 'false' ? false : s === 'true' ? true : s

type Prettify<T> =
  & {
    [K in keyof T]: T[K]
  }
  // deno-lint-ignore ban-types
  & {}

type Mutable<T> = {
  -readonly [K in keyof T]: T[K]
}

const initialStore: Mutable<VariantProps<typeof classes>> & {
  theme: 'light' | 'dark' | null
  text: string
} = {
  theme: 'dark',
  text: 'Example',
  ...defaultVariants,
}

export default () => {
  const [store, setStore] = createStore(initialStore)
  const toggleTheme = () => setStore('theme', (t) => t === 'light' ? 'dark' : 'light')
  return (
    <>
      <section class={cx(tw`flex flex-col gap-4 bg-background p-8 pb-[50vh] text-foreground`, store.theme)}>
        <h2 class='inline-flex w-full justify-between text-xl'>
          Sandbox
          <Button class='h-7 w-7' size='xs' onClick={toggleTheme}>{store.theme === 'light' ? '☀︎' : '☽'}</Button>
        </h2>
        <div class='flex flex-col flex-wrap items-center gap-4'>
          <Button {...store}>{store.text.trim() || 'Default Text'}</Button>
        </div>
        <form>
          <fieldset>
            <label for='text-input'>
              Text:
            </label>
            <input
              type='text'
              id='text-input'
              value={store.text}
              onInput={(e) => setStore('text', e.currentTarget.value)}
            />
          </fieldset>
          <fieldset>
            <label for='intent-input'>
              Intent:
            </label>
            <select
              id='intent-input'
              value={store.intent ? store.intent : 'none'}
              onInput={(e) => setStore('intent', () => e.currentTarget.value as VariantProps<typeof classes>['intent'])}
            >
              <For each={variantOptions.intent}>
                {(intent) => <option value={intent} selected={intent === store.intent}>{intent}</option>}
              </For>
            </select>
          </fieldset>
          <fieldset>
            <label for='border-input'>
              Border:
            </label>
            <select
              id='border-input'
              value={store.border ? store.border : 'none'}
              onInput={(e) => setStore('border', () => e.currentTarget.value as VariantProps<typeof classes>['border'])}
            >
              <For each={variantOptions.border}>
                {(border) => <option value={border} selected={border === store.border}>{border}</option>}
              </For>
            </select>
          </fieldset>
          <fieldset>
            <label for='shadow-input'>
              Shadow:
            </label>
            <select
              id='shadow-input'
              value={store.shadow ? store.shadow : 'none'}
              onInput={(e) => setStore('shadow', () => e.currentTarget.value as VariantProps<typeof classes>['shadow'])}
            >
              <For each={variantOptions.shadow}>
                {(shadow) => <option value={shadow} selected={shadow === store.shadow}>{shadow}</option>}
              </For>
            </select>
          </fieldset>
          <fieldset>
            <label for='size-input'>
              Size:
            </label>
            <select
              id='size-input'
              value={store.size ? store.size : 'md'}
              onInput={(e) => setStore('size', () => e.currentTarget.value as VariantProps<typeof classes>['size'])}
            >
              <For each={variantOptions.size}>
                {(size) => <option value={size} selected={size === store.size}>{size}</option>}
              </For>
            </select>
          </fieldset>
        </form>
        {(Object.entries(variantOptions) as VariantEntries).map(([key, option]) => (
          <>
            <h2 class='text-xl capitalize'>{key}</h2>
            <div class='flex flex-col flex-wrap items-center gap-4'>
              {option.map((v) => (
                <Button {...{ [key]: v }}>
                  {!strToBool(v) ? `${key}="false"` : `${key}="${v}"${defaultVariants[key] === v ? ' (default)' : ''}`}
                </Button>
              ))}
            </div>
          </>
        ))}
      </section>
    </>
  )
}
