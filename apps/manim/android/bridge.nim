import std/[json]
import ../lib/[log, rpc]

{.compile: "bridge.c".}

proc executeJS*(script: cstring) {.importc: "executeJS_C", cdecl.}

proc handleNativeMessage(msg: cstring): cstring {.exportc, cdecl.} =
  log "handleNativeMessage: " & $msg
  try:
    let rpcResponse = routeMessage($msg)
    log "rpcResponse: " & $rpcResponse
    let jsonStr = rpcResponse
    result = cast[cstring](alloc0(jsonStr.len + 1))
    if jsonStr.len > 0:
      copyMem(result, jsonStr[0].unsafeAddr, jsonStr.len)
  except Exception as e:
    var errorNode = %*{"error": true, "data": e.msg}
    let errStr = $e.msg
    result = cast[cstring](alloc0(errStr.len + 1))
    copyMem(result, cstring(errStr), errStr.len + 1)
