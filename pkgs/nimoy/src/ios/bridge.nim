{.used.}
import
  std/[json]
  ../lib/rpc

type ExecuteJsCallback = proc(script: cstring) {.cdecl.}

var executeJS_Swift: ExecuteJsCallback

proc executeJS*(script: string) =
  if executeJS_Swift != nil:
    executeJS_Swift(cstring script)

proc initIos*(callback: ExecuteJsCallback) {.exportc, dynlib.} =
  executeJS_Swift = callback

proc handleNativeMessage(msg: cstring): cstring {.exportc, cdecl.} =
  if msg == nil:
    return cast[cstring](alloc0(1))
  let jsonStr = $routeMessage($msg)
  result = cast[cstring](alloc0(jsonStr.len + 1))
  if jsonStr.len > 0:
    copyMem(result, jsonStr[0].addr, jsonStr.len)

proc initNimoy*[T](app: T = nil): T =
  return app
