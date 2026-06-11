#!/usr/bin/env nim r -f -d:debug
import std/[browsers, httpclient, os, osproc, strformat, strutils, terminal]
import parsetoml
import ./lib/[api, logger]

const
  CLI_NAME = "pasty"
  PASTY_URL = "https://pasty.ee"
  CONFIG_FILE = "config.toml"

type
  Context = object
    url: string
    file: string
    path: string
    pastyId: string
    pastyKey: string
    verbose: bool
    client: PastyClient

let CONFIG_PATH = getConfigDir() / CLI_NAME / CONFIG_FILE
let KEYS_PATH = getConfigDir() / CLI_NAME / CLI_NAME & "_keys.csv"
var ctx: Context = Context(url: PASTY_URL, path: KEYS_PATH, verbose: false)

proc saveKey(id: string, key: string) =
  ## Saves a key locally to the path defined in the config
  if defined(debug): return
  if id.len <= 0 or key.len <= 0: quit(fmt"Error: Failed to save locally, invalid id/key pair: {id}/{key}", 1)

  var fileLines: seq[string]
  var updated = false

  if fileExists(ctx.path):
    for line in lines(ctx.path):
      if line.startsWith(id & ","):
        fileLines.add(id & "," & key)
        updated = true
      else: fileLines.add(line)

  if not updated: fileLines.add(id & "," & key)

  createDir(ctx.path.parentDir())
  writeFile(ctx.path, fileLines.join("\n") & "\n")

proc getClipboard(): string =
  ## Attempts to read text from the system clipboard using native shell tools.
  when defined(windows):
    let (output, err) = execCmdEx("powershell -NoProfile -Command Get-Clipboard")
    if err == 0: return output.strip(trailing = true)
  elif defined(macosx):
    let (output, err) = execCmdEx("pbpaste")
    if err == 0: return output
  else:
    let (outputW, errW) = execCmdEx("wl-paste")
    if errW == 0: return outputW

    let (outputX, errX) = execCmdEx("xclip -selection clipboard -o")
    if errX == 0: return outputX

    let (outputS, errS) = execCmdEx("xsel --clipboard --output")
    if errCS == 0: return outpS

  return ""

proc createAction(file: string = "") =
  ## Submit a new paste to the server (`pastyUrl`)
  ## Pass a file via `-f` or pipe content via `stdin`.
  var data = ""
  if not isatty(stdin): data = stdin.readAll()
  elif file.len > 0:
    if not fileExists(file): quit("Error: File not found: " & file, 1)
    data = readFile(file)
  else: data = getClipboard()

  if data.len <= 0: quit("Error: Empty input. Use either -f <file> or pipe via stdin", 1)
  let (id, key) = ctx.client.createPasty(data)
  saveKey(id, key)
  echo ctx.url
  log.ok ctx.url / id

proc listAction() =
  ## List all pasties saved in the local store file
  if not fileExists(ctx.path):
    log.error "No pasties found. The key file does not exist. Default path at: ", ctx.path
    return

  var count = 0
  for line in lines(ctx.path):
    let parts = line.split(',')

    if parts.len == 2:
      if count == 0:
        log.info "ID".alignLeft(12), " | ", "URL".alignLeft(35), " | Access Key"
        log.info "-".repeat(12), "-+-", "-".repeat(35), "-+-", "-".repeat(34)

      let id = parts[0].strip()
      let key = parts[1].strip()
      let url = fmt"{ctx.url}/{id}"

      log.info id.alignLeft(12), " | ", url.alignLeft(35), " | ", key

      inc count

  if count == 0: log.error "No pasties saved."

proc openListAction() =
  ## Open the local store file
  if not fileExists(ctx.path):
    createDir(ctx.path.parentDir())
    writeFile(ctx.path, "")
  openDefaultBrowser(ctx.path)
  log.ok fmt"Opened `{ctx.path}` in the default editor"

proc openConfigAction() =
  ## Opens the configuration file in the default editor
  if not fileExists(CONFIG_PATH):
    createDir(CONFIG_PATH.parentDir())
    writeFile(CONFIG_PATH, "")
  openDefaultBrowser(CONFIG_PATH)
  log.ok fmt"Opened `{CONFIG_PATH}` in the default editor"

proc addAction(pastyId: string, accessKey: string) =
  ## Adds a pastyId/accessKey pair to the local store file
  saveKey(pastyId, accessKey)
  log.ok fmt"Added {pastyId} to the local store file"

proc getAction(pastyId: string) =
  ## Retrieves the contents of an existing paste
  let content = ctx.client.getPasty(pastyId)
  stdout.writeLine(content)

