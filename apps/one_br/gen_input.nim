#!/usr/bin/env -S usage bash
#USAGE arg <size> help="Size in MB"
#USAGE arg <name> default="input.txt" help="Name of the file"
#[ Executes this script with nim passing arguments parsed by `usage`
exec nim r "$0" "$@"
]#
import std/[random, strformat, strutils, os]

# Tuples of (City Name, Average Annual Temperature)
const stations = [
  ("Hamburg", 9.0),
  ("Bulawayo", 18.9),
  ("Palembang", 27.3),
  ("St. John's", 5.0),
  ("Cracow", 8.5),
  ("Bridgetown", 27.0),
  ("Istanbul", 13.9),
  ("Tokyo", 15.4),
  ("New York", 12.9),
  ("Paris", 12.3),
  ("London", 11.3),
  ("São Paulo", 18.6),
  ("Kyiv", 8.4),
  ("Helsinki", 5.9),
  ("Oslo", 5.7),
  ("Reykjavík", 4.3),
  ("Cairns", 25.0),
  ("Ushuaia", 5.6),
  ("Dubai", 26.9),
  ("Lagos", 26.8),
]

proc main() =
  let outputName = getEnv("usage_name", "input.txt")
  let sizeInMB = getEnv("usage_size").parseFloat
  let targetSize = sizeInMB * 1024 * 1024
  echo fmt"Creating `{outputName}`: {targetSize.int64.formatSize('.', bpColloquial)}"

  var bytesWritten = 0.0
  let f = open(outputName, fmWrite)

  defer:
    f.close()

  randomize()

  while bytesWritten < targetSize:
    let station = sample(stations)
    let temp = gauss(mu = station[1], sigma = 20.0)
    let line = fmt"{station[0]};{temp:.1f}" & "\L"
    f.write(line)
    bytesWritten += line.len.toFloat

  echo fmt"Done!"

when isMainModule:
  main()
