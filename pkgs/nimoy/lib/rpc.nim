{.used.}
import std/[os, macros, json, jsonutils, tables, strformat, strutils]
import ./logger

type RpcHandler* = proc(args: JsonNode): JsonNode

var rpcRegistry* = initTable[string, RpcHandler]()

var tsMethods {.compileTime.}: seq[string]

proc nimTypeToTs(nimType: string): string {.compileTime.} =
  ## Helper to map Nim types to TS types
  case nimType
  of "string": "string"
  of "int", "float", "int32", "int64", "uint", "uint32": "number"
  of "bool": "boolean"
  of "JsonNode": "any"
  of "void", "": "void"
  else: "any"
    # Fallback for complex objects for now

macro expose*(body: untyped): untyped =
  ## Registers `proc` or `func` for RPC calls, wrapping it with JSON handling logic.
  expectKind(body, {nnkProcDef, nnkFuncDef})

  let procIdent =
    if body.name.kind == nnkPostfix:
      body.name[1]
    else:
      body.name
  let procNameStr = newLit($procIdent)
  let params = body.params
  let returnType = params[0]
  let isVoid = returnType.kind == nnkEmpty or $returnType == "void"

  var tsArgs = newSeq[string]()
  var jsPayloadDict = newSeq[string]()

  for i in 1 ..< params.len:
    let identDefs = params[i]
    let paramTypeNode = identDefs[^2]
    let tsType = nimTypeToTs($paramTypeNode)

    for j in 0 .. identDefs.len - 3:
      let paramName = $identDefs[j]
      tsArgs.add(fmt"{paramName}: {tsType}")
      jsPayloadDict.add(fmt"{paramName}")

  let tsRetType =
    if isVoid:
      "void"
    else:
      nimTypeToTs($returnType)
  let joinedTsArgs = tsArgs.join(", ")
  let joinedPayload =
    if jsPayloadDict.len > 0:
      jsPayloadDict.join(", ")
    else:
      ""

  tsMethods.add(
    fmt"""
      {procIdent}({joinedTsArgs}) {{
        return _rpcCall<{tsRetType}>({{ cmd: '{procIdent}', {joinedPayload} }})
      }},""".dedent
  )

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

  let callExpr = newCall(body.name, callArgs)

  let executeAndReturn =
    if isVoid: # void vs data
      quote:
        `callExpr`
        newJNull()
    else:
      quote:
        toJson(`callExpr`)

  let argsCheck =
    if params.len > 1:
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
        emit("error", %*{"message": "Error in `" & `procNameStr` & "`: " & e.msg})
        return
          %*{"error": true, "message": "Error in `" & `procNameStr` & "`: " & e.msg}

macro generateTsBindings*(outputPath: static[string]): untyped =
  ## Generates TypeScript bindings for RPC methods registered with `expose`.
  let temp = slurp("./rpc.tmpl.ts")
  let fileContent = temp.replace("  // RPC methods", tsMethods.join("\n").indent(2))
  writeFile(outputPath, fileContent)
  let displayPath =
    if outputPath.startsWith(getHomeDir()):
      "~/" & outputPath[getHomeDir().len .. ^1]
    else:
      outputPath
  log.info fmt"⚙️  RPC bindings generated at {displayPath}."
  return newStmtList()

proc routeMessage*(payloadStr: string): JsonNode =
  ## Routes an incoming JSON RPC message to the appropriate RPC handler
  ## Returns a JSON response node.
  try:
    let payload = parseJson(payloadStr)

    log.debug "rpc.nim received: " & payloadStr

    if payload.kind != JObject:
      return %*{
        "event": "error",
        "data": "Invalid payload format. Expected JSON object with a 'cmd' key.",
      }

    if payload.hasKey("event"):
      case payload["event"].getStr()
      of "ping":
        return %*{"event": "pong"}
      of "pong":
        return
      else:
        let event = payload["event"].getStr()
        return %*{"event": "error", "data": fmt"Unknown event '{event}'"}

    let command = payload["cmd"].getStr()
    payload.delete("cmd")
    let args = payload

    if rpcRegistry.hasKey(command):
      let dataNode = rpcRegistry[command](args)
      if dataNode.kind == JObject and dataNode.hasKey("error"):
        return %*{"event": "error", "data": dataNode["message"]}
      else:
        return %*dataNode
    else:
      return %*{"event": "error", "data": fmt"Command '{command}' not found"}
  except Exception as e:
    return %*{"event": "error", "data": fmt"RPC parsing error: {e.msg}"}
