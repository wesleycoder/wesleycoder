when not defined(nimscript):
  import system/nimscript

switch("d", "ssl")

switch("hints", "off")
switch("verbosity", "0")
switch("threads", "on")
switch("outdir", "build")

# begin Nimble config (version 2)
when withDir(thisDir(), system.fileExists("nimble.paths")):
  include "nimble.paths"
# end Nimble config
