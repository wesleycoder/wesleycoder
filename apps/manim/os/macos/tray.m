#import <AppKit/AppKit.h>

@interface TrayManager : NSObject
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (assign, nonatomic) NSWindow *appWindow;
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
  self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];

  NSSize iconSize = NSMakeSize(16, 16);
  NSImage *icon = [[NSImage alloc] initWithSize:iconSize];
  [icon lockFocus];
  [[NSColor whiteColor] setFill];
  NSRectFill(NSMakeRect(0, 0, iconSize.width, iconSize.height));
  [icon unlockFocus];

  [icon setTemplate:YES];
  self.statusItem.button.image = icon;

  NSMenu *menu = [[NSMenu alloc] init];

  // Show Window
  NSMenuItem *showItem = [[NSMenuItem alloc] initWithTitle:@"Show Window" action:@selector(showWindow:) keyEquivalent:@"s"];
  [showItem setTarget:self];
  [menu addItem:showItem];

  [menu addItem:[NSMenuItem separatorItem]]; // Divider

  // Quit
  NSMenuItem *quitItem = [[NSMenuItem alloc] initWithTitle:@"Quit" action:@selector(quitApp:) keyEquivalent:@"q"];
  [quitItem setTarget:self];
  [menu addItem:quitItem];

  self.statusItem.menu = menu;

  // Hide the window on startup so it acts purely as a tray app initially
  [self.appWindow orderOut:nil];
}

- (void)showWindow:(id)sender {
  // Bring the window to the front and make it active
  [self.appWindow makeKeyAndOrderFront:nil];
  [NSApp activateIgnoringOtherApps:YES];
}

- (void)quitApp:(id)sender {
  [NSApp terminate:nil];
}
@end

#ifdef __cplusplus
extern "C" {
#endif

void setup_system_tray(void* handle) {
  if (!handle) return;

  NSWindow* win = nil;
  id obj = (__bridge id)handle;

  if ([obj isKindOfClass:[NSWindow class]]) {
     win = (NSWindow*)obj;
  } else if ([obj isKindOfClass:[NSView class]]) {
     win = [((NSView*)obj) window];
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
