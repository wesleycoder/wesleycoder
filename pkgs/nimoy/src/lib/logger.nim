{.used.}

when defined(android):
  proc androidLog(
    prio: cint, tag: cstring, text: cstring
  ): cint {.importc: "__android_log_write", header: "<android/log.h>", cdecl.}

proc log*(msg: string) =
  when defined(android):
    discard androidLog(4, "nimoy", msg.cstring)
  else:
    debugEcho "nimoy: " & msg

proc ok*(logFn: proc(msg: string), msg: string) =
  logFn "✅ : " & msg

proc debug*(logFn: proc(msg: string), msg: string) =
  logFn "🔍 : " & msg

proc info*(logFn: proc(msg: string), msg: string) =
  logFn "ℹ️ : " & msg

proc warn*(logFn: proc(msg: string), msg: string) =
  logFn "⚠️ : " & msg

proc error*(logFn: proc(msg: string), msg: string) =
  logFn "‼️ : " & msg

template err*(msg: string) =
  log.error(msg)
