require('lib.table')
local sys = require('lib.sys')
local p = require('lib.player')

local function init()
  game.autosave_enabled = false
  if remote.interfaces["freeplay"] then
    remote.call("freeplay", "set_skip_intro", true)
  end
end

script.on_init(init)
script.on_load(init)

script.on_event(
  defines.events.on_player_created,
  function(event)
    local player = p:getPlayer()
    player.print("Hello!", { color = { r = 1, g = 0, b = 0 } })
    if player and player.controller_type == defines.controllers.cutscene then
      player.exit_cutscene()
    end
  end
)

script.on_event(
  defines.events.on_tick,
  function(event)
    local player = p:getPlayer()
    player.color = { r = 0, g = 42, b = 0 }
  end
)
