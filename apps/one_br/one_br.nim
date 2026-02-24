#!/usr/bin/env nim r -d:debug --opt:speed
import std/[algorithm, memfiles, parseopt, strformat]

when defined(debug):
  import std/[monotimes, strutils, times]
  let start = getMonoTime()

proc printUsage() =
  echo "Usage: ./one_br [options] [input_file]"
  echo "Options:"
  echo "  -h, --help    Show this help message"

proc parseArgs(): tuple[inputFile: string] =
  var inputFile = ""
  var args = initOptParser()
  for kind, key, val in args.getopt():
    case kind
    of cmdArgument:
      if inputFile == "":
        inputFile = key
      else:
        quit("Error: Unexpected extra argument: " & key, 1)
    of cmdLongOption, cmdShortOption:
      case key
      of "h", "help":
        printUsage()
        quit(0)
      else:
        printUsage()
        quit("Error: Unknown flag: " & key, 1)
    of cmdEnd:
      discard
  return (inputFile,)

const MAP_SIZE = 1 shl 15
const MAP_MASK = MAP_SIZE - 1
const FNV1A_OFFSET = 2166136261'u32
const FNV1A_PRIME = 16777619'u32
const ZERO_ORD = '0'.ord

type StationNode = object
  name: array[100, char]
  nameLen: int
  min: int
  max: int
  sum: int
  count: int

type Result = tuple[city: string, stats: StationNode]

# Pre-allocate global hash table
var storage: array[MAP_SIZE, StationNode]
var uniqueStations = 0

func parseTemp(view: openArray[char]): int {.inline.} =
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

proc processLine(line: openArray[char]) {.inline.} =
  if line.len == 0:
    return

  var sepIndex = -1
  var hash: uint32 = FNV1A_OFFSET

  # Find semicolon AND compute hash
  for i in 0 ..< line.len:
    if line[i] == ';':
      sepIndex = i
      break

    hash = (hash xor line[i].uint32) * FNV1A_PRIME

  if sepIndex == -1:
    return

  let temp = line.toOpenArray(sepIndex + 1, line.high).parseTemp

  var idx = hash and MAP_MASK.uint32 # Starting slot

  while true:
    let stats = addr storage[idx]

    if stats.nameLen == 0:
      stats.nameLen = sepIndex
      copyMem(addr stats.name[0], addr line[0], sepIndex)
      stats.min = temp
      stats.max = temp
      stats.sum = temp
      stats.count = 1
      uniqueStations += 1
      break

    if stats.nameLen == sepIndex:
      var isMatch = true
      for i in 0 ..< sepIndex:
        if stats.name[i] != line[i]:
          isMatch = false
          break

      if isMatch:
        stats.min = min(stats.min, temp)
        stats.max = max(stats.max, temp)
        stats.sum += temp
        stats.count += 1
        break

    idx = (idx + 1) and MAP_MASK.uint32 # Next slot

proc main() =
  let (inputFile) = parseArgs()

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

  when defined(debug):
    echo fmt"Results: ({uniqueStations})" & '\n'

  var results: seq[Result] = newSeqOfCap[Result](uniqueStations)

  for i in 0 ..< MAP_SIZE:
    if storage[i].nameLen > 0:
      var cityStr = newString(storage[i].nameLen)
      copyMem(addr cityStr[0], addr storage[i].name[0], storage[i].nameLen)
      results.add((city: cityStr, stats: storage[i]))

  results.sort(
    proc(x, y: tuple[city: string, stats: StationNode]): int =
      x.city.cmp(y.city)
  )

  for res in results:
    let min = res.stats.min / 10
    let max = res.stats.max / 10
    let mean = (res.stats.sum / res.stats.count) / 10
    echo fmt"{res.city};{min:.1f};{max:.1f};{mean:.1f};{res.stats.count}"

  when defined(debug):
    let elapsed = getMonoTime() - start
    let formatted = (elapsed.inNanoseconds.float / 1e9).formatEng(
      precision = 3, siPrefix = true, unit = "s"
    )
    echo '\n' & fmt"Time taken: {formatted}"

if isMainModule:
  main()
