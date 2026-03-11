#!/usr/bin/env nim r -f
import std/[os, strformat]
import api/something
import lib/[log, rpc]

const WEB_DIST_DIR = fmt"{currentSourcePath.parentDir}/dist"

proc ctrlCHandler() {.noconv.} =
  echo "\nManimApp: Gracefully shutting down..."
  quit(0)

when defined(gen):
  import std/strutils

  const output {.strdefine.} = "./lib/rpc.ts"
  generateTsBindings(output)

  let displayPath =
    if output.absolutePath.startsWith(getHomeDir()):
      "~/" & output.absolutePath[getHomeDir().len .. ^1]
    else:
      output.absolutePath

  log fmt"⚙️ RPC bindings generated at {displayPath}."
  quit(0)
elif defined(server):
  import std/asyncdispatch
  import lib/server

  setControlCHook(ctrlCHandler)
  waitFor startServer(4567)
elif defined(android):
  import android/bridge
  discard # controlled by Android lifecycle
elif defined(ios):
  import ios/bridge

  proc NimMain() {.importc.}
  proc initNimGC*() {.exportc, cdecl.} =
    NimMain()

  discard # controlled by iOS lifecycle
elif defined(macosx) and isMainModule:
  import webview
  import macos/[bridge, hotkeys, style, tray]
  setControlCHook(ctrlCHandler)
  runMacosApp("http://dev.guima.localhost/")
