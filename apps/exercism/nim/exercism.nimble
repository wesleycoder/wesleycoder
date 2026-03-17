# Package

version       = "0.0.1"
author        = "Wésley Guimarães"
description   = "Exercism solutions managed by mise and the exercism CLI"
license       = "MIT"
srcDir        = "."
bin           = @["exercism"]
binDir        = "build"

# Dependencies

requires "nim >= 2.2.6"
