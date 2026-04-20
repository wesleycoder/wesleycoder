import
  nats_raw
  std/[options, strutils]
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
  NatsOptions* = object
    handle: ptr natsOptions

  SubContext = ref object
    onMessage: proc(subject: string, replyTo: string, data: string) {.gcsafe.}

  NatsSub* = object
    handle: ptr natsSubscription
    ctx: SubContext

  NatsJetStream* = object
    handle: ptr jsCtx

  NatsStreamInfo* = object
    handle: ptr jsStreamInfo

  NatsKV* = object
    handle: ptr kvStore

proc `=copy`*(dest: var NatsOptions, source: NatsOptions) {.error.}
proc `=destroy`*(opts: var NatsOptions) =
  if opts.handle != nil:
    natsOptions_Destroy(opts.handle)
    opts.handle = nil

proc `=copy`*(dest: var NatsSub, source: NatsSub) {.error.}
proc `=destroy`*(sub: var NatsSub) =
  if sub.handle != nil:
    natsSubscription_Destroy(sub.handle)
    sub.handle = nil

proc `=copy`*(dest: var NatsJetStream, source: NatsJetStream) {.error.}
proc `=destroy`*(js: var NatsJetStream) =
  if js.handle != nil:
    jsCtx_Destroy(js.handle)
    js.handle = nil

proc `=copy`*(dest: var NatsStreamInfo, source: NatsStreamInfo) {.error.}
proc `=destroy`*(info: var NatsStreamInfo) =
  if info.handle != nil:
    jsStreamInfo_Destroy(info.handle)
    info.handle = nil

proc `=copy`*(dest: var NatsKV, source: NatsKV) {.error.}
proc `=destroy`*(kv: var NatsKV) =
  if kv.handle != nil:
    kvStore_Destroy(kv.handle)
    kv.handle = nil

proc newNatsOptions*(): NatsOptions =
  var rawOpts: ptr natsOptions
  let status = natsOptions_Create(addr rawOpts)
  if status != natsStatus.NATS_OK:
    raise newException(NatsError, "Failed to create NATS options")
  result = NatsOptions(handle: rawOpts)

proc setUrl*(opts: NatsOptions, url: string) =
  let status = natsOptions_SetURL(opts.handle, cast[ptr uint8](cstring(url)))
  if status != natsStatus.NATS_OK:
    raise newException(NatsError, "Failed to set URL")

proc setMaxReconnect*(opts: NatsOptions, maxAttempts: int) =
  # NATS C uses an int for max attempts. -1 means infinite reconnects.
  let status = natsOptions_SetMaxReconnect(opts.handle, cint(maxAttempts))
  if status != natsStatus.NATS_OK:
    raise newException(NatsError, "Failed to set max reconnects")

proc setReconnectWait*(opts: NatsOptions, waitMs: int) =
  let status = natsOptions_SetReconnectWait(opts.handle, cint(waitMs))
  if status != natsStatus.NATS_OK:
    raise newException(NatsError, "Failed to set reconnect wait")

proc connect*(url: string): NatsConn =
  var rawPtr: ptr natsConnection
  let status = natsConnection_ConnectTo(addr rawPtr, cast[ptr uint8](cstring(url)))

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to connect: " & errText)

  result = NatsConn(handle: rawPtr)

proc connect*(opts: NatsOptions): NatsConn =
  var rawConn: ptr natsConnection

  let status = natsConnection_Connect(addr rawConn, opts.handle)

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to connect with options: " & errText)

  result = NatsConn(handle: rawConn)

proc rawMsgHandler(
    nc: ptr natsConnection,
    sub: ptr natsSubscription,
    msg: ptr natsMsg,
    closure: pointer,
) {.cdecl.} =
  let ctx = cast[SubContext](closure)
  let dataPtr = natsMsg_GetData(msg)
  let dataLen = natsMsg_GetDataLength(msg)
  var payload = newString(dataLen)
  if dataLen > 0:
    copyMem(addr payload[0], dataPtr, dataLen)

  let subjStr = $cast[cstring](natsMsg_GetSubject(msg))

  let rawReply = natsMsg_GetReply(msg)
  let replyStr =
    if rawReply != nil:
      $cast[cstring](rawReply)
    else:
      ""

  if ctx.onMessage != nil:
    ctx.onMessage(subjStr, replyStr, payload)

  natsMsg_Destroy(msg)

