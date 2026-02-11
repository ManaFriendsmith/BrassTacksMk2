local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if mods["Age-of-Production"] then
    require("compat.age-of-production")
end

--SPACE PLATFORM
if mods["planet-muluna"] then
    tm.AddUnlock("metallic-asteroid-crushing", "brassteroid-crushing", "-cargo-bay")
else
    tm.AddUnlock("space-platform", "brassteroid-crushing", "-cargo-bay")
end
rm.ReplaceIngredientProportional("space-science-pack", "iron-plate", "iron-gear-wheel")

tm.AddUnlock("advanced-asteroid-processing", "advanced-brassteroid-crushing", "-advanced-thruster-fuel")

tm.AddUnlock("asteroid-reprocessing", "brassteroid-reprocessing")

tm.AddUnlock("asteroid-productivity", {type="change-recipe-productivity", recipe="brassteroid-crushing", change=0.1}, "-advanced-carbonic-asteroid-crushing")
tm.AddUnlock("asteroid-productivity", {type="change-recipe-productivity", recipe="advanced-brassteroid-crushing", change=0.1})

if misc.difficulty > 1 then
    rm.ReplaceIngredientProportional("thruster", "steel-plate", "hardened-hull")
    rm.ReplaceIngredientProportional("cargo-bay", "steel-plate", "hardened-hull")
    rm.ReplaceIngredientProportional("cargo-landing-pad", "steel-plate", "hardened-hull")
    rm.ReplaceIngredientProportional("cargo-landing-pad", "steel-plate", "hardened-hull")
    rm.ReplaceIngredientProportional("space-platform-foundation", "steel-plate", "hardened-hull", 0.5, 10)
    rm.AddIngredient("asteroid-collector", "complex-joint", 20)
else
    rm.AddIngredient("asteroid-collector", "bearing", 20)
end
rm.AddIngredient("crusher", "bearing", 10)

--VULCANUS
--Turbo belt gearboxes are with other belt changes in vanilla.lua
--unprincipled!!!

rm.AddProduct("acid-neutralisation", {type="item", name="sphalerite", amount=6})

rm.MultiplyRecipe("casting-pipe", 5)
if misc.difficulty == 1 then
    rm.AddIngredient("casting-pipe", "brass-plate", 2)
else
    rm.AddIngredient("casting-pipe", "pipe-flange", 1)
    tm.AddUnlock("foundry", "casting-pipe-flange", "-casting-pipe")
    tm.AddUnlock("foundry", "casting-flywheel", "casting-iron-gear-wheel")
end

tm.AddUnlock("foundry", "molten-zinc-from-sphalerite", "-concrete-from-molten-iron")
tm.AddUnlock("foundry", "molten-zinc", "-casting-iron")
tm.AddUnlock("foundry", "casting-zinc", "-casting-iron-gear-wheel")
tm.AddUnlock("foundry", "casting-brass", "-casting-iron-gear-wheel")
if misc.difficulty == 3 then
    tm.AddUnlock("foundry", "hot-dip-galvanized-panel", "-casting-iron-gear-wheel")
    tm.AddUnlock("foundry", "hot-dip-galvanized-rod", "-casting-iron-gear-wheel")
    tm.AddUnlock("foundry", "hot-dip-galvanized-tubing", "-casting-iron-gear-wheel")
    tm.AddUnlock("foundry", "hot-dip-galvanized-steel", "-casting-iron-gear-wheel")
else
    tm.AddUnlock("foundry", "hot-dip-galvanized-steel", "casting-steel")
end

tm.AddUnlock("full-spectrum-magmallurgy", "molten-zinc-from-lava")

if misc.difficulty == 3 then
    tm.AddUnlock("tungsten-steel", "spurving-bearing")
    rm.ReplaceIngredientProportional("turbo-transport-belt", "tungsten-plate", "spurving-bearing", 0.6)
    rm.ReplaceIngredientProportional("turbo-underground-belt", "tungsten-plate", "spurving-bearing", 0.6)
    rm.ReplaceIngredientProportional("turbo-splitter", "tungsten-plate", "spurving-bearing", 0.6)
    rm.ReplaceIngredientProportional("speed-module-3", "tungsten-plate", "spurving-bearing", 0.6)
    rm.ReplaceIngredientProportional("fusion-generator", "tungsten-plate", "spurving-bearing", 0.6, 50)
end

rm.RemoveIngredient("casting-iron-gear-wheel", "molten-iron", 5)
rm.AddIngredient("casting-iron-gear-wheel", "brass-plate", 1)
data.raw.recipe["casting-iron-gear-wheel"].icon = misc.VariableGraphicsPath("__pf-sa-compat__/graphics", "icons/casting-iron-gear-wheel.png")

