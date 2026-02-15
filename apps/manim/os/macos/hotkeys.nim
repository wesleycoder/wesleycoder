import webview

{.passL: "-framework AppKit".}
{.passL: "-framework WebKit".}

{.emit: """
#import <AppKit/AppKit.h>
@interface EventHelper : NSObject
+ (void)registerDefaultHotkeys;
@end
""".}

{.compile: "event_helper.m" .}

proc setupHotkeys*(w: Webview) =
  {.emit: "[EventHelper registerDefaultHotkeys];".}
