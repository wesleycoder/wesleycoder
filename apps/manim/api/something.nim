{.used.}
import std/[json]
import ../lib/[events, logger, rpc]

proc something*(someInput: string) {.expose.} =
  emit("ping", %*{"message": "Nim saw you type: " & someInput})
