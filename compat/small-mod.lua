local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if mods["se-space-trains"] then
    if misc.difficulty > 1 then
        rm.AddIngredient("space-locomotive", "gyro", 10)
        rm.AddIngredient("space-cargo-wagon", "gyro", 10)
        rm.AddIngredient("space-fluid-wagon", "gyro", 10)

        if #data.raw.recipe["space-locomotive"].ingredients > 5 then
            rm.RemoveIngredient("space-locomotive", "steel-plate", 99999)
            rm.RemoveIngredient("space-cargo-wagon", "steel-plate", 99999)
            rm.RemoveIngredient("space-fluid-wagon", "steel-plate", 99999)
        end
    end
end

if mods["deadlock-beltboxes-loaders"] then
    if misc.difficulty == 1 then
        if mods["space-age"] then
            rm.AddIngredient("turbo-belt-beltbox", "bearing", 20)
            rm.AddIngredient("turbo-belt-loader", "bearing", 10)
            rm.AddIngredient("turbo-belt-beltbox", "iron-gear-wheel", 35)
        else
            rm.AddIngredient("express-belt-beltbox", "bearing", 10)
            rm.AddIngredient("express-belt-loader", "bearing", 5)
        end
    else
        if mods["space-age"] then
            if rm.GetIngredientCount("turbo-transport-belt-beltbox", "electric-engine-unit") == 0 then
                rm.AddIngredient("turbo-transport-belt-beltbox", "electric-engine-unit", 5)
            end
        else
            if rm.GetIngredientCount("express-transport-belt-beltbox", "electric-engine-unit") == 0 then
                rm.AddIngredient("express-transport-belt-beltbox", "electric-engine-unit", 2)
            end
        end

        rm.ReplaceIngredientProportional("transport-belt-beltbox", "iron-gear-wheel", "linkages")
        rm.AddIngredient("transport-belt-loader", "flywheel", 5)
        rm.ReplaceIngredientProportional("fast-transport-belt-beltbox", "iron-gear-wheel", "fast-gearbox", 0.2)
        rm.ReplaceIngredientProportional("fast-transport-belt-loader", "iron-gear-wheel", "fast-gearbox", 0.2)
        if not (mods["IfNickelMk2"] and mods["BrimStuffMk2"]) then
            if misc.difficulty == 2 then
                rm.AddIngredient("fast-transport-belt-loader", "galvanized-steel-plate", 2)
            else
                rm.AddIngredient("fast-transport-belt-loader", "malleable-logarithmic-casing", 3)
            end
            rm.AddIngredient("express-transport-belt-loader", "hardened-hull", 2)
        end

        if misc.difficulty == 2 and mods["space-age"] then
            rm.ReplaceIngredientProportional("express-transport-belt-beltbox", "iron-gear-wheel", "fast-gearbox", 0.2)
            rm.ReplaceIngredientProportional("express-transport-belt-loader", "iron-gear-wheel", "fast-gearbox", 0.266)
            rm.ReplaceIngredientProportional("turbo-transport-belt-beltbox", "iron-gear-wheel", "express-gearbox", 0.066)
            rm.AddIngredient("turbo-transport-belt-loader", "express-gearbox", 4)
            rm.AddIngredient("turbo-transport-belt-beltbox", "complex-joint", 8)
            if not mods["BrimStuffMk2"] then
                rm.AddIngredient("express-belt-beltbox", "bearing", 10)
                rm.AddIngredient("express-belt-loader", "bearing", 5)
            end
        else
            rm.AddIngredient("express-transport-belt-beltbox", "complex-joint", 4)
            rm.ReplaceIngredientProportional("express-transport-belt-beltbox", "iron-gear-wheel", "express-gearbox", 0.133)
            rm.ReplaceIngredientProportional("express-transport-belt-loader", "iron-gear-wheel", "express-gearbox", 0.1)
            rm.ReplaceIngredientProportional("turbo-transport-belt-loader", "tungsten-plate", "spurving-bearing", 0.2)
            if mods["BrimStuffMk2"] then
                rm.ReplaceIngredientProportional("turbo-transport-belt-beltbox", "tungsten-plate", "spurving-bearing", 0.2)
            else
                rm.ReplaceIngredientProportional("turbo-transport-belt-beltbox", "iron-gear-wheel", "spurving-bearing", 0.2)
            end
        end
    end

    if misc.difficulty == 3 then
        rm.ReplaceIngredientProportional("fast-transport-belt-beltbox", "iron-plate", "malleable-logarithmic-casing", 0.25)
    else
        rm.ReplaceIngredientProportional("fast-transport-belt-beltbox", "iron-plate", "galvanized-steel-plate", 0.2)
    end

    if misc.difficulty > 1 then
        if mods["ThemTharHillsMk2"] or mods["BrimStuffMk2"] or (mods["LasingAroundMk2"] and mods["space-age"]) or not mods["space-age"] then
            rm.RemoveIngredient("express-transport-belt-beltbox", "iron-plate", 99999)
        else
            rm.ReplaceIngredientProportional("express-transport-belt-beltbox", "iron-plate", "hardened-hull", 0.133)
        end
    else
        rm.ReplaceIngredientProportional("fast-transport-belt-beltbox", "iron-plate", "galvanized-steel-plate", 0.2)
    end
