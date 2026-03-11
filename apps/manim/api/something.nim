{.used.}
import std/[json]
import ../lib/[events, log, rpc]

proc something*(someInput: string): string {.expose.} =
  emit("ping", %*{"message": "Nim saw you type: " & someInput})
  "here goes anything: " & someInput
