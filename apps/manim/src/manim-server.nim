#!/usr/bin/env nim r -f
import
  std/[os],
  api/something,
  lib/logger,
  nimoy

when isMainModule:
  import std/[asyncdispatch]
  waitFor startServer()

const srcDir = currentSourcePath().parentDir()
generateTsBindings(srcDir & "/lib/rpc.ts")
