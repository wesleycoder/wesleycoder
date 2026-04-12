{.passL: "-lnats".}

import nats_raw
export nats_raw

type
  NatsError* = object of CatchableError

  NatsConn* = object
    handle: ptr natsConnection

proc `=copy`*(dest: var NatsConn, source: NatsConn) {.error.}

proc `=destroy`*(conn: var NatsConn) =
  if conn.handle != nil:
    natsConnection_Destroy(conn.handle)
    conn.handle = nil

type
  SubContext = ref object
    onMessage: proc(subject: string, data: string) {.gcsafe.}

  NatsSub* = object
    handle: ptr natsSubscription

proc `=copy`*(dest: var NatsConn, source: NatsConn) {.error.}
proc `=copy`*(dest: var NatsSub, source: NatsSub) {.error.}

proc `=destroy`*(conn: var NatsConn) =
  if conn.handle != nil:
    natsConnection_Destroy(conn.handle)
    conn.handle = nil

proc `=destroy`*(sub: var NatsSub) =
  if sub.handle != nil:
    natsSubscription_Destroy(sub.handle)
    sub.handle = nil

proc rawMsgHandler(
    nc: ptr natsConnection,
    sub: ptr natsSubscription,
    msg: ptr natsMsg,
    closure: pointer,
) {.cdecl.} =
  let dataPtr = natsMsg_GetData(msg)
  let dataLen = natsMsg_GetDataLength(msg)
  var payload = newString(dataLen)
  if dataLen > 0:
    copyMem(addr payload[0], dataPtr, dataLen)

  echo "Received message: ", payload

  natsMsg_Destroy(msg)

proc connect*(url: string): NatsConn =
  var rawPtr: ptr natsConnection
  let status = natsConnection_ConnectTo(addr rawPtr, cast[ptr uint8](cstring(url)))

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to connect: " & errText)

  result = NatsConn(handle: rawPtr)

proc publish*(conn: NatsConn, subject: string, data: string) =
  let status = natsConnection_PublishString(
    conn.handle, cast[ptr uint8](cstring(subject)), cast[ptr uint8](cstring(data))
  )

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to publish: " & errText)

proc subscribe*(conn: NatsConn, subject: string): NatsSub =
  var rawSub: ptr natsSubscription

  let status = natsConnection_Subscribe(
    addr rawSub, conn.handle, cast[ptr uint8](cstring(subject)), rawMsgHandler, nil
  )

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to subscribe: " & errText)

  result = NatsSub(handle: rawSub)