--visually the foundry has a bunch of belt-like structures in its design. Belts are also a foundry specialty so they're on theme.
if (misc.difficulty == 3) and (misc.starting_planet ~= "vulcanus") then
    rm.AddIngredient("foundry", "fast-transport-belt", 8)
else
    rm.AddIngredient("foundry", "transport-belt", 20)
end

if misc.starting_planet == "vulcanus" then
    table.insert(data.raw["simple-entity"]["huge-volcanic-rock"].minable.results, {type="item", name="zinc-ore", amount_min=10, amount_max=30})
    table.insert(data.raw["simple-entity"]["big-volcanic-rock"].minable.results, {type="item", name="zinc-ore", amount_min=5, amount_max=10})
    table.insert(data.raw["simple-entity"]["vulcanus-chimney"].minable.results, {type="item", name="sphalerite", amount_min=0, amount_max=10})
    table.insert(data.raw["simple-entity"]["vulcanus-chimney-cold"].minable.results, {type="item", name="sphalerite", amount_min=0, amount_max=10})
    table.insert(data.raw["simple-entity"]["vulcanus-chimney-faded"].minable.results, {type="item", name="sphalerite", amount_min=0, amount_max=10})

    if misc.difficulty > 1 then
        tm.RemoveUnlock("steam-power", "pipe-flange")
        tm.RemoveUnlock("steam-power", "flywheel")
        tm.AddUnlock("oil-gathering", "pipe-flange", "-pumpjack")
        tm.AddUnlock("oil-gathering", "flywheel", "-pumpjack")
        tm.AddUnlock("logistics", "flywheel", "splitter")

        tm.RemoveSciencePack("mechanical-engineering", "logistic-science-pack")
        tm.RemovePrerequisite("mechanical-engineering", "logistic-science-pack")
        tm.SetTechnologyCost("mechanical-engineering", 10)

        if misc.difficulty == 3 then
            tm.RemovePrerequisite("electroplating", "logistic-science-pack")
            tm.AddPrerequisite("electroplating", "calcite-processing")
            tm.SetTechnologyTrigger("electroplating", {type="craft-fluid", fluid="water"})
        else
            tm.AddPrerequisite("mechanical-engineering", "automation-science-pack")
        end
    end
else
    table.insert(data.raw["simple-entity"]["huge-volcanic-rock"].minable.results, {type="item", name="zinc-ore", amount_min=5, amount_max=15})
    table.insert(data.raw["simple-entity"]["big-volcanic-rock"].minable.results, {type="item", name="zinc-ore", amount_min=2, amount_max=5})
    table.insert(data.raw["simple-entity"]["vulcanus-chimney"].minable.results, {type="item", name="sphalerite", amount_min=0, amount_max=5})
    table.insert(data.raw["simple-entity"]["vulcanus-chimney-cold"].minable.results, {type="item", name="sphalerite", amount_min=0, amount_max=5})
    table.insert(data.raw["simple-entity"]["vulcanus-chimney-faded"].minable.results, {type="item", name="sphalerite", amount_min=0, amount_max=5})
end

--GLEBA
tm.AddUnlock("yumako", "zinc-bacteria")

--visually the foundry has a bunch of belt-like structures in its design. Belts are also a foundry specialty so they're on theme.
if misc.difficulty == 3 then
    rm.ReplaceIngredientProportional("agricultural-tower", "steel-plate", "galvanized-steel-plate", 1, 5)
    rm.ReplaceIngredientProportional("agricultural-tower", "steel-plate", "loadbearing-lattice")
    rm.ReplaceIngredientProportional("biochamber", "iron-plate", "galvanized-panel")

    rm.AddIngredient("heating-tower", "loadbearing-lattice", 5)
else
    rm.ReplaceIngredientProportional("agricultural-tower", "steel-plate", "galvanized-steel-plate")
end

if misc.difficulty > 1 then
    rm.AddIngredient("heating-tower", "hardened-hull", 5)
end

if mods["IfNickelMk2"] then
    table.insert(data.raw["simple-entity"]["copper-stromatolite"].minable.results, {type="item", name="zinc-ore", amount_min=8, amount_max=16})
else
    table.insert(data.raw["simple-entity"]["copper-stromatolite"].minable.results, {type="item", name="zinc-ore", amount_min=4, amount_max=8})
    table.insert(data.raw["simple-entity"]["iron-stromatolite"].minable.results, {type="item", name="zinc-ore", amount_min=4, amount_max=8})
end

--FULGORA

tm.AddUnlock("recycling", "brass-separation")

rm.RemoveProduct("scrap-recycling", {type="item", name="steel-plate", probability=0.04, amount=1})
if misc.difficulty < 3 then
    rm.AddProduct("scrap-recycling", {type="item", name="galvanized-steel-plate", probability=0.05, amount=1})
else
    rm.AddProduct("scrap-recycling", {type="item", name="loadbearing-lattice", probability=0.16, amount=1})
end

