import
  webview
  std/json
  ../lib/[logger, noop, rpc]

var app: Webview

proc executeJS*(code: string) =
  if app != nil:
    discard app.eval(cstring code)

proc nativeIPC(id: string, req: JsonNode): string =
  if req.kind == JArray and req.len > 0:
    for item in req:
      let payloadStr = item.getStr()
      return $routeMessage(payloadStr)
  return $ %*{"error": true, "data": "Invalid IPC payload: " & $ %*req}

proc initNimoy*(app: Webview) =
  app.bind("__nimoyIPC", nativeIPC)
  app.init(cstring js"window.__Nimoy = { postMessage: window.__nimoyIPC }")
