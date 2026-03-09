# begin Nimble config (version 2)
when withDir(thisDir(), system.fileExists("nimble.paths")):
  include "nimble.paths"
# end Nimble config

switch("hints", "off")
# switch("verbosity", "0")
switch("threads", "on")
switch("outdir", "build")
switch("path", thisDir() & "/../../../webview")

when hostOS == "macosx":
  switch("backend", "cpp")
  switch("passC", "-x objective-c++")
  switch("passC", "-Wno-auto-var-id")
  switch("passC", "-Wno-array-bounds")
  switch("passL", "-framework WebKit")
  switch("passL", "-framework AppKit")
  switch("passL", "-framework Carbon")

when hostOS == "android":
  switch("backend", "c")
  switch("app", "lib")
  switch("cpu", "arm64")
  switch("compileOnly", "on")
  switch("nimcache", "build/android_cache")
  switch("passC", "-target arm64-v8a")
  switch("passL", "-L")
  switch("define", "useMalloc")
