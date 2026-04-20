import std/os

when not defined(nimscript):
  import system/nimscript

switch("hints", "off")
switch("verbosity", "0")
switch("threads", "on")
switch("outdir", "build")
switch("path", thisDir() / ".." / ".." / ".." / "webview")
switch("path", thisDir() / ".." / ".." / "pkgs" / "nimoy" / "src")
switch("path", thisDir() / ".." / ".." / "pkgs" / "nina" / "src")

when defined(macosx):
  switch("backend", "cpp")
  switch("passC", "-x objective-c++")
  switch("passC", "-Wno-auto-var-id")
  switch("passC", "-Wno-array-bounds")
  switch("passL", "-framework WebKit")
  switch("passL", "-framework AppKit")
  switch("passL", "-framework Carbon")

when defined(android):
  switch("backend", "c")
  switch("app", "lib")
  switch("cpu", "arm64")
  switch("compileOnly", "on")
  switch("nimcache", "build/android_cache")
  switch("passC", "-target arm64-v8a")
  switch("passL", "-L")
  switch("define", "useMalloc")

when defined(ios):
  switch("os", "ios")
  switch("cpu", "arm64")
  switch("app", "staticlib")
  switch("noMain", "on")
  switch("header", "nimoy.h")
  switch("nimcache", "build/ios_cache")
  switch("out", "build/ios/libnimoy.a")
  let sysroot = gorge("xcrun --sdk iphonesimulator --show-sdk-path").strip()
  let targetFlags = "-isysroot " & sysroot & " -target arm64-apple-ios16.0-simulator"
  switch("passC", targetFlags & " -Wno-duplicate-decl-specifier")
  switch("passL", targetFlags)

when defined(linux):
  switch("backend", "cpp")
  # switch("passC", "-DWEBVIEW_GTK=1 $(pkg-config --cflags gtk+-3.0 webkit2gtk-4.0)")
  # switch("passL", "$(pkg-config --libs gtk+-3.0 webkit2gtk-4.0)")
