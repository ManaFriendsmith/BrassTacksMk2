local rm = require("__pf-functions__/recipe-manipulation")
local misc = require("__pf-functions__/misc.lua")

require("compat.deadlock")

if mods["quality"] and misc.last_pf_mod == "BrassTacksMk2" then
    rm.FixStackingRecycling()
    require("__quality__/data-updates.lua")
end