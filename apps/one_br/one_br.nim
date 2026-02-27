#!/usr/bin/env nim r -d:danger --opt:speed --threads:on --passC:"-flto" --passL:"-flto"
import std/[cpuinfo, algorithm, memfiles, parseopt, strformat]

when defined(debug):
  import std/[monotimes, strutils, times]
  let start = getMonoTime()

const
  MAP_SIZE = 1 shl 15
  MAP_MASK = MAP_SIZE - 1
  FNV1A_OFFSET = 2166136261'u32
  FNV1A_PRIME = 16777619'u32
  ZERO_ORD = '0'.ord

type
  StationNode = object
    name: array[100, char]
    nameLen: int
    min: int
    max: int
    sum: int
    count: int

  ThreadData = object
    storage: array[MAP_SIZE, StationNode]
    uniqueCount: int

  ThreadArgs =
    tuple[
      id: int,
      data: ptr UncheckedArray[char],
      startIdx, endIdx, fileSize: int,
      res: ptr ThreadData,
    ]

type Result = tuple[city: string, stats: StationNode]

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

# Pre-allocate global hash table
var storage: array[MAP_SIZE, StationNode]
var uniqueStations = 0

func parseTemp(view: openArray[char]): int {.inline.} =
  var sign = 1
  var res = 0
  for c in view:
    if c == '-':
      sign = -1
    elif c in {'0' .. '9'}:
      res = res * 10 + (c.ord - ZERO_ORD)
    else:
      discard
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

proc threadWrapper(args: ThreadArgs) {.thread.} =
  let fileSize = args.fileSize
  var pos = args.startIdx
  if pos > 0: # not first thread, skip to start of next line
    while pos < fileSize and args.data[pos] != '\n':
      inc pos
    if pos < fileSize and args.data[pos] == '\n':
      inc pos

  while pos < args.endIdx and pos < fileSize:
    let lineStart = pos
    var sepIndex = -1
    var hash: uint32 = FNV1A_OFFSET

    # Read name and compute hash
    while pos < fileSize and args.data[pos] != ';':
      hash = (hash xor args.data[pos].uint32) * FNV1A_PRIME
      inc pos

    if pos >= fileSize or args.data[pos] != ';':
      break

    sepIndex = pos
    inc pos

    # parse temp
    var sign = 1
    var temp = 0
    if pos < fileSize and args.data[pos] == '-':
      sign = -1
      inc pos

    while pos < fileSize and args.data[pos] != '\n':
      let c = args.data[pos]
      if c in {'0' .. '9'}:
        temp = temp * 10 + (c.ord - ZERO_ORD)
      inc pos

    temp = temp * sign
    let nameLen = sepIndex - lineStart

    var idx = hash and MAP_MASK.uint32
    while true:
      let stats = addr args.res[].storage[idx]

      if stats.nameLen == 0:
        stats.nameLen = nameLen
        copyMem(addr stats.name[0], addr args.data[lineStart], nameLen)
        stats.min = temp
        stats.max = temp
        stats.sum = temp
        stats.count = 1
        args.res[].uniqueCount += 1
        break

      if stats.nameLen == nameLen:
        var isMatch = true
        for i in 0 ..< nameLen:
          if stats.name[i] != args.data[lineStart + i]:
            isMatch = false
            break

        if isMatch:
          stats.min = min(stats.min, temp)
          stats.max = max(stats.max, temp)
          stats.sum += temp
          stats.count += 1
          break

      idx = (idx + 1) and MAP_MASK.uint32

    inc pos

proc main() =
  let (inputFile) = parseArgs()

  if inputFile == "" or inputFile == "-": # stdin
    const bufferSize = 1024 * 1024 # 1MB buffer
    var buffer = newString(bufferSize)
    var leftover = ""

    while true:
      # Read directly from stdin!
      let bytesRead = stdin.readBuffer(addr buffer[0], bufferSize)

      if bytesRead == 0:
        if leftover.len > 0:
          processLine(leftover.toOpenArray(0, leftover.high))
        break

      # Combine any leftover text from the last chunk with the new chunk
      let view = leftover & buffer[0 ..< bytesRead]
      var startIdx = 0

      for i in 0 ..< view.len:
        if view[i] == '\n':
          processLine(view.toOpenArray(startIdx, i - 1))
          startIdx = i + 1

      # Save whatever trailing characters didn't have a newline yet
      leftover = view[startIdx .. ^1]
  else: # read file to memory
    var mfile = memfiles.open(inputFile)
    defer:
      mfile.close()

    let fileSize = mfile.size
    let threadCount = countProcessors()
    let chunkSize = fileSize div threadCount
    var results = newSeq[ThreadData](threadCount)
    var threads = newSeq[Thread[ThreadArgs]](threadCount)
    let dataPtr = cast[ptr UncheckedArray[char]](mfile.mem)

    for i in 0 ..< threadCount:
      let startIdx = i * chunkSize
      let endIdx =
        if i == threadCount - 1:
          fileSize
        else:
          (i + 1) * chunkSize

      let threadArgs = (i, dataPtr, startIdx, endIdx, fileSize, addr results[i])
      createThread(threads[i], threadWrapper, threadArgs)

    joinThreads(threads)

    # combine results from all threads
    for i in 0 ..< threadCount:
      for j in 0 ..< MAP_SIZE:
        let localNode = addr results[i].storage[j]
        if localNode.nameLen > 0:
          var hash = FNV1A_OFFSET
          for k in 0 ..< localNode.nameLen:
            hash = (hash xor localNode.name[k].uint32) * FNV1A_PRIME

          var idx = hash and MAP_MASK.uint32
          while true:
            let globalNode = addr storage[idx]

            if globalNode.nameLen == 0:
              globalNode[] = localNode[]
              uniqueStations += 1
              break

            if globalNode.nameLen == localNode.nameLen:
              var isMatch = true
              for k in 0 ..< localNode.nameLen:
                if globalNode.name[k] != localNode.name[k]:
                  isMatch = false
                  break

              if isMatch:
                globalNode.min = min(globalNode.min, localNode.min)
                globalNode.max = max(globalNode.max, localNode.max)
                globalNode.sum += localNode.sum
                globalNode.count += localNode.count
                break

            idx = (idx + 1) and MAP_MASK.uint32

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
    let elapsed = (getMonoTime() - start).inNanoseconds.float / 1e9
    let formatted = elapsed.formatEng(precision = 3, siPrefix = true, unit = "s")
    echo '\n' & fmt"Time taken: {formatted}"

if isMainModule:
  main()
