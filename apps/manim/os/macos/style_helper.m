#import <AppKit/AppKit.h>
#import <WebKit/WebKit.h>
#import <objc/runtime.h> // Included for safety, though we avoid using it now
#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

@interface SmartTitleBarOverlay : NSView
@end

@implementation SmartTitleBarOverlay
- (void)mouseDown:(NSEvent *)event { [self.window performWindowDragWithEvent:event]; }
- (BOOL)acceptsFirstMouse:(NSEvent *)event { return YES; }
@end

void clear_webview_background(NSView* view) {
  if (!view) return;
  if ([NSStringFromClass([view class]) containsString:@"WKWebView"]) {
    [(id)view setValue:@(NO) forKey:@"drawsBackground"];
    return;
  }
  for (NSView* sub in [view subviews]) clear_webview_background(sub);
}

void apply_style_internal(void* handle, float r, float g, float b, float a, int vibrant) {
  if (!handle) return;

  id obj = (__bridge id)handle;
  NSWindow* win = nil;

  if ([obj isKindOfClass:[NSWindow class]]) win = (NSWindow*)obj;
  else if ([obj isKindOfClass:[NSView class]]) win = [((NSView*)obj) window];

  if (!win) return;

  // Basic Window Setup
  [win setOpaque:NO];
  [win setTitlebarAppearsTransparent:YES];
  [win setStyleMask:[win styleMask] | NSWindowStyleMaskFullSizeContentView];
  [win setTitleVisibility:NSWindowTitleVisible];

  NSView* themeFrame = [[win contentView] superview];
  if (themeFrame) {

    // CLEANUP: Remove old effects/overlays
    NSArray *subviews = [themeFrame subviews];
    for (NSView *sub in [subviews reverseObjectEnumerator]) {
      if ([sub isKindOfClass:[NSVisualEffectView class]] ||
        [sub isKindOfClass:[SmartTitleBarOverlay class]]) {
        [sub removeFromSuperview];
      }
    }

    // VIBRANCY
    if (vibrant) {
      [win setBackgroundColor:[NSColor clearColor]];

      NSVisualEffectView* vView = [[NSVisualEffectView alloc] initWithFrame:[themeFrame bounds]];
      [vView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
      [vView setMaterial:NSVisualEffectMaterialHUDWindow];
      [vView setBlendingMode:NSVisualEffectBlendingModeBehindWindow];
      [vView setState:NSVisualEffectStateActive];

      NSView* tintLayer = [[NSView alloc] initWithFrame:[vView bounds]];
      [tintLayer setWantsLayer:YES];
      [tintLayer setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
      tintLayer.layer.backgroundColor = [[NSColor colorWithDeviceRed:r green:g blue:b alpha:a] CGColor];
      [vView addSubview:tintLayer];

      [themeFrame addSubview:vView positioned:NSWindowBelow relativeTo:nil];
    } else {
      [win setBackgroundColor:[NSColor colorWithDeviceRed:r green:g blue:b alpha:a]];
    }

    // DRAG OVERLAY (The Gap Strategy)
    NSRect frame = [themeFrame bounds];

    // Start 85px from the lefThis ensures we DO NOT cover the traffic lights.
    CGFloat buttonGap = 85.0;
    NSRect titleRect = NSMakeRect(buttonGap, frame.size.height - 30, frame.size.width - buttonGap, 30);

    SmartTitleBarOverlay* overlay = [[SmartTitleBarOverlay alloc] initWithFrame:titleRect];
    [overlay setAutoresizingMask:NSViewWidthSizable | NSViewMinYMargin];

    // We can safely put this on top now, because it doesn't touch the buttons
    [themeFrame addSubview:overlay positioned:NSWindowAbove relativeTo:nil];
  }

  // Clear WebView
  clear_webview_background([win contentView]);
  [win display];
}

void update_macos_style(void* handle, float r, float g, float b, float a, int vibrant) {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    apply_style_internal(handle, r, g, b, a, vibrant);
  });
}

#ifdef __cplusplus
}
#endif
