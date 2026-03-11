{.used.}
import ../lib/rpc

type ExecuteJsCallback = proc(script: cstring) {.cdecl.}

var swiftExecuteJs: ExecuteJsCallback

proc initManimIos*(callback: ExecuteJsCallback) {.exportc, dynlib.} =
  swiftExecuteJs = callback

proc executeJS*(script: string) =
  if swiftExecuteJs != nil:
    swiftExecuteJs(cstring script)

var lastResponse: string
proc handleNativeMessage*(msg: cstring): cstring {.exportc, dynlib.} =
  lastResponse = routeMessage($msg)
  return cstring lastResponse
