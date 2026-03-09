import std/[os, strformat]
# import api/something
import lib/[log, rpc]

when hostOS == "macosx":
  import webview
  import macos/[bridge, hotkeys, style, tray]

when hostOS == "android":
  import android/bridge

const WEB_DIST_DIR = fmt"{currentSourcePath.parentDir}/dist"

proc something*(someInput: string): string {.expose.} =
  log "something: " & someInput
  "here goes anything: " & someInput

proc main*() =
  when hostOS == "macosx":
    runMacosApp("http://localhost:4321/")
  elif hostOS == "android":
    discard # controlled by native Android lifecycle
