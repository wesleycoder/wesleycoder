when not defined(nimscript):
  import system/nimscript

switch("passL", "-lnats")

when defined(macosx):
  switch("passL", "-L/opt/homebrew/lib")
