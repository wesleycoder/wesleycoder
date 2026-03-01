#import <AppKit/AppKit.h>
#import <WebKit/WebKit.h>
#import <objc/runtime.h>
#include <stdio.h>

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
    [(id)view setBackgroundColor:[NSColor clearColor]];
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

  // Floating Window
  [win setStyleMask:NSWindowStyleMaskBorderless];
  [win setOpaque:NO];
  [win setHasShadow:NO];
  [win setBackgroundColor:[NSColor colorWithDeviceRed:r green:g blue:b alpha:a]];
  [win setLevel:NSScreenSaverWindowLevel];
  [win setCollectionBehavior: NSWindowCollectionBehaviorCanJoinAllSpaces | NSWindowCollectionBehaviorFullScreenAuxiliary];
  [win setCanHide:NO];

  clear_webview_background([win contentView]);
  [win display];
}

#ifdef __cplusplus
extern "C" {
#endif

void update_macos_style(void* handle, float r, float g, float b, float a, int vibrant) {
  apply_style_internal(handle, r, g, b, a, vibrant);

  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    apply_style_internal(handle, r, g, b, a, vibrant);
  });
}

#ifdef __cplusplus
}
#endif
