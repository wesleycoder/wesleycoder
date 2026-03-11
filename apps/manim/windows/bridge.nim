import webview
import std/json
import ../lib/[log, noop, rpc]

var globalWebview: Webview

proc executeJS*(code: string) =
  if globalWebview != nil:
    globalWebview.eval(cstring code)

proc runWindowsApp*(url: string) =
  globalWebview = newWebview(debug = true)

  when defined(linux):
    force_solid_window(globalWebview)

  globalWebview.setTitle("Manim")
  globalWebview.setSize(800, 200)

  globalWebview.bind(
    "nativeIPC",
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
      postMessage: window.nativeIPC
    };
  """
  )

  globalWebview.navigate(url)
  globalWebview.run()
