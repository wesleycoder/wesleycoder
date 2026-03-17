#!/usr/bin/env nim r -f
import webview
import ./lib/[logger, rpc]

when defined(android):
  import ./android/bridge
elif defined(ios):
  import ./ios/bridge
elif defined(macosx):
  import webview
  import ./macos/bridge
elif defined(linux):
  import webview
  import ./linux/bridge
elif defined(windows):
  import webview
  import ./windows/bridge

export initNimoy
export executeJS
export webview
