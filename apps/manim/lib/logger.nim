{.used.}

when defined(android):
  proc androidLog(
    prio: cint, tag: cstring, text: cstring
  ): cint {.importc: "__android_log_write", header: "<android/log.h>", cdecl.}

proc log*(msg: string) =
  when defined(android):
    discard androidLog(4, "ManimApp", msg.cstring)
  else:
    echo "ManimApp: " & msg

proc debug*(logFn: proc(msg: string), msg: string) =
  logFn("Debug: " & msg)

proc info*(logFn: proc(msg: string), msg: string) =
  logFn("Info: " & msg)

proc warn*(logFn: proc(msg: string), msg: string) =
  logFn("Warn: " & msg)

proc error*(logFn: proc(msg: string), msg: string) =
  logFn("Error: " & msg)
