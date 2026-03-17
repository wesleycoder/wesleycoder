#!/usr/bin/env nim r -f
import api/something
import nimoy
import lib/[logger, rpc]

const DEV_URL = "https://guimabook.local:4322/"

proc gracefullShutdown() {.noconv.} =
  echo "\n"
  log.ok "Gracefully shutting down..."
  quit(0)

when isMainModule:
  setControlCHook(gracefullShutdown)
  let app = newWebview(debug = not defined(release))
  app.initNimoy()
  app.setTitle("Manim")
  app.setSize(400, 200)
  app.navigate(DEV_URL)
  app.run()

# when defined(gen):
#   const output {.strdefine.} = "./lib/rpc.ts"
#   generateTsBindings(output)

#   let displayPath =
#     if output.absolutePath.startsWith(getHomeDir()):
#       "~/" & output.absolutePath[getHomeDir().len .. ^1]
#     else:
#       output.absolutePath

#   log.info fmt"⚙️ RPC bindings generated at {displayPath}."
#   quit(0)
# elif defined(server):
#   setControlCHook(gracefullShutdown)
#   waitFor startServer(4567)
# else:
#   log.error "Unsupported platform! Oh rly 👀? What system is this? Reach out if you really need some help :)"
#   discard
