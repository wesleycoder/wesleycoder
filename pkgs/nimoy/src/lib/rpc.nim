{.used.}
import
  std/[os, macros, json, jsonutils, tables, strformat, strutils],
  ./logger

type RpcHandler* = proc(args: JsonNode): JsonNode
var rpcRegistry* = initTable[string, RpcHandler]()
var tsMethods {.compileTime.}: seq[string]
var tsInterfaces {.compileTime.}: seq[string]
var knownInterfaces {.compileTime.}: seq[string]

proc nimTypeToTsUntyped(node: NimNode): string {.compileTime.} =
  if node.kind == nnkIdent or node.kind == nnkSym:
    let tName = $node
    case tName
    of "string": return "string"
    of "int", "float", "int32", "int64", "uint", "uint32": return "number"
    of "bool": return "boolean"
    of "JsonNode": return "any"
    of "void", "": return "void"
    else: return tName
  elif node.kind == nnkBracketExpr:
    let base = $node[0]
    if base in ["seq", "openArray"]:
      return nimTypeToTsUntyped(node[1]) & "[]"
    elif base == "Option":
      return nimTypeToTsUntyped(node[1]) & " | null"
  return "any"

proc getFieldName(node: NimNode): string {.compileTime.} =
  if node.kind == nnkPostfix: $node[1] else: $node

proc scheduleRegistration(extraRegs: NimNode, regMacro: NimNode, node: NimNode) {.compileTime.} =
  if node.kind == nnkIdent or node.kind == nnkSym:
    let name = $node
    if name notin ["string", "int", "float", "int32", "int64", "uint", "uint32", "bool", "JsonNode", "void", ""]:
      extraRegs.add(newCall(regMacro, node))
  elif node.kind == nnkBracketExpr:
    let base = $node[0]
    if base in ["seq", "openArray", "Option"]:
      scheduleRegistration(extraRegs, regMacro, node[1])

macro registerTsInterface*(T: typedesc): untyped =
  let typeSym = if T.kind == nnkBracketExpr: T[1] else: T
  if typeSym.kind != nnkSym: return newEmptyNode()

  let tName = $typeSym
  if tName in knownInterfaces: return newEmptyNode()
  knownInterfaces.add(tName)

  let impl = typeSym.getImpl()
  var extraRegs = newStmtList()
  let regMacro = bindSym("registerTsInterface")

  if impl.kind == nnkTypeDef:
    let actualType = impl[2]
    let baseType = if actualType.kind == nnkRefTy: actualType[0] else: actualType

    if baseType.kind == nnkObjectTy:
      var fields = ""
      var variants: seq[string]
      let recList = baseType[2]

      if recList.kind == nnkRecList:
        for f in recList:
          if f.kind == nnkIdentDefs:
            let fieldTypeNode = f[^2]
            let fieldTsType = nimTypeToTsUntyped(fieldTypeNode)
            scheduleRegistration(extraRegs, regMacro, fieldTypeNode)

            for i in 0 .. f.len - 3:
              let fieldName = getFieldName(f[i])
              fields &= fmt"  {fieldName}: {fieldTsType};" & "\n"

          elif f.kind == nnkRecCase:
            let discName = $f[0][0]
            scheduleRegistration(extraRegs, regMacro, f[0][^2])

            for i in 1 ..< f.len:
              let branch = f[i]
              if branch.kind == nnkOfBranch:
                var branchFields = fmt"  {discName}: '{$branch[0]}';" & "\n"
                let branchRecList = branch[^1]
                for bf in branchRecList:
                  if bf.kind == nnkIdentDefs:
                    let bFieldTypeNode = bf[^2]
                    let bFieldTsType = nimTypeToTsUntyped(bFieldTypeNode)
                    scheduleRegistration(extraRegs, regMacro, bFieldTypeNode)

                    for j in 0 .. bf.len - 3:
                      let fieldName = getFieldName(bf[j])
                      branchFields &= fmt"  {fieldName}: {bFieldTsType};" & "\n"
                variants.add(fmt"{{\n{branchFields}}}")

      if variants.len > 0:
        let unionDef = variants.join(" | ")
        if fields.len > 0:
          tsInterfaces.add(fmt"export type {tName} = {{\n{fields}}} & ({unionDef});")
        else:
          tsInterfaces.add(fmt"export type {tName} = {unionDef};")
      else:
        tsInterfaces.add(fmt"export interface {tName} {{" & "\n" & fields & "}")

    elif baseType.kind == nnkEnumTy:
      var enumValues: seq[string]
      for i in 1 ..< baseType.len:
        let field = baseType[i]
        if field.kind == nnkSym:
          enumValues.add(fmt"'{field}'")
        elif field.kind == nnkEnumFieldDef:
          enumValues.add(fmt"'{field[0]}'")
      let tsUnion = enumValues.join(" | ")
      tsInterfaces.add(fmt"export type {tName} = {tsUnion};")

  return extraRegs

