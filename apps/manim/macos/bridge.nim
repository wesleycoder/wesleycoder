import webview
import std/[json, strformat]
import ./[hotkeys, style, tray]
import ../lib/[noop, rpc]

var globalWebview: Webview

proc emit*(app: ManimApp, event: string, data: JsonNode) =
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
    "macOS_postMessage",
    proc(id: string, req: JsonNode): string =
      echo "macOS_postMessage: " & id & ($ %*req)
      if req.kind == JArray and req.len > 0:
        let payloadStr = req[0].getStr()
        return routeMessage(payloadStr)
      return "",
  )

  globalWebview.init(
    cstring js"""
    window._ManimNative = {
      postMessage: window.macOS_postMessage
    }
  """
  )

  globalWebview.navigate(url)

  globalWebview.run()
