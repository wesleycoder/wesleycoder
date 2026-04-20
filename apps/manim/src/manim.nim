#!/usr/bin/env nim r -f
import
  api/something,
  lib/[logger],
  nimoy

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

when isMainModule:
  main()
