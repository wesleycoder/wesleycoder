import webview
import std/json
import ../lib/[log, noop, rpc]

var globalWebview: Webview

proc executeJS*(code: string) =
  if globalWebview != nil:
    globalWebview.eval(cstring code)

proc runLinuxApp*(url: string) =
  globalWebview = newWebview(debug = true)
  globalWebview.setTitle("Manim (Linux)")
  globalWebview.setSize(400, 200)

  globalWebview.bind(
    "linuxIPC",
    proc(id: string, req: JsonNode): string =
      if req.kind == JArray and req.len > 0:
        for item in req:
          let payloadStr = item.getStr()
          return routeMessage(payloadStr)
      return $ %*{"error": true, "data": "Invalid IPC payload"},
  )

  globalWebview.init(
    cstring js"""
    window.__ManimNative = {
      postMessage: window.linuxIPC
    }
  """
  )

  globalWebview.navigate(url)
  globalWebview.run()
