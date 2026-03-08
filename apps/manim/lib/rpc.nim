import std/[macros, json, jsonutils, tables, strformat]

type
  EventHandler* = proc(data: JsonNode): JsonNode
  RpcHandler* = proc(args: JsonNode): JsonNode
  ManimApp* = ref object
    handlers*: Table[string, EventHandler]

var rpcRegistry* = initTable[string, RpcHandler]()

macro expose*(body: untyped): untyped =
  ## Registers `proc` or `func` for RPC calls, wrapping it with JSON handling logic.
  expectKind(body, {nnkProcDef, nnkFuncDef})

  let procName = body.name
  let procNameStr = newLit($procName)
  let params = body.params
  let returnType = params[0]
  let requiresArgs = params.len > 1

  let argsIdent = ident("args")
  var extractStmts = newStmtList()
  var callArgs = newSeq[NimNode]()

  # JSON extraction statements for each parameter
  for i in 1 ..< params.len:
    let identDefs = params[i]
    let paramType = identDefs[^2]

    for j in 0 .. identDefs.len - 3:
      let paramName = identDefs[j]
      let paramNameStr = newLit($paramName)
      extractStmts.add quote do:
        let `paramName` = jsonTo(`argsIdent`[`paramNameStr`], `paramType`)
      callArgs.add paramName

  let callExpr = newCall(procName, callArgs)

  let executeAndReturn =
    if returnType.kind == nnkEmpty: # void vs data
      quote:
        `callExpr`
        newJNull()
    else:
      quote:
        toJson(`callExpr`)

  let argsCheck =
    if requiresArgs:
      quote:
        if `argsIdent` == nil or `argsIdent`.kind != JObject:
          return %*{
            "error": true,
            "message":
              "Expected 'data' to be a JSON object containing the function arguments.",
          }
    else:
      newStmtList()

  result = quote:
    `body` # Original proc
    rpcRegistry[`procNameStr`] = proc(`argsIdent`: JsonNode): JsonNode =
      try:
        `argsCheck`
        `extractStmts`
        return `executeAndReturn`
      except CatchableError as e:
        return %*{"error": true, "message": e.msg}

proc routeMessage*(payloadStr: string): string =
  ## Routes an incoming JSON RPC message to the appropriate RPC handler
  try:
    let payload = parseJson(payloadStr)
    let eventName = payload["event"].getStr()
    let args = payload.getOrDefault("data")

    if rpcRegistry.hasKey(eventName):
      let dataNode = rpcRegistry[eventName](args)
      if dataNode.kind == JObject and dataNode.hasKey("error"):
        return $ %*{"event": "error", "data": dataNode["message"]}
      else:
        return $ %*dataNode
    else:
      return $ %*{"event": "error", "data": fmt"Method '{eventName}' not found"}
  except Exception as e:
    return $ %*{"event": "error", "data": "RPC parsing error: " & e.msg}
