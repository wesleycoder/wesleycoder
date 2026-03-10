#!/usr/bin/env nim r -f
import std/[asyncdispatch, os, strformat]
import api/something
import lib/[log]
import lib/server

when hostOS == "macosx":
  import webview
  import macos/[bridge, hotkeys, style, tray]

when hostOS == "android":
  import android/bridge

const WEB_DIST_DIR = fmt"{currentSourcePath.parentDir}/dist"

proc ctrlCHandler() {.noconv.} =
  log "\nGracefully shutting down..."
  quit(0)

proc main() =
  if paramCount() > 0 and paramStr(1) == "serve":
    log "Serving..."
    waitFor startServer(4567)
  else:
    when hostOS == "macosx":
      runMacosApp("http://dev.guima.localhost/")
    elif hostOS == "android":
      discard # controlled by native Android lifecycle

when isMainModule:
  setControlCHook(ctrlCHandler)
  main()
