import std/[json, strformat]

{.compile: "bridge.c".}

proc executeJS*(script: cstring) {.importc: "executeJS_C", cdecl.}

proc handleNativeMessage(msg: cstring): cstring {.exportc, cdecl.} =
  try:
    let payload = parseJson($msg)
    let event = payload["event"].str

    echo fmt"Received in NIM: {event}", payload["data"].str
    executeJS("console.log('this came from executeJS in NIM')")

    var response = %*{"event": fmt"{event}_response", "data": "hello from nim"}
    let jsonStr = $response
    result = cast[cstring](alloc0(jsonStr.len + 1))

    if jsonStr.len > 0:
      copyMem(result, jsonStr[0].unsafeAddr, jsonStr.len)
  except Exception as e:
    var errorNode = %*{"event": "error", "data": e.msg}
    let errStr = $errorNode
    result = cast[cstring](alloc0(errStr.len + 1))
    copyMem(result, cstring(errStr), errStr.len + 1)
