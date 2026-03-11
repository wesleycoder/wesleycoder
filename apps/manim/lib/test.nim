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
