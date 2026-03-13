import std/[asyncdispatch, asynchttpserver, asyncnet, json, strutils]
import ./[logger, rpc]

proc getCorsHeaders(): HttpHeaders =
  newHttpHeaders(
    [
      ("Access-Control-Allow-Origin", "*"),
      ("Access-Control-Allow-Methods", "POST, GET, OPTIONS"),
      ("Access-Control-Allow-Headers", "Content-Type"),
      ("Content-Type", "application/json; charset=utf-8"),
    ]
  )

var sseClients*: seq[AsyncSocket]

proc broadcastSse*(eventName: string, payload: JsonNode) =
  let msg = "event: " & eventName & "\ndata: " & $payload & "\n\n"
  var activeSockets: seq[AsyncSocket]

  for client in sseClients:
    if not client.isClosed():
      try:
        asyncCheck client.send(msg)
        activeSockets.add(client)
      except:
        client.close()

  sseClients = activeSockets

proc handleRequest(req: Request) {.async, gcsafe.} =
  {.cast(gcsafe).}:
    if req.reqMethod == HttpOptions:
      await req.respond(Http204, "", getCorsHeaders())
      return

    if req.url.path == "/rpc" and req.reqMethod == HttpGet:
      let headers = """
        HTTP/1.1 200 OK
        Content-Type: text/event-stream
        Cache-Control: no-cache
        Connection: keep-alive
        Access-Control-Allow-Origin: *

      """.dedent
        .strip(leading = true, trailing = false)
        .replace("\n", "\r\n")
      await req.client.send(headers)
      sseClients.add(req.client)
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

  log "Server running on http://localhost:" & $port.uint16
  log "Local proxy on https://guimabook.local:4568"

  while true:
    if server.shouldAcceptRequest():
      await server.acceptRequest(handleRequest)
    else:
      await sleepAsync(500)
