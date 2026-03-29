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

proc getCorsHeaders(): HttpHeaders =
  let h = newHttpHeaders()
  h.add("Access-Control-Allow-Origin", "*")
  h.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS")
  h.add("Access-Control-Allow-Headers", "Content-Type")
  h.add("Content-Type", "application/json; charset=utf-8")
  h

proc http(payload: string): string =
  (payload.dedent.strip() & "\n\n").replace("\n", "\r\n")

const SSE_PAYLOAD = """
  HTTP/1.1 200 OK
  Content-Type: text/event-stream
  Cache-Control: no-cache
  Connection: keep-alive
  Access-Control-Allow-Origin: *
""".http

proc handleRequest(req: Request) {.async.} =
  {.cast(gcsafe).}:
    try:
      if req.reqMethod == HttpOptions:
        await req.respond(Http204, "", getCorsHeaders())
        return

      if req.url.path == "/rpc":
        case req.reqMethod
        of HttpGet:
          await req.client.send(SSE_PAYLOAD)
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
          await req.respond(status, $response, getCorsHeaders())
          return
        else:
          await req.respond(Http405, "", getCorsHeaders())
          return
      else:
        await req.respond(Http404, "Not Found", getCorsHeaders())
        return
    except CatchableError as e:
      log.error "Unknown Error: " & $e.msg
      await req.respond(Http500, $e.msg, getCorsHeaders())

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
