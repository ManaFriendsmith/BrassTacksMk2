local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if mods["LunarLandings"] then
    rm.ReplaceIngredientProportional("ll-oxygen-diffuser", "steel-plate", "galvanized-steel-plate")

    local llrcu = mods["space-age"] and "ll-rocket-control-unit" or "rocket-control-unit"
    local llrs = mods["space-age"] and "ll-rocket-silo-up" or "rocket-silo"
    if misc.difficulty > 1 then
        rm.AddIngredient(llrcu, "gyro", 1)
        rm.RemoveIngredient(llrcu, "electronic-circuit", 99999)

        rm.ReplaceIngredientProportional(llrs, "steel-plate", "hardened-hull", 0.5, 100)
        rm.AddIngredient(llrs, "complex-joint", 50)
        rm.ReplaceIngredientProportional(llrs, "pipe", "galvanized-tubing")
    end

    --maybe this is a little mean. but it does push the player toward cheese processing
    if misc.difficulty == 3 then
        rm.ReplaceIngredientProportional("ll-lunar-foundation", "steel-plate", "hardened-hull", 0.75)
        rm.ReplaceIngredientProportional("ll-low-grav-assembling-machine", "iron-gear-wheel", "complex-joint")
        rm.ReplaceIngredientProportional("ll-telescope", "iron-gear-wheel", "skyseeker-armature")
        rm.AddIngredient("ll-data-card", {type="item", name="skyseeker-armature", amount=1, ignored_by_stats=1})
        rm.AddProduct("ll-data-card", {type="item", name="skyseeker-armature", amount=1, ignored_by_stats=1, ignored_by_productivity=1, probability=0.95})

        rm.AddIngredient("ll-core-extractor", "bearing", 20)
        rm.ReplaceIngredientProportional("ll-rocket-silo-interstellar", "pipe", "galvanized-tubing")

        rm.MultiplyRecipe("ll-mass-driver-capsule", 10)
        rm.AddIngredient("ll-mass-driver-capsule", "skyseeker-armature", 1)
        rm.AddIngredient("ll-mass-driver", "skyseeker-armature", 20)
    else
        rm.ReplaceIngredientProportional("ll-lunar-foundation", "steel-plate", "galvanized-steel-plate")
        if misc.difficulty == 2 then
            rm.ReplaceIngredientProportional("ll-telescope", "iron-gear-wheel", "complex-joint")
        end
    end

    if misc.difficulty > 1 then
        rm.ReplaceIngredientProportional("ll-arc-furnace", "steel-plate", "hardened-hull")
        rm.ReplaceIngredientProportional("ll-rocket-silo-interstellar", "steel-plate", "hardened-hull", 1, 200)

        if not data.raw.item["grabber"] then
            rm.AddIngredient("ll-ion-logistic-robot", "complex-joint", 2)
            rm.AddIngredient("ll-ion-construction-robot", "complex-joint", 2)
        end
        rm.ReplaceIngredientProportional("ll-ion-roboport", "steel-plate", "galvanized-steel-plate")
    end
end

--mods that just use vanilla-like ore generation will not get special design effort
if mods["tenebris"] then
    data.raw.planet["tenebris"].map_gen_settings.autoplace_controls["zinc-ore"] = {}
    data.raw.planet["tenebris"].map_gen_settings.autoplace_settings.entity.settings["zinc-ore"] = {}    
end

if mods["terrapalus"] then
    data.raw.planet["terrapalus"].map_gen_settings.autoplace_controls["zinc-ore"] = {}
    data.raw.planet["terrapalus"].map_gen_settings.autoplace_settings.entity.settings["zinc-ore"] = {}    
end

if mods["maraxsis"] then
    rm.AddProduct("maraxsis-geothermal-sulfur", "sphalerite", 8)

    if misc.difficulty == 3 then
        if not mods["IfNickelMk2"] then
            rm.ReplaceIngredientProportional("maraxsis-hydro-plant", "pipe", "galvanized-tubing")
        end
    end

    rm.ReplaceIngredientProportional("maraxsis-pressure-dome", "pipe", "pump", 0.2)
    if misc.difficulty > 1 and not mods["BrimStuffMk2"] then
        rm.AddIngredient("maraxsis-wyrm-confinement-cell", "pipe-flange", 1)
    end

    rm.AddRecipeCategory("pipe-flange", "maraxsis-hydro-plant")

    if misc.difficulty == 3 then
        rm.ReplaceIngredientProportional("maraxsis-oversized-steam-turbine", "tungsten-plate", "spurving-bearing", 0.5, 40)
    end
end

--cerys: I'm really not sure if you can obtain all ores in decent ratios from recycling stuff.
--as I understand it cerys is a meticulously designed puzzle, adding explicit compat would almost be like adding compat with ultracube

