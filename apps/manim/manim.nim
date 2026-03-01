#!/usr/bin/env nim r -f
import std/[os, strformat]
import webview

when hostOS == "macosx":
  import os/macos/[hotkeys, style, tray]

const SRC_DIR = currentSourcePath.parentDir

proc openApp() =
  let app = newWebview()
  app.setTitle("Manim")
  app.setSize(400, 200)

  app.setupHotkeys()
  app.applyStyle(0, 0, 0, 0)
  app.initTray()

  app.navigate(cstring fmt"file://{SRC_DIR}/index.html")

  app.run()

when isMainModule:
  openApp()
