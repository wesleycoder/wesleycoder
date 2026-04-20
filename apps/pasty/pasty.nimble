# Package

version       = "0.0.1"
author        = "Wésley Guimarães"
description   = "A client for the pasty.ee service"
license       = "MIT"
srcDir        = "src"
bin           = @["pasty"]
binDir        = "build"

# Dependencies

requires "nim >= 2.2.6"

requires "cligen >= 1.9.6"