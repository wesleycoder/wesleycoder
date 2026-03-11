import std/[json]

when defined(server):
  import ./server
elif defined(android):
  import ../android/bridge
elif defined(ios):
  import ../ios/bridge
elif defined(macosx):
  import ../macos/bridge
elif defined(linux):
  import ../linux/bridge
elif defined(windows):
  import ../windows/bridge

when not defined(server):
  import std/strformat

proc emit*(eventName: string, payload: JsonNode = newJObject()) =
  when defined(server):
    broadcastSse(eventName, payload)
  else:
    let jsPayload = $payload
    let jsCode =
      fmt"window.dispatchEvent(new CustomEvent('manim:{eventName}', {{ detail: {jsPayload} }}));"
    executeJS(jsCode)
