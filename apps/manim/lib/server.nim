import std/[asyncdispatch, asynchttpserver, asyncnet, json, strutils]
import nimoy
import ./[logger]

var sseClients: seq[AsyncSocket]

proc emitSSE*(eventName: string, payload: JsonNode) =
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

proc http(payload: string): string =
  (payload.dedent.strip() & "\n\n").replace("\n", "\r\n")

proc handleRequest(req: Request) {.async.} =
  {.cast(gcsafe).}:
    try:
      if req.reqMethod == HttpOptions:
        await req.respond(Http204, "")
        return

      if req.url.path == "/rpc":
        case req.reqMethod
        of HttpGet:
          await req.client.send(
            """
              HTTP/1.1 200 OK
              Content-Type: text/event-stream
              Cache-Control: no-cache
              Connection: keep-alive
            """.http
          )
          asyncCheck req.client.send("event: connected\ndata: true\n\n")
          sseClients.add(req.client)
          return
        of HttpPost:
          var status = Http500
          var response = %*{"error": true, "message": "Unknown error"}
          try:
            response = routeMessage(req.body)
            status = Http200
          except Exception as e:
            status = Http500
            response = %*{"error": true, "message": e.msg}
          await req.respond(status, $response)
          return
        else:
          await req.respond(Http405, "")
          return
      else:
        await req.respond(Http404, "Not Found")
        return
    except CatchableError as e:
      log.error "Unknown Error: " & $e.msg
      await req.respond(Http500, $e.msg)

proc startServer*() {.async.} =
  var server = newAsyncHttpServer()

  server.listen(Port(4567))
  let port = server.getPort

  log.info "Server running on http://localhost:" & $port.uint16
  log.info "Local proxy on https://guimabook.local:" & $(port.uint16 + 1)

  while true:
    if server.shouldAcceptRequest():
      waitFor server.acceptRequest(handleRequest)
    else:
      waitFor sleepAsync(500)
