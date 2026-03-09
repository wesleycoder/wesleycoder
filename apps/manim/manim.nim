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
  echo "\nGracefully shutting down..."
  quit(0)

proc main() =
  if paramCount() > 0 and paramStr(1) == "serve":
    echo "Serving..."
    waitFor startServer(4567)
  else:
    when hostOS == "macosx":
      runMacosApp("http://localhost:4321/")
    elif hostOS == "android":
      discard # controlled by native Android lifecycle

when isMainModule:
  setControlCHook(ctrlCHandler)
  main()
