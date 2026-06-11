import std/[httpclient, strutils, uri]

when defined(debug):
  import std/[streams, strformat]

  proc mockedResponse(body: string): Response =
    let response = new Response
    response.status = "200"
    response.bodyStream = newStringStream(body)
    response

type PastyClient* = object
  http: HttpClient
  url: Uri

proc newPastyClient*(url: string): PastyClient =
  var normalizedUrl = url
  normalizedUrl.removeSuffix('/')
  echo "normalizedUrl: " & normalizedUrl
  PastyClient(http: newHttpClient(), url: parseUri(normalizedUrl))

proc close*(pc: PastyClient) =
  pc.http.close()

proc getPasty*(pc: PastyClient, id: string): string =
  try:
    var response: Response
    when not defined(debug):
      response = pc.http.get(pc.url / id)
    else:
      response = mockedResponse(fmt"Mocked content for pasty ID: {id}")

    if not response.code.is2xx:
      raise newException(IOError, "Failed to get pasty: " & response.status)

    return response.body
  except CatchableError as e:
    raise newException(IOError, "Failed to get pasty: " & e.msg)

proc createPasty*(pc: PastyClient, body: string): (string, string) =
  var response: Response
  try:
    when not defined(debug):
      response = pc.http.post(pc.url, body)
    else:
      response = mockedResponse(fmt"""
        URL: {pc.url / "mockedId"}
        Key: mockedKey
      """.dedent)

    if not response.code.is2xx: raise newException(IOError, "Failed to create pasty: " & response.body)
  except CatchableError as e:
    raise newException(IOError, "Failed to create pasty: " & e.msg)

  let lines = response.body.strip().splitLines()
  if lines.len < 2: raise newException(ValueError, "Could not parse response: expected at least 2 lines, got: " & $lines.len)
  let id = lines[0].replace("URL: " & $pc.url & "/", "").strip()
  let key = lines[1].replace("Key: ", "").strip()
  echo "id: " & id & " | key: " & key
  (id, key)

proc updatePasty*(pc: PastyClient, id: string, key: string, body: string): Response =
  pc.http.headers = newHttpHeaders({"X-Pasty-Access-Key": key})
  pc.http.post(pc.url / id, body)

proc deletePasty*(pc: PastyClient, id: string, key: string): Response =
  pc.http.headers = newHttpHeaders({"X-Pasty-Access-Key": key})
  pc.http.delete(pc.url / id)
