local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if not mods["scrap-industry"] then
    return
end

local item_sounds = require("__base__/prototypes/item_sounds")

data:extend({
    {
        type = "item",
        name = "zinc-scrap",
        icon = "__BrassTacksMk2__/graphics/vector/icons/zinc-scrap.png",
        icon_size = 64,
        subgroup = "production-scrap",
        order = "a[material]-da[zinc]",
        color_hint = { text = "Z" },
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        default_import_location = "nauvis",
        canonical_cost = 1,
        weight = 2*kg
      },
      {
        type = "item",
        name = "brass-scrap",
        icon = "__BrassTacksMk2__/graphics/vector/icons/brass-scrap.png",
        icon_size = 64,
        subgroup = "production-scrap",
        order = "a[material]-db[brass]",
        color_hint = { text = "B" },
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        default_import_location = "nauvis",
        canonical_cost = 1,
        weight = 2*kg
      },
      {
        type = "recipe",
        name = "zinc-plate-from-scrap",
        icons = {
            {
                icon = "__BrassTacksMk2__/graphics/vector/icons/zinc-scrap.png",
                icon_size = 64,
                shift = {-4, -4}
            },
            {
                icon = misc.VariableGraphicsPath("__BrassTacksMk2__/graphics", "icons/zinc-plate.png"),
                icon_size = 64,
                shift = {4, 4}
            }
        },
        hide_from_player_crafting = true,
        subgroup = "production-scrap",
        order = "b[smelting]-da[zinc]",
        category = "smelting",
        energy_required = 3.2,
        allow_productivity = true,
        enabled = true,
        ingredients = {
            {type="item", name="zinc-scrap", amount=2}
        },
        results = {
            {type="item", name="zinc-plate", amount=1}
        }
      },
      {
        type = "recipe",
        name = "brass-plate-from-scrap",
        icons = {
            {
                icon = "__BrassTacksMk2__/graphics/vector/icons/brass-scrap.png",
                icon_size = 64,
                shift = {-4, -4}
            },
            {
                icon = misc.VariableGraphicsPath("__BrassTacksMk2__/graphics", "icons/brass-plate.png"),
                icon_size = 64,
                shift = {4, 4}
            }
        },
        hide_from_player_crafting = true,
        subgroup = "production-scrap",
        order = "b[smelting]-db[brass]",
        category = "smelting",
        energy_required = 1.6,
        allow_productivity = true,
        enabled = true,
        ingredients = {
            {type="item", name="brass-scrap", amount=2}
        },
        results = {
            {type="item", name="brass-plate", amount=1}
        }
      }
})

if mods["space-age"] then
    data:extend({
        {
            type = "recipe",
            name = "molten-zinc-from-scrap",
            icons = {
                {
                    icon = "__BrassTacksMk2__/graphics/vector/icons/zinc-scrap.png",
                    icon_size = 64,
                    shift = {-4, -4}
                },
                {
                    icon = "__pf-sa-compat__/graphics/icons/molten-zinc.png",
                    icon_size = 64,
                    shift = {4, 4}
                }
            },
            hide_from_player_crafting = true,
            subgroup = "production-scrap",
            order = "e[melting]-da[molten-zinc]",
            category = "metallurgy",
            energy_required = 64,
            allow_productivity = true,
            enabled = false,
            ingredients = {
                {type="item", name="zinc-scrap", amount=50},
                {type="item", name="calcite", amount=1}
            },
            results = {
                {type="fluid", name="molten-zinc", amount=200}
            }
        },
        {
            type = "recipe",
            name = "brass-liquation",
            icons = {
                {
                    icon = "__BrassTacksMk2__/graphics/vector/icons/brass-scrap.png",
                    icon_size = 64,
                    shift = {-5, -5}
                },
                {
                    icon = "__space-age__/graphics/icons/fluid/molten-copper.png",
                    icon_size = 64,
                    scale = 0.33,
                    shift = {-4, 5}
                },
                {
                    icon = "__pf-sa-compat__/graphics/icons/molten-zinc.png",
                    icon_size = 64,
                    scale = 0.33,
                    shift = {5, 5}
                }
            },
            hide_from_player_crafting = true,
            subgroup = "production-scrap",
            order = "e[melting]-db[molten-brass]",
            category = "metallurgy",
            energy_required = 64,
            allow_productivity = true,
            enabled = false,
            ingredients = {
                {type="item", name="brass-scrap", amount=50},
                {type="item", name="calcite", amount=1}
            },
            results = {
                {type="fluid", name="molten-zinc", amount=100},
                {type="fluid", name="molten-copper", amount=100}
            }
        }
    })
end
