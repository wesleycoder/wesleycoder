{.used.}
import
  nimoy,
  std/[json, strformat],
  ../lib/logger

proc something*(someInput: string): JsonNode {.expose.} =
  emit("some_input", %*{"message": "Nim saw you type: " & someInput})

  if someInput.len > 10: raise newException(ValueError, fmt"Input too long: {someInput}, expected max 10 characters")
  return nil
