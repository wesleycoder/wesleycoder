import webview

{.passL: "-framework AppKit".}
{.passL: "-framework WebKit".}
{.passC: "-Wno-auto-var-id".}
{.compile: "style_helper.m", passL: "-framework AppKit".}

proc update_macos_style(handle: pointer, r, g, b, a: cfloat, vibrant: cint) {.importc, cdecl.}

proc applyStyle*(w: Webview, r, g, b, a: float, vibrant: bool = false) =
  let h = w.getWindow()
  if h != nil:
    let v = if vibrant: 1.cint else: 0.cint
    update_macos_style(h, r.cfloat, g.cfloat, b.cfloat, a.cfloat, v)
