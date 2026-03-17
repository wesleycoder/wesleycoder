import std/json
import nimoy

when defined(server):
  import ./server

proc emit*(eventName: string, payload: JsonNode = newJObject()) {.inline.} =
  when defined(server):
    emitSSE(eventName, payload)
  else:
    let eventStr = "_RPC:" & eventName
    let payloadStr = "{ detail: " & $ %*payload & " }"
    executeJS(
      "window.dispatchEvent(new CustomEvent(" & $ %eventStr & ", " & payloadStr & "));"
    )
  discard
