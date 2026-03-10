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
elif isMainModule and hostOS == "macosx":
  import webview
  import macos/[bridge, hotkeys, style, tray]
  setControlCHook(ctrlCHandler)
  runMacosApp("http://dev.guima.localhost/")
elif hostOS == "android":
  import android/bridge
  discard # controlled by native Android lifecycle
