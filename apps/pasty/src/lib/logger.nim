{.used.}
import std/[syncio, terminal, os]

type Logger = object
const log* = Logger()

proc supportsColor(): bool =
  enableTrueColors()
  if not isatty(stdout): return false
  if getEnv("NO_COLOR") != "": return false
  if getEnv("TERM") == "dumb": return false
  return true

template ok*(l: Logger, args: varargs[untyped]) =
  if not supportsColor(): debugEcho(args)
  else: stderr.styledWriteLine(fgBlack, styleBright, "pasty ", fgCyan, styleBright, "[OK] ✅ ", resetStyle, args)

template debug*(l: Logger, args: varargs[untyped]) =
  if not supportsColor(): debugEcho(args)
  else: stderr.styledWriteLine(fgBlack, styleBright, "pasty", fgCyan, styleBright, "[DEBUG] 🔍 ", resetStyle, args)

template info*(l: Logger, args: varargs[untyped]) =
  if not supportsColor(): debugEcho(args)
  else: stderr.styledWriteLine(fgBlack, styleBright, "pasty", fgCyan, styleBright, "[INFO] ℹ️ ", resetStyle, args)

template warn*(l: Logger, args: varargs[untyped]) =
  if not supportsColor(): debugEcho(args)
  else: stderr.styledWriteLine(fgBlack, styleBright, "pasty", fgYellow, styleBright, "[WARN] ⚠️ ", resetStyle, args)

template error*(l: Logger, args: varargs[untyped]) =
  if not supportsColor(): debugEcho(args)
  else: stderr.styledWriteLine(fgBlack, styleBright, "pasty", fgRed, styleBright, "[ERROR] ‼️ ", resetStyle, args)

template err*(l: Logger, args: varargs[untyped]) = l.error(args)
