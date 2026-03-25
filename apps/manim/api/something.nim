{.used.}
import nimoy
import std/[json]
import ../lib/[events, logger]

proc something*(someInput: string) {.expose.} =
  emit("ping", %*{"message": "Nim saw you type: " & someInput})
