#import <AppKit/AppKit.h>

// copy this to where you use it
// {.emit: cpp"""
@interface EventHelper : NSObject
+ (void)registerHotkeys;
@end
// """.}

@implementation EventHelper
+ (void)registerHotkeys {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskKeyDown handler:^NSEvent* (NSEvent* event) {
      if ([event modifierFlags] & NSEventModifierFlagCommand) {
        NSString* chars = [event charactersIgnoringModifiers];
        if ([chars isEqualToString:@"q"]) { [NSApp terminate:nil]; return nil; }

        if ([chars isEqualToString:@"w"]) {
          for (NSWindow *win in [NSApp windows]) {
            if (![NSStringFromClass([win class]) containsString:@"StatusBar"]) {
              [win orderOut:nil];
            }
          }
          return nil;
        }
      }
      return event;
    }];
  });
}
@end
