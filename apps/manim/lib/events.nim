import std/[json]
import nimoy

when defined(server):
  import ./server
else:
  import std/strformat

proc emit*(eventName: string, payload: JsonNode = newJObject()) {.inline.} =
  when defined(server):
    emitSSE(eventName, payload)
  else:
    executeJS(
      fmt"window.dispatchEvent(new CustomEvent('_RPC:{eventName}', {{ detail: {payload} }}))"
    )
  discard
