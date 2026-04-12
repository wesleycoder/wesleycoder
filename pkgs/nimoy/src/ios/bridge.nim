{.used.}
import ../lib/rpc

type ExecuteJsCallback = proc(script: cstring) {.cdecl.}

var executeJS_Swift: ExecuteJsCallback

proc executeJS*(script: string) =
  if executeJS_Swift != nil:
    executeJS_Swift(cstring script)

proc initIos*(callback: ExecuteJsCallback) {.exportc, dynlib.} =
  executeJS_Swift = callback

var lastResponse: string
proc handleNativeMessage*(msg: cstring): cstring {.exportc, dynlib.} =
  lastResponse = $routeMessage($msg)
  return cstring lastResponse

proc initNimoy*[T](app: T = nil): T =
  return app
