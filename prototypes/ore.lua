local resource_autoplace = require("resource-autoplace")

if mods["galdocs-manufacturing"] then
  return
end

local zinc_sim = table.deepcopy(data.raw.resource["iron-ore"].factoriopedia_simulation)
zinc_sim.init = string.gsub(zinc_sim.init, "iron", "zinc")

data:extend({
  {
    type = "resource",
    name = "zinc-ore",
    icon = "__BrassTacksMk2__/graphics/icons/zinc-ore.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral"},
    order="a-b-x",
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_particle = "zinc-particle",
      mining_time = 1,
      result = "zinc-ore"
    },
    walking_sound = data.raw.resource["iron-ore"].walking_sound,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "zinc-ore",
      order = "a-e",
      base_density = 4,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1.1,
      starting_rq_factor_multiplier = 1.1,
      candidate_spot_count = 22
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__BrassTacksMk2__/graphics/entity/zinc-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    map_color = {0.9, 0.9, 0.9},
    mining_visualisation_tint = {r=0.7, g=0.7, b=0.75},
    factoriopedia_simulation = zinc_sim
  },
  {
    type = "autoplace-control",
    category = "resource",
    name = "zinc-ore",
    localised_name = {"", "[entity=zinc-ore] ", {"entity-name.zinc-ore"}},
    richness = true,
    order = "a-e"
  }
})

if mods["LunarLandings"] then
  local cheese_sim = table.deepcopy(data.raw.resource["iron-ore"].factoriopedia_simulation)
  cheese_sim.init = string.gsub(cheese_sim.init, "iron", "cheese")

  data:extend({
    {
      type = "resource",
      name = "cheese-ore",
      icon = "__BrassTacksMk2__/graphics/icons/cheese-ore.png",
      icon_size = 64,
      icon_mipmaps = 4,
      flags = {"placeable-neutral"},
      order="a-b-x",
      tree_removal_probability = 0.8,
      tree_removal_max_distance = 32 * 32,
      minable =
      {
        mining_particle = "zinc-particle",
        mining_time = 1,
        result = "cheese-ore"
      },
      walking_sound = data.raw.resource["iron-ore"].walking_sound,
      collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      autoplace = resource_autoplace.resource_autoplace_settings
      {
        name = "cheese-ore",
        order = "a-b-e",
        base_density = 4,
        has_starting_area_placement = false,
        regular_rq_factor_multiplier = 1.0,
        starting_rq_factor_multiplier = 1.1,
        candidate_spot_count = 16
      },
      stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
      stages =
      {
        sheet =
        {
          filename = "__BrassTacksMk2__/graphics/entity/cheese-ore.png",
          priority = "extra-high",
          size = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5
        }
      },
      map_color = {1, 0.8, 0},
      mining_visualisation_tint = {1, 0.9, 0},
      factoriopedia_simulation = cheese_sim
    },
    {
      type = "autoplace-control",
      category = "resource",
      name = "cheese-ore",
      localised_name = {"", "[entity=cheese-ore] ", {"entity-name.cheese-ore"}},
      richness = true,
      order = "d-ca"
    }
  })

  data.raw.resource["cheese-ore"].autoplace.default_enabled = false
  data.raw.resource["cheese-ore"].autoplace.tile_restriction = {"ll-luna-plain"}

  data.raw.planet["luna"].map_gen_settings.autoplace_controls["cheese-ore"] = {}
  data.raw.planet["luna"].map_gen_settings.autoplace_settings.entity.settings["cheese-ore"] = {}
end

data.raw.planet["nauvis"].map_gen_settings.autoplace_controls["zinc-ore"] = {}
data.raw.planet["nauvis"].map_gen_settings.autoplace_settings.entity.settings["zinc-ore"] = {}

