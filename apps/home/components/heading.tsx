import type { JSX } from 'solid-js'

type Props = {
  children?: JSX.Element
}

export const Heading = (props: Props) => {
  return <h1>{props.children}</h1>
}
