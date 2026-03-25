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
  newHttpHeaders(
    [
      ("Access-Control-Allow-Origin", "*"),
      ("Access-Control-Allow-Methods", "POST, GET, OPTIONS"),
      ("Access-Control-Allow-Headers", "Content-Type"),
      ("Content-Type", "application/json; charset=utf-8"),
    ]
  )

const SSE_HEADERS = """
  HTTP/1.1 200 OK
  Content-Type: text/event-stream
  Cache-Control: no-cache
  Connection: keep-alive
  Access-Control-Allow-Origin: *

""".dedent
  .strip(leading = true, trailing = false)
  .replace("\n", "\r\n")

proc handleRequest(req: Request) {.async.} =
  {.cast(gcsafe).}:
    if req.reqMethod == HttpOptions:
      await req.respond(Http204, "", getCorsHeaders())
      return

    if req.url.path == "/rpc":
      case req.reqMethod
      of HttpGet:
        await req.client.send(SSE_HEADERS)
        asyncCheck req.client.send("event: connected\ndata: true\n\n")
        sseClients.add(req.client)
      of HttpPost:
        try:
          let responseStr = routeMessage(req.body)
          await req.respond(Http200, responseStr, getCorsHeaders())
        except Exception as e:
          let error = %*{"error": true, "message": e.msg}
          await req.respond(Http500, $error, getCorsHeaders())
        return
      else:
        await req.respond(Http405, "", getCorsHeaders())
        return
    else:
      await req.respond(Http404, "Not Found", getCorsHeaders())
      return

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
