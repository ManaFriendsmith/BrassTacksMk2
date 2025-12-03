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