import std/[json, strformat]

when defined(server):
  import ./server
elif hostOS == "macosx":
  import ../macos/bridge
elif hostOS == "android":
  import ../android/bridge

proc emit*(eventName: string, payload: JsonNode = newJObject()) =
  when defined(server):
    broadcastSse(eventName, payload)
  else:
    let jsPayload = $payload
    let jsCode =
      fmt"window.dispatchEvent(new CustomEvent('manim:{eventName}', {{ detail: {jsPayload} }}));"

    when hostOS == "macosx" or hostOS == "android":
      executeJS(jsCode)
