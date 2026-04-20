#!/usr/bin/env nim r -f
import
  ./lib/[events, logger, rpc, server]

export generateTsBindings

when defined(android):
  import ./android/bridge
elif defined(ios):
  import ./ios/bridge
elif defined(macosx):
  import ./macosx/bridge
elif defined(linux):
  import ./linux/bridge
elif defined(windows):
  import ./windows/bridge

export emit
export initNimoy
export routeMessage
export startServer

when defined(macosx) or defined(linux) or defined(windows):
  import webview
  export webview
  export expose
