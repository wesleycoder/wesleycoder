import { Button, defaultVariants, type VariantEntries, VariantOptions, variantOptions } from '@/src/button.tsx'
import { ThemeSelect } from '@/src/theme-select.tsx'
import '@total-typescript/ts-reset'
import { cx } from 'class-variance-authority'
import { For } from 'solid-js'
import { createStore } from 'solid-js/store'

const strToBool = (s: string) => s === 'false' ? false : s === 'true' ? true : s

const initialStore: Mutable<VariantOptions> & {
  theme?: 'light' | 'dark' | null
  text: string
} = {
  text: 'Example',
  ...defaultVariants,
}

export default () => {
  const [store, setStore] = createStore(initialStore)
  return (
    <>
      <section class='flex flex-col gap-4 p-8 pb-[50vh]'>
        <h2 class='inline-flex w-full justify-between text-xl'>
          Sandbox
          <ThemeSelect />
        </h2>
        <div class={cx('flex flex-col flex-wrap items-center gap-4', store.theme)}>
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
              value={store.intent || 'primary'}
              onInput={(e) => setStore('intent', () => e.currentTarget.value as VariantOptions['intent'])}
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
              onInput={(e) => setStore('border', () => e.currentTarget.value as VariantOptions['border'])}
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
              onInput={(e) => setStore('shadow', () => e.currentTarget.value as VariantOptions['shadow'])}
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
              onInput={(e) => setStore('size', () => e.currentTarget.value as VariantOptions['size'])}
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
