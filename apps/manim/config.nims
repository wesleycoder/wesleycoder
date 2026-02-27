# begin Nimble config (version 2)
when withDir(thisDir(), system.fileExists("nimble.paths")):
  include "nimble.paths"
# end Nimble config

# General Flags
switch("hints", "off")
switch("verbosity", "0")
switch("threads", "on")
switch("outdir", "dist")
switch("backend", "cpp")

# macOS / Objective-C++ Setup
when hostOS == "macosx":
  switch("passC", "-x objective-c++")
  switch("passL", "-framework WebKit")
  switch("passL", "-framework AppKit")
