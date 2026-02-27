#import <AppKit/AppKit.h>

// copy this to where you use it
@interface EventHelper : NSObject
+ (void)registerDefaultHotkeys;
@end

@implementation EventHelper
+ (void)registerDefaultHotkeys {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskKeyDown handler:^NSEvent* (NSEvent* event) {
      if ([event modifierFlags] & NSEventModifierFlagCommand) {
        NSString* chars = [event charactersIgnoringModifiers];
        if ([chars isEqualToString:@"q"]) { [NSApp terminate:nil]; return nil; }
        if ([chars isEqualToString:@"w"]) { [[NSApp keyWindow] performClose:nil]; return nil; }
      }
      return event;
    }];
  });
}
@end
