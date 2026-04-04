{.used.}
import nimoy
import std/[json, strformat]
import ../lib/[events, logger]

proc something*(someInput: string) {.expose.} =
  emit("_RPC:ping", %*{"message": "Nim saw you type: " & someInput})

  if someInput.len > 10:
    raise newException(
      ValueError, fmt"Input too long: {someInput}, expected max 10 characters"
    )
