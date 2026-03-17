import std/[strutils, sequtils]

func isEmpty(s: string): bool =
  s == ""

func hasWords(s: string): bool =
  s.anyIt(it.isAlphaAscii)

func isYelling(s: string): bool =
  s.hasWords() and not s.anyIt(it.isLowerAscii)

func isQuestion(s: string): bool =
  s.endsWith("?")

proc hey*(s: string): string =
  let stripped = s.strip()
  if stripped.isEmpty():
    "Fine. Be that way!"
  elif stripped.isQuestion() and stripped.isYelling():
    "Calm down, I know what I'm doing!"
  elif stripped.isQuestion():
    "Sure."
  elif stripped.isYelling():
    "Whoa, chill out!"
  else:
    "Whatever."
