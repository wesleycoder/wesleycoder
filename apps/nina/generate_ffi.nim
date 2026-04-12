import futhark
import std/strutils

importc:
  outputPath "nats_raw.nim"
  path "vendor/cnats/src"

  renameCallback proc(
      name: string, kind: SymbolKind, partof: string, overloading: var bool
  ): string =
    if name.startsWith("nats"):
      return name
    return name

  "nats.h"
