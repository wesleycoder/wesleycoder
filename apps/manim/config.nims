# begin Nimble config (version 2)
when withDir(thisDir(), system.fileExists("nimble.paths")):
  include "nimble.paths"
# end Nimble config

switch("hints", "off")
switch("verbosity", "0")
switch("threads", "on")
switch("outdir", "dist")
switch("backend", "cpp")

when hostOS == "macosx":
  switch("passC", "-x objective-c++")
  switch("passC", "-Wno-auto-var-id")
  switch("passL", "-framework WebKit")
  switch("passL", "-framework AppKit")
  switch("passL", "-framework Carbon")
