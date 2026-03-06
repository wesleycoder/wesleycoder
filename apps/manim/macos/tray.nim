import webview

when hostOS == "macosx":
  {.compile: "tray.m".}

  proc setup_system_tray*(handle: pointer) {.importc, cdecl.}

proc initTray*(w: Webview) =
  let h = w.getWindow()
  if h != nil:
    setup_system_tray(h)
  discard
