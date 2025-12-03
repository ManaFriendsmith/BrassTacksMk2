local misc = require("__pf-functions__/misc.lua")

if deadlock then
    deadlock.add_stack("zinc-ore", "__BrassTacksMk2__/graphics/icons/zinc-ore-stacked.png", "deadlock-stacking-1", 64)
    deadlock.add_stack("zinc-plate", misc.VariableGraphicsPath("__BrassTacksMk2__/graphics", "icons/stacking/zinc-plate-stacked.png"), "deadlock-stacking-1", 64)
    deadlock.add_stack("brass-plate", misc.VariableGraphicsPath("__BrassTacksMk2__/graphics", "icons/stacking/brass-plate-stacked.png"), "deadlock-stacking-1", 64)
    deadlock.add_stack("iron-gear-wheel", misc.VariableGraphicsPath("__BrassTacksMk2__/graphics", "icons/stacking/iron-gear-wheel-stacked.png"), "deadlock-stacking-2", 64) --fix icon
    deadlock.add_stack("brass-balls", misc.VariableGraphicsPath("__BrassTacksMk2__/graphics", "icons/stacking/brass-balls-stacked.png"), "deadlock-stacking-2", 64)
    deadlock.add_stack("bearing", misc.VariableGraphicsPath("__BrassTacksMk2__/graphics", "icons/stacking/bearing-stacked.png"), "deadlock-stacking-3", 64)
    deadlock.add_stack("galvanized-steel-plate", "__BrassTacksMk2__/graphics/vector/icons/stacking/galvanized-steel-plate-stacked.png", "deadlock-stacking-2", 64)
    if misc.difficulty == 3 then
        deadlock.add_stack("galvanized-panel", "__BrassTacksMk2__/graphics/vector/icons/stacking/galvanized-panel-stacked.png", "deadlock-stacking-2", 64)
        deadlock.add_stack("galvanized-rod", "__BrassTacksMk2__/graphics/vector/icons/stacking/galvanized-rod-stacked.png", "deadlock-stacking-2", 64)
    end
end

if deadlock_crating then
    deadlock_crating.add_crate("zinc-ore", "deadlock-crating-1")
    deadlock_crating.add_crate("zinc-plate", "deadlock-crating-1")
    deadlock_crating.add_crate("brass-plate", "deadlock-crating-1")
    deadlock_crating.add_crate("brass-balls", "deadlock-crating-2")
    deadlock_crating.add_crate("bearing", "deadlock-crating-3")
    deadlock_crating.add_crate("galvanized-steel-plate", "deadlock-crating-2")
    if misc.difficulty == 3 then
        deadlock_crating.add_crate("galvanized-panel", "deadlock-crating-2")
        deadlock_crating.add_crate("galvanized-rod", "deadlock-crating-2")
    end
end