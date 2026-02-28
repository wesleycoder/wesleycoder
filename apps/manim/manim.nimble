# Package

version       = "0.0.1"
author        = "Wésley Guimarães"
description   = "A sandbox for learning Nim"
license       = "MIT"
srcDir        = "."
bin           = @["manim"]
binDir        = "dist"


# Dependencies

requires "nim >= 2.2.6"

requires "https://github.com/wesleycoder/webview#53feaea"

requires "watchout >= 0.2.1"
