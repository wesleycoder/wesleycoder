local sys = require('lib.sys')

---@class PlayerHelper
local p = {}

---@type LuaPlayer?
p.player = nil

---@param index? number
---@return LuaPlayer
function p:getPlayer(index)
  local player = game.get_player(index or 1)
  if not player then error("No player found") end
  return player
end

function p:safePos(pos)
  if not pos then return nil end
  local player = p:getPlayer()
  return player.surface.find_non_colliding_position(player.character.prototype.name, pos, 2, 0.5)
end

---@param name EntityID
---@return MapPosition?
function p:findNearest(name, radius)
  local player = p:getPlayer()
  local pos = player.position

  local entities = player.surface.find_entities_filtered {
    position = pos,
    radius = radius or 100,
    name = name
  }

  if #entities == 0 then
    sys:log(string.format("Entity: '%s' not found", name))
    return nil
  end

  local nearest = entities[1]
  local min_dist_sq = (entities[1].position.x - pos.x) ^ 2 + (entities[1].position.y - pos.y) ^ 2

  for i = 2, #entities do
    local d_sq = (entities[i].position.x - pos.x) ^ 2 + (entities[i].position.y - pos.y) ^ 2
    if d_sq < min_dist_sq then
      min_dist_sq = d_sq
      nearest = entities[i]
    end
  end

  return nearest.position
end

return p