local function replace_drop(entity, find, replace, category)
    local prototype = data.raw[category or "simple-entity"][entity]
    if prototype then
        local drops = prototype.minable.results
        for k, v in pairs(drops) do
            if v.name == find then
                v.name = replace
            end
        end
    end
end

replace_drop("fulgoran-ruin-small", "steel-plate", misc.difficulty == 3 and "loadbearing-lattice" or "galvanized-steel-plate")
replace_drop("fulgoran-ruin-medium", "steel-plate", misc.difficulty == 3 and "loadbearing-lattice" or "galvanized-steel-plate")
replace_drop("fulgoran-ruin-stonehenge", "steel-plate", misc.difficulty == 3 and "loadbearing-lattice" or "galvanized-steel-plate")
replace_drop("fulgoran-ruin-big", "steel-plate", misc.difficulty == 3 and "loadbearing-lattice" or "galvanized-steel-plate")
replace_drop("fulgoran-ruin-colossal", "steel-plate", misc.difficulty == 3 and "loadbearing-lattice" or "galvanized-steel-plate")
replace_drop("fulgoran-ruin-huge", "steel-plate", misc.difficulty == 3 and "loadbearing-lattice" or "galvanized-steel-plate")
replace_drop("fulgoran-ruin-vault", "steel-plate", misc.difficulty == 3 and "loadbearing-lattice" or "galvanized-steel-plate")
replace_drop("fulgoran-ruin-attractor", "steel-plate", misc.difficulty == 3 and "loadbearing-lattice" or "galvanized-steel-plate", "lightning-attractor")

rm.ReplaceIngredientProportional("lightning-rod", "steel-plate", misc.difficulty == 3 and "loadbearing-lattice" or "galvanized-steel-plate")

if misc.difficulty > 1 then
    if not data.raw.item["tracker"] then
        rm.AddIngredient("tesla-turret", "gyro", 10)
    end
    if mods["LasingAroundMk2"] then
        rm.AddProduct("weird-alien-gizmo-recycling", {type="item", name="fast-gearbox", amount=1, probability=0.2})
        rm.AddProduct("weird-alien-gizmo-recycling", {type="item", name="linkages", amount=1, probability=0.2})
    end
end

if (misc.difficulty == 3) and mods["LasingAroundMk2"] then
    rm.ReplaceIngredientProportional("cardinal-grammeter", "iron-gear-wheel", "complex-joint", mods["BrimStuffMk2"] and 0.1 or 0.2)

    rm.AddIngredient("perpendicular-processor", "malleable-logarithmic-casing", 2)
    rm.ReplaceIngredientProportional("random-number-nullifier", "advanced-circuit", "gyro", 1)
end

if misc.difficulty == 3 then
    --fuck ya throughput. bing bong
    rm.AddProduct("scrap-recycling", {type="item", name="brass-balls", amount=1, probability=0.15})

    rm.AddProduct("ice-melting", "water", 5)
    rm.AddProduct("advanced-water-melting-atmosphere", "water", 5)
    rm.AddProduct("advanced-water-melting-oxygen", "water", 5)
else
    if mods["LasingAroundMk2"] and misc.difficulty > 1 then
        rm.AddProduct("weird-alien-gizmo-recycling", {type="item", name="bearing", amount=1, probability=0.1})
    else
        rm.AddProduct("scrap-recycling", {type="item", name="bearing", amount=1, probability=0.02})
    end
end

if misc.starting_planet == "fulgora" then
    if misc.difficulty == 3 then
        data.raw.technology["electroplating"].prerequisites = {"recycling"}
        tm.SetTechnologyTrigger("electroplating", "galvanized-panel", 5)
        tm.AddUnlock("electroplating", "pipe-flange")
        tm.AddUnlock("electroplating", "pipe")
        tm.AddUnlock("electroplating", "pipe-to-ground")
        tm.AddUnlock("electroplating", "offshore-pump")

        if not mods["BrimStuffMk2"] then
            rm.AddRecipeCategory("ice-melting", "electroplating")
        end
    end

    if misc.difficulty > 1 then
        data.raw.technology["mechanical-engineering"].prerequisites = {"recycling"}
        tm.SetTechnologyTrigger("mechanical-engineering", "galvanized-steel-plate", 5)
    end
end

if misc.difficulty == 3 and rm.GetIngredientCount("electromagnetic-science-pack", "electric-engine-unit") == 0 then
    rm.AddIngredient("electromagnetic-science-pack", "electric-engine-unit")
end

--AQUILO

if misc.difficulty > 1 then
    --this doesn't even make sense, I just want you to suffer.
    rm.ReplaceIngredientProportional("railgun-ammo", "steel-plate", "galvanized-steel-plate")
end

if misc.difficulty == 3 then
    if not mods["ThemTharHillsMk2"] then
        rm.AddIngredient("railgun-turret", "spurving-bearing", 5)
    end
end