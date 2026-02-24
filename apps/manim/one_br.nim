#!/usr/bin/env -S usage bash
#USAGE arg "[input_file]" help="Path to the input file"
#USAGE flag "-d --debug" help="Enable debug logs"
#[
exec nim r "$0" "$@"
]#

import std/[algorithm, memfiles, sequtils, strformat, tables, os]

const isDebug = getEnv("usage_debug") != ""

when isDebug:
  import std/strutils
  import std/times

const ZERO_ORD = '0'.ord

type StationStats = object
  min: int
  max: int
  sum: int
  count: int

var storage = initTable[string, StationStats]()

func parseTemp(view: openArray[char]): int =
  var sign = 1
  var res = 0
  for c in view:
    if c == '-':
      sign = -1
    elif c == '.':
      discard
    else:
      res = res * 10 + (c.ord - ZERO_ORD)
  return res * sign

proc processLine(line: openArray[char]) =
  if line.len == 0:
    return

  var sepIndex = -1
  for i in 0 ..< line.len:
    if line[i] == ';':
      sepIndex = i
      break

  if sepIndex == -1:
    return

  var city = sepIndex.newString
  if sepIndex > 0:
    copyMem(addr city[0], addr line[0], sepIndex)

  let temp = line.toOpenArray(sepIndex + 1, line.high).parseTemp

  storage.withValue(city, stats):
    stats.min = min(stats.min, temp)
    stats.max = max(stats.max, temp)
    stats.sum += temp
    stats.count += 1
  do:
    storage[city] = StationStats(min: temp, max: temp, sum: temp, count: 1)

proc main() =
  when isDebug:
    let start = cpuTime()
  var f: File
  let inputFile = getEnv("usage_input_file")

  if inputFile == "" or inputFile == "-":
    for line in stdin.lines:
      processLine(line)
  else:
    var mfile = memfiles.open(inputFile)
    defer:
      mfile.close()

    for slice in mfile.memSlices:
      if slice.size == 0:
        continue
      let linePtr = cast[ptr UncheckedArray[char]](slice.data)
      processLine(linePtr.toOpenArray(0, slice.size - 1))

  when isDebug:
    echo fmt"Results: ({storage.len})" & '\n'

  for city in storage.keys.toSeq.sorted:
    let stats = storage[city]
    let min = stats.min / 10
    let max = stats.max / 10
    let mean = (stats.sum / stats.count) / 10
    echo fmt"{city};{min:.1f};{max:.1f};{mean:.1f};{stats.count}"

  when isDebug:
    echo '\n' & fmt"Time taken: {(cpuTime() - start):.6f}s"

if isMainModule:
  main()
