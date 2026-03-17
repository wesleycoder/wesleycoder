import webview

when defined(macosx):
  {.compile: "hotkeys.m".}
  type VisibilityCallback = proc(isVisible: bool) {.cdecl.}
  proc setup_global_hotkeys(
    handle: pointer, callback: VisibilityCallback
  ) {.importc, cdecl.}

proc visibilityChange(isVisible: bool) {.cdecl.} =
  # echo "isVisible changed: ", isVisible
  discard

proc setupHotkeys*(w: Webview) =
  when defined(macosx):
    let h = w.getWindow()
    setup_global_hotkeys(h, visibilityChange)
  discard
