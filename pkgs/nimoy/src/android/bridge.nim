{.used.}
import std/[json, strformat]
import ../lib/[logger, rpc]

{.compile: "bridge.c".}

proc executeJS_C(script: cstring) {.importc: "executeJS_C", cdecl.}

proc executeJS*(script: string) =
  executeJS_C(cstring script)

proc handleNativeMessage(msg: cstring): cstring {.exportc, cdecl.} =
  try:
    let jsonStr = $routeMessage($msg)
    result = cast[cstring](alloc0(jsonStr.len + 1))
    if jsonStr.len > 0:
      copyMem(result, jsonStr[0].unsafeAddr, jsonStr.len)
  except Exception as e:
    let errStr = $e.msg
    var errorNode =
      %*{"error": true, "message": fmt"🤖 handleNativeMessage: {$msg}\n\n{errStr}"}
    result = cast[cstring](alloc0(errStr.len + 1))
    copyMem(result, cstring(errStr), errStr.len + 1)

proc initNimoy*[T](app: T = nil): T =
  return app
