{.used.}
import
  std/[json]
  ../lib/[rpc]

{.compile: "bridge.c".}

proc executeJS_C(script: cstring) {.importc: "executeJS_C", cdecl.}

proc executeJS*(script: string) =
  executeJS_C(cstring script)

proc handleNativeMessage(msg: cstring): cstring {.exportc, cdecl.} =
  if msg == nil:
    return cast[cstring](alloc0(1))
  let jsonStr = $routeMessage($msg)
  result = cast[cstring](alloc0(jsonStr.len + 1))
  if jsonStr.len > 0:
    copyMem(result, jsonStr[0].addr, jsonStr.len)

proc initNimoy*[T](app: T = nil): T =
  return app
