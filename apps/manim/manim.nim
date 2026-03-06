#!/usr/bin/env nim r -f
import std/[os, strformat]

when hostOS == "macosx":
  import webview
  import macos/[hotkeys, style, tray]

when hostOS == "android":
  import android/bridge

const WEB_DIST_DIR = fmt"{currentSourcePath.parentDir}/dist"

proc openApp() =
  when hostOS == "macosx":
    let app = newWebview()
    app.setTitle("Manim")
    app.setSize(400, 200)

    app.setupHotkeys()
    app.applyStyle(0, 0, 0, 0)
    app.initTray()

    app.navigate("http://localhost:4321/")

    app.run()

  when hostOS == "android":
    echo "Nim App started!"
    discard

when isMainModule:
  openApp()