proc rawJsMsgHandler(
    nc: ptr natsConnection,
    sub: ptr natsSubscription,
    msg: ptr natsMsg,
    closure: pointer,
) {.cdecl.} =
  let ctx = cast[SubContext](closure)

  let dataPtr = natsMsg_GetData(msg)
  let dataLen = natsMsg_GetDataLength(msg)
  var payload = newString(dataLen)
  if dataLen > 0:
    copyMem(addr payload[0], dataPtr, dataLen)

  let subjStr = $cast[cstring](natsMsg_GetSubject(msg))
  let rawReply = natsMsg_GetReply(msg)
  let replyStr =
    if rawReply != nil:
      $cast[cstring](rawReply)
    else:
      ""

  if ctx.onMessage != nil:
    ctx.onMessage(subjStr, replyStr, payload)

  discard natsMsg_Ack(msg, nil)

  natsMsg_Destroy(msg)

proc publish*(conn: NatsConn, subject: string, data: string) =
  let status = natsConnection_PublishString(
    conn.handle, cast[ptr uint8](cstring(subject)), cast[ptr uint8](cstring(data))
  )

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to publish: " & errText)

proc subscribe*(
    conn: NatsConn,
    subject: string,
    cb: proc(subject: string, replyTo: string, data: string) {.gcsafe.},
): NatsSub =
  var rawSub: ptr natsSubscription
  let ctx = SubContext(onMessage: cb)

  let status = natsConnection_Subscribe(
    addr rawSub,
    conn.handle,
    cast[ptr uint8](cstring(subject)),
    rawMsgHandler,
    cast[pointer](ctx),
  )

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to subscribe: " & errText)

  result = NatsSub(handle: rawSub, ctx: ctx)

proc request*(
    conn: NatsConn, subject: string, data: string, timeoutMs: int64 = 1000
): string =
  var replyMsg: ptr natsMsg

  let status = natsConnection_RequestString(
    addr replyMsg,
    conn.handle,
    cast[ptr uint8](cstring(subject)),
    cast[ptr uint8](cstring(data)),
    timeoutMs,
  )

  if status == natsStatus.NATS_TIMEOUT:
    raise newException(NatsError, "Request timed out after " & $timeoutMs & "ms")
  elif status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to request: " & errText)

  let dataPtr = natsMsg_GetData(replyMsg)
  let dataLen = natsMsg_GetDataLength(replyMsg)

  result = newString(dataLen)
  if dataLen > 0:
    copyMem(addr result[0], dataPtr, dataLen)

  natsMsg_Destroy(replyMsg)

proc jetStream*(conn: NatsConn): NatsJetStream =
  var rawJs: ptr jsCtx

  let status = natsConnection_JetStream(addr rawJs, conn.handle, nil)
  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to init JetStream: " & errText)

  result = NatsJetStream(handle: rawJs)

proc publish*(js: NatsJetStream, subject: string, data: string) =
  var ack: ptr jsPubAck
  var jsErr: jsErrCode

  let status = js_Publish(
    addr ack,
    js.handle,
    cast[ptr uint8](cstring(subject)),
    cast[pointer](cstring(data)),
    cint(data.len),
    nil,
    addr jsErr,
  )

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "JetStream publish failed: " & errText)

  if ack != nil:
    jsPubAck_Destroy(ack)

proc subscribe*(
    js: NatsJetStream,
    subject: string,
    cb: proc(subject: string, replyTo: string, data: string) {.gcsafe.},
): NatsSub =
  var rawSub: ptr natsSubscription
  let ctx = SubContext(onMessage: cb)
  var jsErr: jsErrCode

  let status = js_Subscribe(
    addr rawSub,
    js.handle,
    cast[ptr uint8](cstring(subject)),
    rawJsMsgHandler,
    cast[pointer](ctx),
    nil,
    nil,
    addr jsErr,
  )

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to JS subscribe: " & errText)

  result = NatsSub(handle: rawSub, ctx: ctx)

