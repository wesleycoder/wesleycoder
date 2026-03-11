import std/[json, strformat]

when defined(server):
  import ./server
elif defined(android):
  import ../android/bridge
elif defined(ios):
  import ../ios/bridge
elif defined(macosx):
  import ../macos/bridge

proc emit*(eventName: string, payload: JsonNode = newJObject()) =
  when defined(server):
    broadcastSse(eventName, payload)
  else:
    let jsPayload = $payload
    let jsCode =
      fmt"window.dispatchEvent(new CustomEvent('manim:{eventName}', {{ detail: {jsPayload} }}));"

    when hostOS in ["macosx", "android", "ios"]:
      executeJS(jsCode)
