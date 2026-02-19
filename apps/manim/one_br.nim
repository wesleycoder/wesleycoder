import std/memfiles
import std/strformat
import std/tables

when defined(debug):
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

proc main() =
  when defined(debug):
    let start = cpuTime()
  var mfile = memfiles.open("1br-input.txt")
  defer:
    mfile.close()

  for slice in mfile.memSlices:
    if slice.size == 0:
      continue
    let linePtr = cast[ptr UncheckedArray[char]](slice.data)
    var sepIndex = -1
    for i in 0 ..< slice.size:
      if linePtr[i] == ';':
        sepIndex = i
        break
    if sepIndex == -1:
      continue

    var city = sepIndex.newString
    if sepIndex > 0:
      city[0].addr.copyMem(linePtr, sepIndex)
    let temp = linePtr.toOpenArray(sepIndex + 1, slice.size - 1).parseTemp

    storage.withValue(city, stats):
      stats.min = min(stats.min, temp)
      stats.max = max(stats.max, temp)
      stats.sum += temp
      stats.count += 1
    do:
      storage[city] = StationStats(min: temp, max: temp, sum: temp, count: 1)
  when defined(debug):
    echo fmt"Results: ({storage.len})"

  for city, stats in storage:
    let min = stats.min / 10
    let max = stats.max / 10
    let mean = (stats.sum / stats.count) / 10
    echo fmt"{city};{min:.1f};{max:.1f};{mean:.1f};{stats.count}"

  when defined(debug):
    echo fmt"Time taken: {(cpuTime() - start):.6f}s"

if isMainModule:
  main()