--arrakis, shattered planet: incomplete

if mods["Paracelsin"] then
    data.raw.item["zinc"].localised_name = {"item-name.glacite"}
    data.raw.item["pcl-zinc-plate"].localised_name = {"item-name.glacite-plate"}
    data.raw.item["pcl-sphalerite"].localised_name = {"item-name.glacial-sphalerite"}
    data.raw.item["tetrahedrite"].localised_name = {"item-name.glacial-tetrahedrite"}
    data.raw.item["pcl-galvanized-steel-plate"].localised_name = {"item-name.plasteel-plate"}
    data.raw.item["zinc-solder"].localised_name = {"item-name.self-sealing-solder"}
    data.raw.item["zinc-rivets"].localised_name = {"item-name.extremely-high-tensile-riveting"}
    data.raw.tool["galvanization-science-pack"].localised_name = {"item-name.insulation-science-pack"}
    data.raw.fluid["zinc-solution"].localised_name = {"fluid-name.glacite-solution"}

    data.raw.recipe["zinc-solder"].localised_name = {"item-name.self-sealing-solder"}
    data.raw.recipe["zinc-rivets"].localised_name = {"item-name.extremely-high-tensile-riveting"}

    data.raw.item["zinc-pipe"].localised_name = {"item-name.insulated-pipe"}
    data.raw.pipe["zinc-pipe"].localised_name = {"item-name.insulated-pipe"}
    data.raw.item["zinc-pipe-to-ground"].localised_name = {"item-name.insulated-pipe-to-ground"}
    data.raw["pipe-to-ground"]["zinc-pipe-to-ground"].localised_name = {"item-name.insulated-pipe-to-ground"}
    data.raw.item["zinc-pump"].localised_name = {"item-name.insulated-pump"}
    data.raw.pump["zinc-pump"].localised_name = {"item-name.insulated-pump"}
    data.raw.item["zinc-storage-tank"].localised_name = {"item-name.insulated-storage-tank"}
    data.raw["storage-tank"]["zinc-storage-tank"].localised_name = {"item-name.insulated-storage-tank"}

    data.raw.resource["sphalerite"].localised_name = {"entity-name.glacial-sphalerite"}
    data.raw.resource["tetrahedrite"].localised_name = {"entity-name.glacial-tetrahedrite"}
    data.raw.resource["sphalerite"].minable.result="pcl-sphalerite"

    data.raw.technology["galvanized-steel"].localised_name = {"technology-name.plasteel"}
    data.raw.technology["galvanized-steel"].localised_description = {"technology-description.plasteel"}
    data.raw.technology["zinc-piping"].localised_name = {"technology-name.plasteel-piping"}
    data.raw.technology["zinc-piping"].localised_description = {"technology-description.plasteel-piping"}
    data.raw.technology["galvanization-science-pack"].localised_name = {"technology-name.insulation-science-pack"}
    data.raw.technology["galvanization-science-pack"].localised_description = {"technology-description.insulation-science-pack"}

    data.raw.recipe["casting-galvanized-steel-plate"].localised_name = {"recipe-name.casting-plasteel"}

    rm.RemoveProduct("zinc-purification", "stone", 5)
    rm.AddProduct("zinc-purification", "zinc-ore", 5)
    rm.AddProduct("sphalerite-processing", "zinc-ore", 1)
    rm.AddProduct("tetrahedrite-processing", "zinc-ore", 1)
    rm.AddProduct("sphalerite-melting", "molten-zinc", 50)
    rm.AddProduct("tetrahedrite-melting", "molten-zinc", 25)

    rm.AddRecipeCategory("bearing", "mechanics")
    rm.AddRecipeCategory("linkages", "mechanics")
    rm.AddRecipeCategory("complex-joint", "mechanics")
    rm.AddRecipeCategory("fast-gearbox", "mechanics")
    rm.AddRecipeCategory("gyro", "mechanics")
    rm.AddRecipeCategory("pipe-flange", "mechanics")
    rm.AddRecipeCategory("express-gearbox", "mechanics")
    rm.AddRecipeCategory("loadbearing-lattice", "mechanics")
    rm.AddRecipeCategory("skyseeker-armature", "mechanics")

    table.insert(data.raw["simple-entity"]["crashed-fulgoran-pod"].minable.results, {type="item", name="brass-plate", amount_min=2, amount_max=15})
    table.insert(data.raw["simple-entity"]["crashed-fulgoran-pod"].minable.results, {type="item", name="bearing", amount_min=1, amount_max=6}) -- needed to craft turbines
    table.insert(data.raw["simple-entity"]["big-metallic-rock"].minable.results, {type="item", name="zinc-ore", amount_min=5, amount_max=11})

    if misc.difficulty > 1 then
        rm.ReplaceIngredientProportional("mechanical-plant", "iron-gear-wheel", "complex-joint", 0.5)
    end

    if misc.difficulty == 3 then
        table.insert(data.raw["simple-entity"]["crashed-fulgoran-pod"].minable.results, {type="item", name="galvanized-tubing", amount_min=2, amount_max=15}) -- needed to craft turbines, engine units

        rm.ReplaceIngredientProportional("elevated-pipe", "iron-stick", "loadbearing-lattice", 0.2)
        rm.ReplaceIngredientProportional("elevated-pipe", "pipe", "galvanized-tubing")
        if not mods["IfNickelMk2"] then
            rm.AddIngredient("electrochemical-plant", "galvanized-tubing", 20)
        end

        rm.AddIngredient("nitric-acid-rocket-fuel", "galvanized-panel")
        if not mods["BrimStuffMk2"] then
            rm.AddIngredient("nitric-acid-rocket-fuel", "pipe-flange")
        end
    end
