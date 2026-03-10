{.used.}
import ../lib/[log, rpc]

proc something*(someInput: string): string {.expose.} =
  echo "something: " & someInput
  "here goes anything: " & someInput
