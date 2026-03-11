import webview

when defined(macosx):
  {.compile: "style.m".}

  proc update_macos_style(
    handle: pointer, r, g, b, a: cfloat, vibrant: cint
  ) {.importc, cdecl.}

proc applyStyle*(w: Webview, r, g, b, a: float, vibrant: bool = false) =
  when defined(macosx):
    let h = w.getWindow()
    if h != nil:
      let v = if vibrant: 1.cint else: 0.cint
      update_macos_style(h, r.cfloat, g.cfloat, b.cfloat, a.cfloat, v)

  discard
