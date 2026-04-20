import std/os

when not defined(nimscript):
  import system/nimscript

switch("path", thisDir() / ".." / ".." / ".." / "webview")
switch("path", thisDir() / ".." / "nina")
