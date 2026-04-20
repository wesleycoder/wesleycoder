import
  std/[json]

when defined(server):
  import ./server
else:
  import std/strformat

when defined(macosx):
  import ../macosx/bridge
elif defined(windows):
  import ../windows/bridge
elif defined(linux):
  import ../linux/bridge
elif defined(android):
  import ../android/bridge
elif defined(ios):
  import ../ios/bridge

proc emit*(eventName: string, payload: JsonNode = newJObject()) {.inline.} =
  ## ```
  ## Emits an event with the given name and payload to either the IPC bus or the RPC bridge.
  ## Example:
  ## ```nim
  ## emit("move", %*{ x: 42, y: 42 })
  ## ```
  when defined(server):
    emitSSE(eventName, payload)
  else:
    executeJS(fmt"window.dispatchEvent(new CustomEvent('_NIMOY:{eventName}', {{ detail: {payload} }}))")
  discard
