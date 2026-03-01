#import <AppKit/AppKit.h>
#import <Carbon/Carbon.h>

typedef void (*VisibilityCallback)(bool isVisible);

static VisibilityCallback nimVisibilityCallback = NULL;
static NSWindow *targetWindow = nil;
static BOOL hasSetInitialPosition = NO;

void centerWindow(NSWindow *window) {
  if (!window) return;
  NSPoint mouseLoc = [NSEvent mouseLocation];
  NSScreen *activeScreen = [NSScreen mainScreen];

  for (NSScreen *screen in [NSScreen screens]) {
    if (NSMouseInRect(mouseLoc, screen.frame, NO)) {
      activeScreen = screen;
      break;
    }
  }

  NSRect screenRect = [activeScreen visibleFrame];
  NSRect windowRect = [window frame];
  CGFloat newX = screenRect.origin.x + (screenRect.size.width - windowRect.size.width) / 2.0;

  CGFloat posYRatio = 1.5; // Strict center use 2.0. Little higher use 1.5
  CGFloat newY = screenRect.origin.y + (screenRect.size.height - windowRect.size.height) / posYRatio;

  [window setFrameOrigin:NSMakePoint(newX, newY)];
}

void openWindow() {
  if (!targetWindow) return;

  if (!hasSetInitialPosition) {
    centerWindow(targetWindow);
    hasSetInitialPosition = YES;
  }

  [targetWindow makeKeyAndOrderFront:nil];
  [NSApp activateIgnoringOtherApps:YES];

  if (nimVisibilityCallback) nimVisibilityCallback(YES);
}

void closeWindow() {
  if (!targetWindow) return;
  [targetWindow orderOut:nil];
  if (nimVisibilityCallback) nimVisibilityCallback(NO);
}

void toggleWindowVisible() {
  if (!targetWindow) return;
  BOOL isCurrentlyVisible = [targetWindow isVisible];
  if (isCurrentlyVisible) { closeWindow(); } else { openWindow(); }
}

OSStatus OnGlobalHotKeyEvent(EventHandlerCallRef nextHandler, EventRef theEvent, void *userData) {
  EventHotKeyID hotKeyID;
  GetEventParameter(theEvent, kEventParamDirectObject, typeEventHotKeyID, NULL, sizeof(hotKeyID), NULL, &hotKeyID);
  if (hotKeyID.signature == 'togl') {
    toggleWindowVisible();
  }
  return noErr;
}

@interface HotkeyManager : NSObject
+ (void)setupWithWindow:(NSWindow*)win callback:(VisibilityCallback)cb;
@end

@implementation HotkeyManager
+ (void)setupWithWindow:(NSWindow*)win callback:(VisibilityCallback)cb {
  targetWindow = win;
  nimVisibilityCallback = cb;

  // Global Hotkeys
  EventTypeSpec eventType;
  eventType.eventClass = kEventClassKeyboard;
  eventType.eventKind = kEventHotKeyPressed;
  InstallApplicationEventHandler(&OnGlobalHotKeyEvent, 1, &eventType, NULL, NULL);

  EventHotKeyID hotKeyID;
  hotKeyID.signature = 'togl';
  hotKeyID.id = 1;
  EventHotKeyRef hotKeyRef;

  int SpaceKeyCode = 49;
  RegisterEventHotKey(SpaceKeyCode, optionKey, hotKeyID, GetApplicationEventTarget(), 0, &hotKeyRef);

  // Local Hotkeys and Mouse Events
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    [NSEvent addLocalMonitorForEventsMatchingMask:(NSEventMaskKeyDown | NSEventMaskLeftMouseDown) handler:^NSEvent* (NSEvent* event) {
      if (event.type == NSEventTypeLeftMouseDown) {
        if ([event modifierFlags] & NSEventModifierFlagCommand) {
          [targetWindow performWindowDragWithEvent:event];
          return nil;
        }
        return event;
      }

      int EscKeyCode = 53;
      if ([event keyCode] == EscKeyCode) {
        closeWindow();
        return nil;
      }

      if ([event modifierFlags] & NSEventModifierFlagCommand) {
        NSString* chars = [[event charactersIgnoringModifiers] lowercaseString];

        if ([chars isEqualToString:@"q"]) {
          [NSApp terminate:nil];
          return nil;
        }
        if ([chars isEqualToString:@"w"]) {
          closeWindow();
          return nil;
        }
        if ([chars isEqualToString:@"r"]) {
          centerWindow(targetWindow);
          return nil;
        }
      }
      return event;
    }];
  });
}
@end

#ifdef __cplusplus
extern "C" {
#endif

void setup_global_hotkeys(void* handle, VisibilityCallback callback) {
  if (!handle) return;

  NSWindow* win = nil;
  id obj = (__bridge id)handle;
  if ([obj isKindOfClass:[NSWindow class]]) win = (NSWindow*)obj;
    else if ([obj isKindOfClass:[NSView class]]) win = [((NSView*)obj) window];

  if (win) {
     [[HotkeyManager class] setupWithWindow:win callback:callback];
  }
}

#ifdef __cplusplus
}
#endif