if mods["castra"] then
  local mil_sim = table.deepcopy(data.raw.resource["iron-ore"].factoriopedia_simulation)
  mil_sim.init = string.gsub(mil_sim.init, "iron", "ancient-military")
  mil_sim.init = string.gsub(mil_sim.init, "ore", "wreckage")

  data:extend({
    {
      type = "resource",
      name = "ancient-military-wreckage",
      icon = "__BrassTacksMk2__/graphics/icons/ancient-military-wreckage.png",
      icon_size = 64,
      icon_mipmaps = 4,
      flags = {"placeable-neutral"},
      order="j-k",
      tree_removal_probability = 0.8,
      tree_removal_max_distance = 32 * 32,
      minable =
      {
        mining_particle = "scrap-particle",
        mining_time = 1,
        result = "ancient-military-wreckage"
      },
      walking_sound = data.raw.resource["scrap"].walking_sound,
      collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      autoplace = resource_autoplace.resource_autoplace_settings
      {
        name = "ancient-military-wreckage",
        order = "j-k",
        base_density = 4,
        has_starting_area_placement = true,
        regular_rq_factor_multiplier = 1.1,
        starting_rq_factor_multiplier = 1.1,
        candidate_spot_count = 22
      },
      stage_counts = {0},
      stages =
      {
        sheet =
        {
          filename = "__BrassTacksMk2__/graphics/entity/ancient-military-wreckage.png",
          priority = "extra-high",
          size = 94,
          frame_count = 4,
          variation_count = 4,
          scale = 0.5
        }
      },
      map_color = {0.15, 0.3, 0.15},
      mining_visualisation_tint = {r=0.15, g=0.5, b=0.15},
      factoriopedia_simulation = mil_sim
    },
    {
      type = "autoplace-control",
      category = "resource",
      name = "ancient_military_wreckage",
      localised_name = {"", "[entity=ancient-military-wreckage] ", {"entity-name.ancient-military-wreckage"}},
      richness = true,
      order = "j-k"
    },
    {
      type = "noise-expression",
      name = "military_wreckage_probability",
      expression = "if{condition=military_wreckage_richness, true_branch=noise_out, false_branch=0}",
      local_expressions = {
        noise_out = "(noise_micro * 10) + slider_to_linear(control:ancient_military_wreckage:richness, -8, 0)",
        noise_micro = "basis_noise{x=x*4, y=y+(x/10), seed0=map_seed, seed1=12345, input_scale=0.1, output_scale=0.8}"
      }
    },
    {
      type = "noise-expression",
      name = "military_wreckage_richness",
      expression = "mil_spot_noise * (sqrt(mil_noise + 1.5))",
      local_expressions = {
        mil_spot_noise = "spot_noise{x=x*1.25, y=y, density_expression=mil_density, spot_quantity_expression=mil_quantity, spot_radius_expression=mil_radius, spot_favorability_expression=elevation, seed0=24601, seed1=map_seed, basement_value=-100, maximum_spot_basement_radius=100, candidate_spot_count=mil_spot_count, hard_region_target_quantity=false}",
        noise_micro = "basis_noise{x=x*1.25, y=y+(x/10), seed0=map_seed, seed1=123, input_scale=1.25, output_scale=2}",
        noise_macro = "basis_noise{x=x*1.25, y=y+(x/10), seed0=map_seed, seed1=456, input_scale=0.01, output_scale=0.75}",
        mil_noise = "noise_micro + noise_macro",
        mil_density = "((distance_from_nearest_point{x = x, y = y, points = starting_positions} * 0.25) + 50) * 1000 * control:ancient_military_wreckage:richness",
        mil_quantity = "((distance_from_nearest_point{x = x, y = y, points = starting_positions} * 0.25) + 50) * 10000 * control:ancient_military_wreckage:richness",
        mil_spot_count = "20 * control:ancient_military_wreckage:frequency",
        mil_radius = "6 * control:ancient_military_wreckage:size * (mil_noise + 0.5)"
      }
    }
  })

end