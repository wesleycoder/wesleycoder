#import <AppKit/AppKit.h>
#import <WebKit/WebKit.h>
#import <objc/runtime.h>

@interface SmartTitleBarOverlay : NSView
@end

@implementation SmartTitleBarOverlay
- (void)mouseDown:(NSEvent *)event {
  [self.window performWindowDragWithEvent:event];
}
- (BOOL)acceptsFirstMouse:(NSEvent *)event {
  return YES;
}
@end

void clear_webview_background(NSView *view) {
  if (!view)
    return;
  if ([NSStringFromClass([view class]) containsString:@"WKWebView"]) {
    [(id)view setValue:@(NO) forKey:@"drawsBackground"];
    [(id)view setBackgroundColor:[NSColor clearColor]];
    return;
  }
  for (NSView *sub in [view subviews])
    clear_webview_background(sub);
}

static IMP original_canBecomeKeyWindow = nil;
static IMP original_canBecomeMainWindow = nil;

BOOL swizzled_canBecomeKeyWindow(id self, SEL _cmd) {
  if ([self isKindOfClass:[NSWindow class]]) {
    NSWindowStyleMask mask = [(NSWindow *)self styleMask];
    if ((mask & NSWindowStyleMaskTitled) == 0)
      return YES;
  }
  if (original_canBecomeKeyWindow) {
    return ((BOOL(*)(id, SEL))original_canBecomeKeyWindow)(self, _cmd);
  }
  return NO;
}

BOOL swizzled_canBecomeMainWindow(id self, SEL _cmd) {
  if ([self isKindOfClass:[NSWindow class]] &&
      ([(NSWindow *)self styleMask] & NSWindowStyleMaskBorderless)) {
    return YES;
  }
  if (original_canBecomeMainWindow) {
    return ((BOOL(*)(id, SEL))original_canBecomeMainWindow)(self, _cmd);
  }
  return NO;
}

void apply_style_internal(void *handle, float r, float g, float b, float a,
                          int vibrant) {
  if (!handle)
    return;
  id obj = (__bridge id)handle;
  NSWindow *win = nil;
  if ([obj isKindOfClass:[NSWindow class]])
    win = (NSWindow *)obj;
  else if ([obj isKindOfClass:[NSView class]])
    win = [((NSView *)obj) window];
  if (!win)
    return;

  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    // Morph process into an Accessory App to bypass full-screen rendering
    // blocks
    [NSApp setActivationPolicy:NSApplicationActivationPolicyAccessory];

    Method m1 =
        class_getInstanceMethod([win class], @selector(canBecomeKeyWindow));
    original_canBecomeKeyWindow =
        method_setImplementation(m1, (IMP)swizzled_canBecomeKeyWindow);

    Method m2 =
        class_getInstanceMethod([win class], @selector(canBecomeMainWindow));
    original_canBecomeMainWindow =
        method_setImplementation(m2, (IMP)swizzled_canBecomeMainWindow);
  });

  [win setStyleMask:NSWindowStyleMaskBorderless];
  [win setOpaque:NO];
  [win setHasShadow:NO];
  [win setBackgroundColor:[NSColor colorWithDeviceRed:r
                                                green:g
                                                 blue:b
                                                alpha:a]];

  [win setLevel:NSPopUpMenuWindowLevel];

  // Add 'Stationary' so it ignores Mission Control sweeps
  [win setCollectionBehavior:NSWindowCollectionBehaviorCanJoinAllSpaces |
                             NSWindowCollectionBehaviorFullScreenAuxiliary |
                             NSWindowCollectionBehaviorStationary];

  clear_webview_background([win contentView]);
  [win display];
}

#ifdef __cplusplus
extern "C" {
#endif

void update_macos_style(void *handle, float r, float g, float b, float a,
                        int vibrant) {
  apply_style_internal(handle, r, g, b, a, vibrant);

  dispatch_after(
      dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)),
      dispatch_get_main_queue(), ^{
        apply_style_internal(handle, r, g, b, a, vibrant);
      });
}

#ifdef __cplusplus
}
#endif
