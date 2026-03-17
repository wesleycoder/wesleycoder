import std/[strutils, sequtils]

func abbreviate*(s: string): string =
  s
    .split({' ', '-', '_'})
    .filterIt(not it.isEmptyOrWhitespace)
    .mapIt(it[0])
    .join("")
    .toUpper()