end

if mods["scrap-industry"] and mods["space-age"] then
    tm.AddUnlock("foundry", "molten-zinc-from-scrap")
    tm.AddUnlock("foundry", "brass-liquation")

    if data.raw.item["mech-scrap"] then
        if misc.difficulty > 1 then
            rm.AddIngredient("sort-mech-scrap", "mech-scrap", 4)
            rm.AddProduct("sort-mech-scrap", {type="item", name="linkages", amount=1, probability=0.5})
        else
            rm.AddIngredient("sort-mech-scrap", "mech-scrap", 3)
        end
        rm.AddProduct("sort-mech-scrap", {type="item", name="brass-plate", amount=1, probability=0.5})
        rm.AddProduct("sort-mech-scrap", {type="item", name="brass-scrap", amount_min=1, amount_max=3})
        data.raw.recipe["sort-mech-scrap"].energy_required = 4

        ScrapIndustry.items["linkages"] = {scrap="mech-scrap", scale=ScrapIndustry.CHEAP, failrate=0.02}
        ScrapIndustry.items["complex-joint"] = {scrap={"mech-scrap"}, scale=ScrapIndustry.RARE, failrate=0.03}
        ScrapIndustry.items["fast-gearbox"] = {scrap="mech-scrap", scale=ScrapIndustry.RARE, failrate=0.02}
        ScrapIndustry.items["express-gearbox"] = {scrap={"mech-scrap"}, scale=ScrapIndustry.RARE, failrate=0.03}
        ScrapIndustry.items["gyro"] = {scrap={"mech-scrap", "circuit-scrap", "zinc-scrap"}, scale=ScrapIndustry.RARE, failrate=0.03}
    else
        ScrapIndustry.items["linkages"] = {scrap={"brass-scrap", "iron-scrap"}, scale=ScrapIndustry.CHEAP, failrate=0.02}
        ScrapIndustry.items["complex-joint"] = {scrap={"brass-scrap", "iron-scrap"}, scale=ScrapIndustry.RARE, failrate=0.03}
        ScrapIndustry.items["fast-gearbox"] = {scrap={"brass-scrap", "iron-scrap", "zinc-scrap"}, scale=ScrapIndustry.RARE, failrate=0.02}
        ScrapIndustry.items["express-gearbox"] = {scrap={"brass-scrap", "iron-scrap", "zinc-scrap"}, scale=ScrapIndustry.RARE, failrate=0.03}
        ScrapIndustry.items["gyro"] = {scrap={"brass-scrap", "circuit-scrap", "zinc-scrap"}, scale=ScrapIndustry.RARE, failrate=0.03}

        ScrapIndustry.items["iron-gear-wheel"] = {scrap={"brass-scrap", "iron-scrap"}, scale=ScrapIndustry.COMMON, failrate=0.02}
    end

    if data.raw.item["plastic-bits"] then
        table.insert(ScrapIndustry.items["complex-joint"].scrap, "plastic-bits")
    end
    if rm.GetIngredientCount("express-gearbox", "titanium-plate") > 0 then
        table.insert(ScrapIndustry.items["express-gearbox"].scrap, "titanium-scrap")
    end

    ScrapIndustry.recipes["brass-precursor"] = {ignore=true}
    ScrapIndustry.items["zinc-plate"] = {scrap="zinc-scrap", scale=ScrapIndustry.COMMON, failrate=0.01, recycle=2}
    ScrapIndustry.items["brass-plate"] = {scrap="brass-scrap", scale=ScrapIndustry.COMMON, failrate=0.01, recycle=2}

    ScrapIndustry.items["pipe"] = {scrap={"brass-scrap", "iron-scrap"}, scale=ScrapIndustry.CHEAP, failrate=0.01}
    ScrapIndustry.items["brass-balls"] = {scrap="brass-scrap", scale=ScrapIndustry.CHEAP, failrate=0.01}
    ScrapIndustry.items["bearing"] = {scrap="brass-scrap", scale=ScrapIndustry.UNCOMMON, failrate=0.03}
    ScrapIndustry.items["pipe-flange"] = {scrap="brass-scrap", scale=ScrapIndustry.CHEAP, failrate=0.01}
    ScrapIndustry.items["flywheel"] = {scrap="zinc-scrap", scale=ScrapIndustry.CHEAP, failrate=0.02}
    ScrapIndustry.items["battery"] = {scrap={"zinc-scrap", "copper-scrap"}, scale=ScrapIndustry.CHEAP, failrate=0.02}

    ScrapIndustry.items["galvanized-steel-plate"] = {scrap="steel-scrap", scale=ScrapIndustry.UNCOMMON, failrate=0.01}
    ScrapIndustry.items["galvanized-rod"] = {scrap={"iron-scrap", "zinc-scrap"}, scale=ScrapIndustry.COMMON, failrate=0.02}
    ScrapIndustry.items["galvanized-panel"] = {scrap="iron-scrap", scale=ScrapIndustry.COMMON, failrate=0.01}
    ScrapIndustry.items["galvanized-tubing"] = {scrap="iron-scrap", scale=ScrapIndustry.COMMON, failrate=0.02}
    ScrapIndustry.items["malleable-logarithmic-casing"] = {scrap={"iron-scrap", "zinc-scrap"}, scale=ScrapIndustry.CHEAP, failrate=0.02}
    ScrapIndustry.items["loadbearing-lattice"] = {scrap={"steel-scrap", "zinc-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
    ScrapIndustry.items["hardened-hull"] = {scrap={"steel-scrap", "brass-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
    ScrapIndustry.items["spurving-bearing"] = {scrap={"brass-scrap", "tungsten-scrap"}, scale=ScrapIndustry.RARE, failrate=0.02}

    ScrapIndustry.recipes["casting-pipe-flange"] = {ignore=true}
    ScrapIndustry.recipes["casting-pipe"] = {ignore=true}
    ScrapIndustry.recipes["casting-iron-gear-wheel"] = {ignore=true}
    ScrapIndustry.recipes["casting-flywheel"] = {ignore=true}

    if settings.startup["scrap-industry-no-mercy"].value then
    else
        if misc.difficulty > 1 then
            ScrapIndustry.recipes["pipe-flange"] = {ignore=true}
            ScrapIndustry.recipes["pipe"].ignore = nil
        end
        ScrapIndustry.recipes["brass-balls"] = {ignore=true}
    end
end