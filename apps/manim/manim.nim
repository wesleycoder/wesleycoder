#!/usr/bin/env nim r
import std/[os, strformat]
import webview

proc cpp*(s: string): string =
  return s

when hostOS == "macosx":
  {.passL: "-framework AppKit".}
  {.passL: "-framework WebKit".}
  {.passC: "-Wno-auto-var-id".}
  {.compile: "style_helper.m", passL: "-framework AppKit".}

  {.
    emit:
      cpp"""
      #import <AppKit/AppKit.h>
      @interface EventHelper : NSObject
      + (void)registerDefaultHotkeys;
      @end
    """
  .}
  {.compile: "event_helper.m".}

  proc update_macos_style(
    handle: pointer, r, g, b, a: cfloat, vibrant: cint
  ) {.importc, cdecl.}

  proc setupHotkeys*(w: Webview) =
    {.emit: "[EventHelper registerDefaultHotkeys];".}

proc applyStyle*(w: Webview, r, g, b, a: float, vibrant: bool = false) =
  when hostOS == "macosx":
    let h = w.getWindow()
    if h != nil:
      let v = if vibrant: 1.cint else: 0.cint
      update_macos_style(h, r.cfloat, g.cfloat, b.cfloat, a.cfloat, v)

  discard

const SRC_DIR = currentSourcePath.parentDir

proc openApp() =
  let app = newWebview()
  app.setTitle("Manim")
  app.setSize(400, 200)

  app.setupHotkeys()
  app.applyStyle(0, 0, 0, 0, false)

  app.navigate(cstring fmt"file://{SRC_DIR}/index.html")

  app.run()

when isMainModule:
  openApp()
