import webview

proc cpp*(s: string): string =
  return s

when hostOS == "macosx":
  {.
    emit:
      cpp"""
        #import <AppKit/AppKit.h>
        @interface EventHelper : NSObject
        + (void)registerHotkeys;
        @end
      """
  .}
  {.compile: "hotkeys.m".}

proc setupHotkeys*(w: Webview) =
  when hostOS == "macosx":
    {.emit: "[EventHelper registerHotkeys];".}
  discard
