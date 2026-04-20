# Package

version       = "0.0.1"
author        = "Wésley Guimarães"
description   = "A sandbox for learning Nim"
license       = "MIT"
srcDir        = "src"
bin           = @["manim", "manim-server"]
binDir        = "build"

# Dependencies

requires "nim >= 2.2.6"

requires "nimoy"

requires "webview"
