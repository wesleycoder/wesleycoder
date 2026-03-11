#!/usr/bin/env nim r -f
import std/[os, strformat]
import api/something
import lib/[log, rpc]

const WEB_DIST_DIR = fmt"{currentSourcePath.parentDir}/dist"
const DEV_URL = "https://guimabook.local:4322/"

proc gracefullShutdown() {.noconv.} =
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

  setControlCHook(gracefullShutdown)
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
  import macos/bridge
  setControlCHook(gracefullShutdown)
  runMacosApp(DEV_URL)
elif defined(linux) and isMainModule:
  echo "[Linux] Booting up native wrapper..."
  import webview
  import linux/bridge
  setControlCHook(gracefullShutdown)

  echo "[Linux] Calling runLinuxApp..."
  runLinuxApp(DEV_URL)
  echo "[Linux] App closed gracefully."
elif defined(windows) and isMainModule:
  import webview
  import windows/bridge
  setControlCHook(gracefullShutdown)
  runWindowsApp(DEV_URL)
else:
  echo "Unsupported platform"
  discard
