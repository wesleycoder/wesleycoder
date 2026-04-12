# Package

version       = "0.0.1"
author        = "Wésley Guimarães"
description   = "A nats wrapper for nim (via futhark)"
license       = "MIT"
srcDir        = "."
bin           = @["nina"]
binDir        = "build"

# Dependencies

requires "nim >= 2.2.6"

requires "futhark >= 0.15.0"