proc openAction(pastyId: string) =
  ## Opens a paste by its ID in the default browser
  openDefaultBrowser(fmt"{ctx.url}/{pastyId}")
  log.ok fmt"Opened `{ctx.url}/{pastyId}` in the default browser"

proc updateAction(pastyId: string, pastyKey: string, file: string = "") =
  ## Replaces the contents of an existing paste
  ## Pass a file via `-f` or pipe content via `stdin`.
  var data = ""
  if not isatty(stdin): data = stdin.readAll()
  elif file.len > 0:
    if not fileExists(file): quit("Error: File not found: " & file, 1)
    data = readFile(file)
  else: data = getClipboard()

  if data.len <= 0: quit("Error: Empty input. Use either -f <file> or pipe via stdin", 1)
  let resp = ctx.client.updatePasty(pastyId, pastyKey, data)
  if resp.code.is2xx: log.ok fmt"Pasty {pastyId} updated successfully"
  else: log.err resp.body

proc deleteAction(pastyId: string, pastyKey: string) =
  ## Deletes a paste by its ID
  let resp = ctx.client.deletePasty(pastyId, pastyKey)
  if resp.code.is2xx: log.ok fmt"Pasty {pastyId} deleted successfully"
  else: log.err resp.body

let SCHEMA_PATH = CONFIG_PATH.parentDir() / "schema.json"
const CONFIG_SCHEMA = """{
  "$schema": "https://json-schema.org/draft-07/schema#",
  "$id": "https://codeberg.org/wesleycoder/pasty-cli",
  "title": "pasty config schema",
  "type": "object",
  "properties": {
    "settings": {
      "type": "object",
      "description": "Settings for the pasty CLI",
      "properties": {
        "url": {
          "type": "string",
          "description": "The URL of the pasty instance to use"
        },
        "path": {
          "type": "string",
          "description": "The path to the pasty keys file"
        },
        "verbose": {
          "type": "boolean",
          "description": "Whether to enable verbose output"
        }
      }
    }
  }
}
"""

proc loadConfig() =
  if not fileExists(CONFIG_PATH):
    createDir(CONFIG_PATH.parentDir())
    writeFile(CONFIG_PATH, "")
  if not fileExists(SCHEMA_PATH):
    writeFile(SCHEMA_PATH, CONFIG_SCHEMA)

  try:
    let cfg = parsetoml.parsefile(CONFIG_PATH)
    if not cfg.hasKey("settings"): return

    let settings = cfg["settings"]
    if settings.hasKey("url"): ctx.url = settings["url"].getStr()
    if settings.hasKey("path"): ctx.path = settings["path"].getStr().expandTilde()
    if settings.hasKey("verbose"): ctx.verbose = settings["verbose"].getBool()
  except CatchableError as e:
    quit("Error: Failed to load config file: " & e.msg, 1)

  ctx.client = newPastyClient(ctx.url)

proc mergeParams(cmdNames: seq[string], cmdLine = commandLineParams()): seq[string] =
  ## cligen's hook to set a default command/action
  result = cmdLine
  if cmdNames.len != 1: return
  if result.len == 0: result = @["create"]

when isMainModule:
  import cligen

  loadConfig()

  const noArgsUsage = "$command\n${doc}\n"
  const simpleUsage = "$command\n${doc}Options:\n$options\n"
  const pastyIdUsage = "$command <pastyId>\n${doc}\n"

  dispatchMulti(
    ["multi", doc = "pasty - A command-line client for pasty.ee\n\n"],
    [createAction, cmdName = "create", usage = simpleUsage],
    [listAction, cmdName = "list", usage = noArgsUsage],
    [openListAction, cmdName = "open-list", usage = noArgsUsage],
    [openConfigAction, cmdName = "open-config", usage = noArgsUsage],
    [addAction,
      cmdName = "add",
      short = {"accessKey": 'k'},
      help = {
        "pastyId": "Pasty ID returned when creating a paste\neg: `VXObmsLy` for https://pasty.ee",
        "accessKey": "Access Key returned when creating a paste\neg: EJ9uJ30jvbRbWOA2S1lBMYQnzWmsK5xw"
      },
      usage = simpleUsage
    ],
    [updateAction,
      cmdName = "update",
      short = {"pastyKey": 'k'},
      help = {
        "pastyId": "Pasty ID returned when creating a paste\neg: `VXObmsLy` for https://pasty.ee",
        "pastyKey": "Access Key returned when creating a paste\neg: EJ9uJ30jvbRbWOA2S1lBMYQnzWmsK5xw"
      },
      usage = simpleUsage
    ],
    [getAction, cmdName = "get", usage = pastyIdUsage],
    [openAction, cmdName = "open", usage = pastyIdUsage],
    [deleteAction, cmdName = "delete", usage = pastyIdUsage]
  )