proc addStream*(js: NatsJetStream, name: string, subjects: openArray[string]) =
  var cfg: jsStreamConfig

  let initStatus = jsStreamConfig_Init(addr cfg)
  if initStatus != natsStatus.NATS_OK:
    raise newException(NatsError, "Failed to init StreamConfig")

  type CStringType = typeof(cfg.Name)

  cfg.Name = cast[CStringType](cstring(name))

  var cSubjects = newSeq[CStringType](subjects.len)
  for i, s in subjects:
    cSubjects[i] = cast[CStringType](cstring(s))

  if subjects.len > 0:
    cfg.Subjects = cast[typeof(cfg.Subjects)](addr cSubjects[0])
    cfg.SubjectsLen = cint(subjects.len)

  cfg.Storage = cast[typeof(cfg.Storage)](1)

  var errCode: jsErrCode
  var info: ptr jsStreamInfo

  let status = js_AddStream(addr info, js.handle, addr cfg, nil, addr errCode)

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(
      NatsError,
      "Failed to add stream: " & errText & " (JS Code: " & $cast[int](errCode) & ")",
    )

  if info != nil:
    jsStreamInfo_Destroy(info)

proc getStreamInfo*(js: NatsJetStream, name: string): Option[NatsStreamInfo] =
  var info: ptr jsStreamInfo
  var errCode: jsErrCode

  let status = js_GetStreamInfo(
    addr info, js.handle, cast[ptr uint8](cstring(name)), nil, addr errCode
  )

  if status == natsStatus.NATS_NOT_FOUND or cast[int](errCode) == 10059:
    if info != nil:
      jsStreamInfo_Destroy(info)
    return none(NatsStreamInfo)

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    if info != nil:
      jsStreamInfo_Destroy(info)
    raise newException(
      NatsError,
      "Failed to get stream info: " & errText & " (JS Code: " & $cast[int](errCode) & ")",
    )

  return some(NatsStreamInfo(handle: info))

proc createKeyValue*(js: NatsJetStream, bucket: string): NatsKV =
  var rawKV: ptr kvStore
  var cfg: kvConfig

  let initStatus = kvConfig_Init(addr cfg)
  if initStatus != natsStatus.NATS_OK:
    raise newException(NatsError, "Failed to init KV config")

  cfg.Bucket = cast[typeof(cfg.Bucket)](cstring(bucket))

  let status = js_CreateKeyValue(addr rawKV, js.handle, addr cfg)

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to create KV bucket: " & errText)

  result = NatsKV(handle: rawKV)

proc keyValue*(js: NatsJetStream, bucket: string): NatsKV =
  var rawKV: ptr kvStore

  let status = js_KeyValue(addr rawKV, js.handle, cast[ptr uint8](cstring(bucket)))

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to bind to KV bucket: " & errText)

  result = NatsKV(handle: rawKV)

proc put*(kv: NatsKV, key: string, data: string) =
  let status = kvStore_Put(
    nil,
    kv.handle,
    cast[ptr uint8](cstring(key)),
    cast[pointer](cstring(data)),
    cint(data.len),
  )

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to put KV data: " & errText)

proc get*(kv: NatsKV, key: string): Option[string] =
  var entry: ptr kvEntry

  let status = kvStore_Get(addr entry, kv.handle, cast[ptr uint8](cstring(key)))

  if status == natsStatus.NATS_NOT_FOUND:
    if entry != nil:
      kvEntry_Destroy(entry)
    return none(string)

  if status != natsStatus.NATS_OK:
    let errText = $cast[cstring](natsStatus_GetText(status))
    if entry != nil:
      kvEntry_Destroy(entry)
    raise newException(NatsError, "Failed to get KV data: " & errText)

  let valPtr = kvEntry_Value(entry)
  let valLen = kvEntry_ValueLen(entry)

  var resultStr = newString(valLen)
  if valLen > 0:
    copyMem(addr resultStr[0], valPtr, valLen)

  kvEntry_Destroy(entry)
  return some(resultStr)

proc delete*(kv: NatsKV, key: string) =
  let status = kvStore_Delete(kv.handle, cast[ptr uint8](cstring(key)))

  if status != natsStatus.NATS_OK and status != natsStatus.NATS_NOT_FOUND:
    let errText = $cast[cstring](natsStatus_GetText(status))
    raise newException(NatsError, "Failed to delete KV key: " & errText)
