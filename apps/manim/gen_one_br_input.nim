import std/[random, strformat]

const stations = [
  "Hamburg", "Bulawayo", "Palembang", "St. John's", "Cracow", "Bridgetown", "Istanbul",
  "Tokyo", "New York", "Paris", "London", "São Paulo", "Kyiv", "Helsinki", "Oslo",
  "Reykjavík", "Cairns", "Ushuaia", "Dubai", "Lagos",
]

proc main(filename: string) =
  let f = open(filename, fmWrite)
  defer:
    f.close()

  randomize()

  var bytesWritten = 0
  # 100 * 1024 * 1024 # 100 MB
  let targetSize = 1000 * 1024 * 1024

  while bytesWritten < targetSize:
    let station = sample(stations)
    let temp = (rand(1998) - 999).float / 10.0
    let line = fmt"{station};{temp:.1f}" & "\L"
    f.write(line)
    bytesWritten += line.len

  echo fmt"Finished! Created {filename} ({bytesWritten} B)"

when isMainModule:
  main("1br-input.txt")
