import type { JSX } from 'solid-js'

type Props = {
  children: JSX.Element
}

export const Button = (props: Props) => {
  return (
    <button type='button' class='button'>
      {props.children ?? 'Click me!'}
    </button>
  )
}
