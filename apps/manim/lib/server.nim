import std/[asyncdispatch, asynchttpserver, json, strformat]
import ./rpc

proc getCorsHeaders(): HttpHeaders =
  newHttpHeaders(
    [
      ("Access-Control-Allow-Origin", "*"),
      ("Access-Control-Allow-Methods", "POST, GET, OPTIONS"),
      ("Access-Control-Allow-Headers", "Content-Type"),
      ("Content-Type", "application/json; charset=utf-8"),
    ]
  )

proc handleRequest(req: Request) {.async, gcsafe.} =
  echo fmt"{req.reqMethod}: {req.url.path}{req.url.query}"

  {.cast(gcsafe).}:
    if req.reqMethod == HttpOptions:
      await req.respond(Http204, "", getCorsHeaders())
      return

    if req.url.path == "/rpc" and req.reqMethod == HttpGet:
      let connected = %*{"event": "connected"}
      await req.respond(Http200, $connected, getCorsHeaders())
      return
    elif req.url.path == "/rpc" and req.reqMethod == HttpPost:
      try:
        let responseStr = routeMessage(req.body)
        await req.respond(Http200, responseStr, getCorsHeaders())
      except Exception as e:
        let error = %*{"error": true, "message": e.msg}
        await req.respond(Http500, $error, getCorsHeaders())
      return
    if req.url.path == "" or req.url.path == "/":
      let status = %*{"status": "ok"}
      await req.respond(Http200, $status, getCorsHeaders())
      return

    let notFound = %*{"error": true, "message": "Not Found"}
    await req.respond(Http404, $notFound, getCorsHeaders())

proc startServer*(port = 0) {.async.} =
  var server = newAsyncHttpServer()

  server.listen(Port(port))
  let port = server.getPort

  echo "Server running on http://localhost:" & $port.uint16

  while true:
    if server.shouldAcceptRequest():
      await server.acceptRequest(handleRequest)
    else:
      await sleepAsync(500)
