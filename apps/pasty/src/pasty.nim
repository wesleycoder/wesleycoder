#!/usr/bin/env nim r -f
import std/[options, os, parseopt, parsecfg, strformat, strutils, terminal]
import ./lib/[pasty]

const
  CLI_NAME = "pasty"
  PASTY_URL = "https://pasty.ee"
  CONFIG_FILE = "config.cfg"

let CONFIG_PATH = getConfigDir() / CLI_NAME / CONFIG_FILE
let KEYS_PATH = getConfigDir() / CLI_NAME / CLI_NAME & "_keys.csv"

type
  Context = object
    url: string
    file: string
    path: string
    pastyId: string
    pastyKey: string
    verbose: bool
    client: PastyClient

var ctx: Context = Context(url: PASTY_URL, path: KEYS_PATH, verbose: false)

proc printHelp() =
  echo fmt"""
    {CLI_NAME} - A command-line wrapper for {PASTY_URL}

    Usage:
      {CLI_NAME} [action] [pastyId] [options]
      echo "<data>" | {CLI_NAME} [options]
      {CLI_NAME} [options] < input_file.txt

    Actions:
      create                 Create a new paste on the server (default)
      list                   List pasties stored locally
      open-list              Open all pasties stored locally in the default editor
      add <pastyId> <key>    Add/update a new pastyId/key pair to the local list
      get <pastyId>          Get the content of a paste from the server
      open <pastyId>         Open a paste in the default browser
      update <pastyId> <key> Update an existing paste by ID on the server
      delete <pastyId>       Delete an existing paste by ID on the server

    Options:
      -f, --file:<path>      Input file path. Required
      -p, --path:<path>      Where to save pasty ids and edit keys. Default: {KEYS_PATH}
      -u, --url:<url>        Set alternative pasty instance. Default: {PASTY_URL}
      -v, --verbose          Enable verbose mode
      -h, --help             Show this help message

    Examples:
    echo "hello world" | {CLI_NAME} create
    {CLI_NAME} update VOZbqsTy tRulgY8snwxb2WVg0CpIfI7ODG72hsOp < test.txt
    {CLI_NAME} delete VOZbqsTy

    Configuration File ({CONFIG_PATH}):
      [settings]
      url = https://pasty.ee
      path = /path/to/keys.csv
      verbose = true
  """.dedent()

proc getInputData(): string =
  if ctx.file.len > 0: result = readFile(ctx.file)
  elif isatty(stdin):
    printHelp()
    raise newException(ValueError, "Error: No input data detected via stdin.")
  else: result = stdin.readAll()

  if result.len == 0: raise newException(ValueError, "Error: Input data is empty.")

proc saveKey(id: string, key: string) =
  var fileLines: seq[string]
  var updated = false

  if fileExists(ctx.path):
    for line in lines(ctx.path):
      if line.startsWith(id & ","):
        fileLines.add(id & "," & key)
        updated = true
      else: fileLines.add(line)

  if not updated: fileLines.add(id & "," & key)

  writeFile(ctx.path, fileLines.join("\n") & "\n")

proc createAction(input: Option[string] = none(string)) =
  let data = if input.isSome: input.get else: getInputData()
  let (id, key) = ctx.client.createPasty(data)
  if id.len > 0 and id != "mockedId": saveKey(id, key)
  stdout.writeLine(ctx.url & "/" & id)

proc listAction() =
  if not fileExists(ctx.path):
    echo "No pasties found. The key file does not exist. Default path at: ", ctx.path
    return

  var count = 0
  for line in lines(ctx.path):
    let parts = line.split(',')

    if parts.len == 2:
      if count == 0:
        echo "ID".alignLeft(12), " | ", "URL".alignLeft(35), " | Access Key"
        echo "-".repeat(12), "-+-", "-".repeat(35), "-+-", "-".repeat(34)

      let id = parts[0].strip()
      let key = parts[1].strip()
      let url = fmt"{ctx.url}/{id}"

      echo id.alignLeft(12), " | ", url.alignLeft(35), " | ", key

      inc count

  if count == 0: echo "No pasties saved."

proc openListAction() = return

proc addAction() = saveKey(ctx.pastyId, ctx.pastyKey)

proc getAction() =
  let content = ctx.client.getPasty(ctx.pastyId)
  stdout.writeLine(content)

proc openAction() = return

proc updateAction() = return

proc deleteAction() = return

proc loadContext() =
  if not fileExists(CONFIG_PATH): return

  try:
    let cfg = parsecfg.loadConfig(CONFIG_PATH)
    ctx.url = cfg.getSectionValue("settings", "url", PASTY_URL)
    ctx.path = cfg.getSectionValue("settings", "path", KEYS_PATH)
    ctx.verbose = cfg.getSectionValue("settings", "verbose", "false").parseBool()
    ctx.client = newPastyClient(ctx.url)
  except CatchableError as e:
    raise newException(IOError, "Error: Failed to load config file: " & e.msg)

proc readArgs(): seq[string] =
  var p = initOptParser(mode = LaxMode)
  var positionalArgs: seq[string]
  var expectingFile = false
  var expectingPath = false

  for kind, key, val in p.getopt():
    case kind
    of cmdEnd: raise newException(AssertionDefect, "Unreachable")
    of cmdLongOption, cmdShortOption:
      case key
      of "url", "u":
        ctx.url = val
      of "verbose", "v":
        ctx.verbose = true
      of "file", "f":
        if val == "": expectingFile = true
        else: ctx.file = val
      of "path", "p":
        if val == "": expectingPath = true
        else: ctx.path = val
      of "help", "h":
        printHelp()
        quit(0)
      else:
        printHelp()
        raise newException(ValueError, "Unknown flag: " & key)
    of cmdArgument:
      if expectingFile:
        ctx.file = val
        expectingFile = false
      elif expectingPath:
        ctx.path = val
        expectingPath = false
      else:
        positionalArgs.add(val)
  result = positionalArgs

proc getCmdArgs(defaultCmd: string): (string, seq[string]) =
  let args = commandLineParams()
  for i, arg in args:
    if not arg.startsWith("-"): return (arg, args[0 ..< i] & args[i + 1 .. ^1])
  return (defaultCmd, args)

when isMainModule:
  import cligen;

  dispatchGen(createAction, cmdName = "create")
  dispatchGen(listAction, cmdName = "list")
  dispatchGen(openListAction, cmdName = "open-list", dispatchName = "dispatchopenList")
  dispatchGen(addAction, cmdName = "add")
  dispatchGen(getAction, cmdName = "get")
  dispatchGen(openAction, cmdName = "open")
  dispatchGen(updateAction, cmdName = "update")
  dispatchGen(deleteAction, cmdName = "delete")

  loadContext()

  let (cmd, rest) = getCmdArgs("create")
  case cmd:
    of "create": cligenQuit(dispatchcreate(rest))
    of "list": cligenQuit(dispatchlist(rest))
    of "open-list": cligenQuit(dispatchopenList(rest))
    of "add": cligenQuit(dispatchadd(rest))
    of "get": cligenQuit(dispatchget(rest))
    of "open": cligenQuit(dispatchopen(rest))
    of "update": cligenQuit(dispatchupdate(rest))
    of "delete": cligenQuit(dispatchdelete(rest))
    else: quit(fmt"Unknown command: `{cmd}`", 1)