macro expose*(body: untyped): untyped =
  expectKind(body, {nnkProcDef, nnkFuncDef})

  let procIdent = getFieldName(body.name)
  let procNameStr = newLit($procIdent)
  let params = body.params
  let returnType = params[0]
  let isVoid = returnType.kind == nnkEmpty or $returnType == "void"

  var tsArgs = newSeq[string]()
  var jsPayloadDict = newSeq[string]()
  var typeRegistrations = newStmtList()
  let regMacro = bindSym("registerTsInterface")

  for i in 1 ..< params.len:
    let identDefs = params[i]
    let paramTypeNode = identDefs[^2]
    let tsType = nimTypeToTsUntyped(paramTypeNode)
    typeRegistrations.add(newCall(regMacro, paramTypeNode))

    for j in 0 .. identDefs.len - 3:
      let paramName = $identDefs[j]
      tsArgs.add(fmt"{paramName}: {tsType}")
      jsPayloadDict.add(fmt"{paramName}")

  let tsRetType = if isVoid: "void" else: nimTypeToTsUntyped(returnType)
  if not isVoid:
    typeRegistrations.add(newCall(regMacro, returnType))

  let joinedTsArgs = tsArgs.join(", ")
  let joinedPayload = if jsPayloadDict.len > 0: jsPayloadDict.join(", ") else: ""

  tsMethods.add(
    fmt"""
      {procIdent}({joinedTsArgs}) {{
        return _rpcCall<{tsRetType}>({{ cmd: '{procIdent}', {joinedPayload} }})
      }},""".dedent
  )

  let argsIdent = ident("args")
  var extractStmts = newStmtList()
  var callArgs = newSeq[NimNode]()

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
    if isVoid:
      quote do: (`callExpr`; newJNull())
    elif $returnType == "JsonNode":
      quote do: `callExpr`
    else:
      quote do: toJson(`callExpr`)

  let argsCheck =
    if params.len > 1:
      quote do:
        if `argsIdent` == nil or `argsIdent`.kind != JObject:
          return %*{"error": true, "message": "Expected 'data' to be a JSON object containing the function arguments."}
    else:
      newStmtList()

  result = quote do:
    `body`
    `typeRegistrations`
    rpcRegistry[`procNameStr`] = proc(`argsIdent`: JsonNode): JsonNode =
      try:
        `argsCheck`
        `extractStmts`
        return `executeAndReturn`
      except CatchableError as e:
        emit("error", %*{"message": "Error in `" & `procNameStr` & "`: " & e.msg})
        return %*{"error": true, "message": "Error in `" & `procNameStr` & "`: " & e.msg}

macro generateTsBindings*(outputPath: static[string]): untyped =
  when defined(gen):
    let temp = slurp("./rpc.tmpl.ts")
    var fileContent = temp.replace("  // RPC methods", tsMethods.join("\n").indent(2))
    let interfacesContent = if tsInterfaces.len > 0: tsInterfaces.join("\n\n") else: ""
    fileContent = fileContent.replace("// Interfaces", interfacesContent)
    writeFile(outputPath, fileContent)
    let displayPath =
      if outputPath.startsWith(getHomeDir()):
        "~/" & outputPath[getHomeDir().len .. ^1]
      else:
        outputPath
    log.info fmt"⚙️  RPC bindings generated at {displayPath}."
    return newStmtList()
  else:
    return newStmtList()

func errorEvent*(message: string): JsonNode = %*{"event": "error", "data": message}

proc routeMessage*(payloadStr: string): JsonNode =
  try:
    let payload = parseJson(payloadStr)

    if payload.kind != JObject: return errorEvent("Invalid payload format. Expected JSON object with a 'cmd' key.")

    if not payload.hasKey("cmd"): return errorEvent("Invalid payload format. Expected JSON object with a 'cmd' key.")

    let command = payload["cmd"].getStr()
    payload.delete("cmd")

    if not rpcRegistry.hasKey(command): return errorEvent(fmt"Command `{command}` not found")

    let dataNode = rpcRegistry[command](payload)
    if dataNode.isNil: return newJNull()

    if dataNode.kind == JObject and dataNode.hasKey("error"):
      return errorEvent(dataNode["message"].getStr())
    else:
      return dataNode

  except Exception as e:
    return errorEvent(fmt"RPC parsing error: {e.msg}")