end

if mods["castra"] then
    data.raw.planet["castra"].map_gen_settings.autoplace_controls["ancient_military_wreckage"] = {}
    data.raw.planet["castra"].map_gen_settings.autoplace_settings.entity.settings["ancient-military-wreckage"] = {}  
    if not data.raw.planet["castra"].map_gen_settings.property_expression_names then
        data.raw.planet["castra"].map_gen_settings.property_expression_names = {}
    end
    data.raw.planet["castra"].map_gen_settings.property_expression_names["entity:ancient-military-wreckage:richness"] = "military_wreckage_richness"
    data.raw.planet["castra"].map_gen_settings.property_expression_names["entity:ancient-military-wreckage:probability"] = "military_wreckage_probability"

    tm.AddUnlock("planet-discovery-castra", "bullet-casing-sorting")
    tm.AddUnlock("planet-discovery-castra", "ancient-military-wreckage-recycling")
    if misc.difficulty == 3 then
        tm.AddUnlock("gunpowder-processing", "blast-galvanized-panel")
        tm.AddUnlock("gunpowder-processing", "blast-galvanized-rod")
        tm.AddUnlock("gunpowder-processing", "blast-galvanized-tubing")

        rm.AddIngredient("battery-nickel", "galvanized-panel")
        rm.AddIngredient("rocket-fuel-sulfur", "galvanized-panel")
        if not mods["BrimStuffMk2"] then
            rm.AddIngredient("rocket-fuel-sulfur", "pipe-flange")
        end

        rm.AddIngredient("forge", "complex-joint", 12)
        if not mods["IfNickelMk2"] then
            rm.ReplaceIngredientProportional("engine-unit-gunpowder", "pipe", "galvanized-tubing")
        end
    end
    tm.AddUnlock("gunpowder-processing", "blast-galvanized-steel-plate")

    rm.AddProduct("jammed-data-collector-process", {type="item", name="ancient-military-wreckage", amount=1, probability=0.15})

    if misc.difficulty > 1 then
        tm.AddUnlock("millerite-processing", "flywheel-nickel")
        tm.AddUnlock("millerite-processing", "hardened-hull-nickel")

        rm.ReplaceIngredientProportional("tank-nickel", "iron-gear-wheel", "hardened-hull")
        rm.ReplaceIngredientProportional("forge", "steel-plate", "hardened-hull")

        rm.AddIngredient("engine-unit-gunpowder", "linkages", 1)
        rm.AddIngredient("distractor-capsule-castra-data", "gyro", 4)
        rm.AddProduct("ancient-military-wreckage-recycling", {type="item", name="hardened-hull", amount=1, probability=0.05})

        rm.AddIngredient("military-transport-belt", "hardened-hull", 2)
        rm.AddIngredient("military-underground-belt", "hardened-hull", 5)
        rm.AddIngredient("military-splitter", "complex-joint", 2)
    else
        rm.ReplaceIngredientProportional("forge", "steel-plate", "galvanized-steel-plate")
        --need to get back to my roots of this being a mod about spamming the recipe for every vaguely mechanical thing with gears
        rm.AddIngredient("military-splitter", "iron-gear-wheel", 10)
    end

    rm.AddIngredient("firearm-magazine-nickel", "brass-plate", 1)

    tm.AddUnlock("scrap-recycling-productivity", {type="change-recipe-productivity", recipe="bullet-casing-sorting", change=0.1})
    tm.AddUnlock("scrap-recycling-productivity", {type="change-recipe-productivity", recipe="ancient-military-wreckage-recycling", change=0.1})
end