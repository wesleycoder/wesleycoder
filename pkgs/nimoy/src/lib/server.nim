import
  std/[asyncdispatch, asynchttpserver, asyncnet, json, strformat, strutils],
  ./[logger, rpc]

proc http*(payload: string): string =
  ## ```
  ## Returns an HTTP block with the given payload.
  ## Dedented and concatenated with double CRLF line endings.
  ## Intended for use with multiline string payloads.
  ##
  ## Example:
  ## ```nim
  ## let headers = """
  ##   HTTP/1.1 200 OK
  ##   Content-Type: text/event-stream
  ## """.http # => HTTP/1.1 200 OK\r\nContent-Type: text/event-stream\r\n\r\n
  ## ```
  ## ```nim
  ## let payload = """
  ##   event: "message"
  ##   data: {"content": "Hello, World!"}
  ## """.http # => event: message\r\ndata: {"content": "Hello, World!"}\r\n\r\n
  ## ```
  payload.dedent.strip().replace("\n", "\r\n") & "\r\n\r\n"

proc safeSend(client: AsyncSocket, msg: string) {.async.} =
  try:
    await client.send(msg)
  except CatchableError:
    client.close()

var sseClients: seq[AsyncSocket]
var lastMessageId = 0
var buffer: seq[string] = @[]
proc emitSSE*(eventName: string, payload: JsonNode, shouldBuffer = false) =
  let msg = fmt"""
    id: {lastMessageId}
    event: {eventName}
    data: {payload}
  """.http

  lastMessageId += 1

  if shouldBuffer: buffer.add(msg)
  if buffer.len > 1000: buffer.delete(0)

  var activeSockets: seq[AsyncSocket]

  for client in sseClients:
    if not client.isClosed():
      try:
        asyncCheck safeSend(client, msg)
        activeSockets.add(client)
      except:
        client.close()

  sseClients = activeSockets

const heartbeatIntervalMs = 25_000
proc heartbeatLoop() {.async.} =
  while true:
    await sleepAsync(heartbeatIntervalMs)

    if sseClients.len == 0: continue

    var activeSockets: seq[AsyncSocket]
    for client in sseClients:
      if not client.isClosed():
        try:
          asyncCheck safeSend(client, ":<3".http)
          activeSockets.add(client)
        except CatchableError:
          client.close()

    sseClients = activeSockets

proc handleRequest(req: Request) {.async.} =
  {.cast(gcsafe).}:
    try:
      if req.reqMethod == HttpOptions:
        await req.respond(Http204, "")
        return

      if req.url.path == "/rpc":
        case req.reqMethod
        of HttpGet:
          try:
            await req.client.safeSend(
              """
                HTTP/1.1 200 OK
                Content-Type: text/event-stream
                Cache-Control: no-cache
                Connection: keep-alive
              """.http
            )
            asyncCheck safeSend(req.client, ":<3".http)
            sseClients.add(req.client)

            let disconnect = req.client.recv(1)
            const ONE_DAY_MS = 24 * 60 * 60 * 1_000
            discard await withTimeout(disconnect, ONE_DAY_MS)
            if not req.client.isClosed():
              req.client.close()
          except CatchableError as e:
            if not req.client.isClosed():
              req.client.close()
            log.error "SSE Connect Error: " & $e.msg
          return
        of HttpPost:
          var status = Http500
          var headers = newHttpHeaders({"Content-Type": "application/json"})
          var response = %*{"error": true, "message": "Unknown error"}
          try:
            status = Http200
            response = routeMessage(req.body)
          except Exception as e:
            status = Http500
            response = %*{"error": true, "message": e.msg}
          await req.respond(status, $response, headers)
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
  when defined(gen):
    log.warn "Generation mode enabled (`-d:gen`), skipping server start"
    return

  var server = newAsyncHttpServer()

  const port = Port(4567)
  log.info "Server running on http://localhost:" & $port.uint16

  asyncCheck heartbeatLoop()

  await server.serve(port, handleRequest)
