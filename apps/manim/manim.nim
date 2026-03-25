#!/usr/bin/env nim r -f
import api/something
import lib/[logger]
import nimoy

const DEV_URL = "https://guimabook.local:4322/"

proc shutdown() {.noconv.} =
  log ""
  log.ok "⏻ Gracefully shutting down..."
  quit(0)

proc main() =
  setControlCHook(shutdown)
  let app = initNimoy()
  app.setTitle("Manim")
  app.setSize(400, 200)
  app.navigate(DEV_URL)
  app.run()

when defined(gen):
  import std/os
  const srcDir = currentSourcePath().parentDir()
  generateTsBindings(srcDir & "/lib/rpc.ts")
  shutdown()
elif defined(server):
  import std/asyncdispatch
  import lib/server
  asyncCheck startServer()
elif isMainModule:
  main()
