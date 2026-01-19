---@class sys
local sys = {}

---@param msg LocalisedString
function sys:log(msg) log(msg) end

---@param signal? string
function sys:quit(signal)
  log("Quitting factorio...")
  script.on_event(defines.events.on_tick, nil)
  helpers.write_file("test-1.kill", signal or "RIP")
end

return sys
