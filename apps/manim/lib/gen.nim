when isMainModule:
  import std/[os, strformat, strutils]
  import ./[logger, rpc]

  const output {.strdefine.} = "./lib/rpc.ts"
  generateTsBindings(output)

  let displayPath =
    if output.absolutePath.startsWith(getHomeDir()):
      "~/" & output.absolutePath[getHomeDir().len .. ^1]
    else:
      output.absolutePath

  log.ok fmt"⚙️ RPC bindings generated at {displayPath}."
