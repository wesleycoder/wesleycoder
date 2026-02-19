#!/usr/bin/env -S usage bash
#USAGE arg <size> help="Size in MB"
#[ Executes this script with nim passing arguments parsed by `usage`
exec nim r "$0" "$@"
]#
import os
import webview
import os/macos/hotkeys
import os/macos/style

proc openApp(url: string) =
  let w = newWebview()
  w.setTitle("Manim")
  w.setSize(400, 200)

  w.setupHotkeys()
  w.applyStyle(0, 0, 0, 0, false)

  w.navigate(url)

  w.run()

proc startServer() =
  echo os.getCurrentDir()

when isMainModule:
  startServer()
  openApp("http://localhost:4200")
