#import <AppKit/AppKit.h>

extern void toggleWindowVisible();

@interface TrayManager : NSObject
@property(strong, nonatomic) NSStatusItem *statusItem;
@property(assign, nonatomic) NSWindow *appWindow;
@end

@implementation TrayManager

+ (instancetype)shared {
  static TrayManager *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[TrayManager alloc] init];
  });
  return instance;
}

- (void)setupWithWindow:(NSWindow *)window {
  self.appWindow = window;
  self.statusItem = [[NSStatusBar systemStatusBar]
      statusItemWithLength:NSVariableStatusItemLength];

  NSSize iconSize = NSMakeSize(24, 24);
  NSImage *icon = [[NSImage alloc] initWithSize:iconSize];
  [icon lockFocus];
  [[NSColor whiteColor] setFill];
  NSRectFill(NSMakeRect(0, 0, iconSize.width, iconSize.height));
  [icon unlockFocus];

  [icon setTemplate:YES];
  self.statusItem.button.image = icon;

  NSMenu *menu = [[NSMenu alloc] init];

  NSMenuItem *toggleItem =
      [[NSMenuItem alloc] initWithTitle:@"Toggle Window"
                                 action:@selector(toggleWindow:)
                          keyEquivalent:@" "];
  [toggleItem setKeyEquivalentModifierMask:NSEventModifierFlagOption];
  [toggleItem setTarget:self];
  [menu addItem:toggleItem];

  [menu addItem:[NSMenuItem separatorItem]];

  NSMenuItem *quitItem = [[NSMenuItem alloc] initWithTitle:@"Quit"
                                                    action:@selector(quitApp:)
                                             keyEquivalent:@"q"];
  [quitItem setTarget:self];
  [menu addItem:quitItem];

  self.statusItem.menu = menu;
  [self.appWindow orderOut:nil];
}

- (void)toggleWindow:(id)sender {
  toggleWindowVisible();
}

- (void)quitApp:(id)sender {
  [NSApp terminate:nil];
}
@end

#ifdef __cplusplus
extern "C" {
#endif

void setup_system_tray(void *handle) {
  if (!handle)
    return;

  NSWindow *win = nil;
  id obj = (__bridge id)handle;

  if ([obj isKindOfClass:[NSWindow class]]) {
    win = (NSWindow *)obj;
  } else if ([obj isKindOfClass:[NSView class]]) {
    win = [((NSView *)obj) window];
  }

  if (win) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [[TrayManager shared] setupWithWindow:win];
    });
  }
}

#ifdef __cplusplus
}
#endif
