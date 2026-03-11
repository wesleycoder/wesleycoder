when defined(android):
  proc androidLog(
    prio: cint, tag: cstring, text: cstring
  ): cint {.importc: "__android_log_write", header: "<android/log.h>", cdecl.}

proc log*(msg: string) =
  when defined(android):
    discard androidLog(4, "ManimApp", msg.cstring)
  else:
    echo "ManimApp: " & msg

{.used.}
