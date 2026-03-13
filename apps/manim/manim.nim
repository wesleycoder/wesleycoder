#!/usr/bin/env nim r -f
import std/[os, strformat]
import api/something
import lib/[logger, rpc]

const WEB_DIST_DIR = fmt"{currentSourcePath.parentDir}/dist"
const DEV_URL = "https://guimabook.local:4322/"

proc gracefullShutdown() {.noconv.} =
  echo "\n"
  log.info "Gracefully shutting down..."
  quit(0)

when defined(gen):
  import std/strutils
elif defined(server):
  import std/asyncdispatch
  import lib/server
elif defined(android):
  import android/bridge
elif defined(ios):
  import ios/bridge
elif isMainModule and defined(macosx):
  import webview
  import macos/bridge
elif isMainModule and defined(linux):
  import webview
  import linux/bridge
elif isMainModule and defined(windows):
  import webview
  import windows/bridge

when defined(gen):
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
  setControlCHook(gracefullShutdown)
  waitFor startServer(4567)
elif defined(android):
  discard # controlled by Android lifecycle
elif defined(ios):
  proc NimMain() {.importc.}
  proc initNimGC*() {.exportc, cdecl.} =
    NimMain()

  discard # controlled by iOS lifecycle
elif defined(macosx) and isMainModule:
  setControlCHook(gracefullShutdown)
  runMacosApp(DEV_URL)
elif defined(linux) and isMainModule:
  setControlCHook(gracefullShutdown)
  runLinuxApp(DEV_URL)
elif defined(windows) and isMainModule:
  setControlCHook(gracefullShutdown)
  runWindowsApp(DEV_URL)
else:
  log "Unsupported platform! Oh rly 👀? What system is this? Reach out if you really need some help :)"
  discard
