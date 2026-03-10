{.used.}
import webview
import std/[json, strformat]
import ./[hotkeys, style, tray]
import ../lib/[log, noop, rpc]

var globalWebview: Webview

proc emit*(event: string, data: JsonNode) =
  if globalWebview != nil:
    let jsCode = fmt"window.__MANIM__.emit('{event}', {data});"
    globalWebview.eval(cstring jsCode)

proc runMacosApp*(url: string) =
  globalWebview = newWebview(debug = true)
  globalWebview.setTitle("Manim")
  globalWebview.setSize(400, 200)
  globalWebview.setTitle("Manim")
  globalWebview.setSize(400, 200)

  globalWebview.setupHotkeys()
  globalWebview.applyStyle(0, 0, 0, 0)
  globalWebview.initTray()

  globalWebview.bind(
    "macosIPC",
    proc(id: string, req: JsonNode): string =
      if req.kind == JArray and req.len > 0:
        for item in req:
          let payloadStr = item.getStr()
          return routeMessage(payloadStr)
      return $ %*{"error": true, "data": "Invalid IPC payload: {req}"},
  )

  globalWebview.init(
    cstring js"""
    window.__ManimNative = {
      postMessage: window.macosIPC
    }
  """
  )

  globalWebview.navigate(url)

  globalWebview.run()
