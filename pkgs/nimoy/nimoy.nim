#!/usr/bin/env nim r -f
import ./lib/logger
import ./lib/rpc

when defined(android):
  import ./android/bridge
elif defined(ios):
  import ./ios/bridge
elif defined(macosx):
  import ./macos/bridge
elif defined(linux):
  import ./linux/bridge
elif defined(windows):
  import ./windows/bridge

export executeJS
export initNimoy
export routeMessage

when defined(macosx) or defined(linux) or defined(windows):
  import webview
  export webview
  export expose
  export generateTsBindings
