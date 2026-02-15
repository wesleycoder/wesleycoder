# Package

version       = "0.0.1"
author        = "Wésley Guimarães"
description   = "A cli with hopefully useful tools"
license       = "MIT"
srcDir        = "."
bin           = @["manim"]
binDir        = "dist"


# Dependencies

requires "nim >= 2.2.6"

requires "https://github.com/neroist/webview >= 0.4.0"