{.used.}
import
  webview,
  std/json,
  ../lib/[logger, noop, rpc],
  ./[hotkeys, style, tray]

var app: Webview

proc executeJS*(code: string) =
  if app != nil:
    app.eval(cstring code)

proc nativeIPC(id: string, req: JsonNode): string =
  if req.kind == JArray and req.len > 0:
    for item in req:
      let payloadStr = item.getStr()
      return $routeMessage(payloadStr)
  return $ %*{"error": true, "data": "Invalid IPC payload: " & $ %*req}

proc initNimoy*(app: Webview = newWebview(debug = not defined(release))): Webview =
  app.setupHotkeys()
  app.applyStyle(0, 0, 0, 0.5)
  app.initTray()
  app.bindCallback("__nimoyIPC", nativeIPC)
  app.init(cstring js"window.__Nimoy = { postMessage: window.__nimoyIPC }")
  return app
