// deno-lint-ignore-file ban-types
type SomeObject<V = unknown> = Record<string, V>

type Prettify<T> =
  & { [K in keyof T]: T[K] extends SomeObject ? Prettify<T[K]> : T[K] }
  & {}

type Mutable<T> = {
  -readonly [K in keyof T]: T[K]
}

type OnlyValues<T extends SomeObject> = Prettify<
  Mutable<
    Required<
      {
        [K in keyof T]: T[K] & {}
      }
    >
  >
>
