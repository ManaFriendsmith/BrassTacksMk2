local rm = require("__pf-functions__/recipe-manipulation")
local misc = require("__pf-functions__/misc.lua")

require("compat/vanilla")
if mods["space-age"] then
    require("compat/space-age")
end

require("compat/bz")
require("compat/mod-planets")
require("compat.small-mod")
require("compat.deadlock")

if mods["recycler"] and misc.last_pf_mod == "BrassTacksMk2" then
    rm.FixStackingRecycling()
    require("__recycler__/data-updates.lua")

    local biggest_result_list = data.raw.furnace.recycler.result_inventory_size
    for k, v in pairs(data.raw.recipe) do
      for k2, v2 in pairs(v.categories or {"crafting"}) do
        if v2 == "recycling" or v2 == "recycling-or-hand-crafting" then
          if v.results and #v.results > biggest_result_list then
            biggest_result_list = #v.results
          end
        end
      end
    end
    data.raw.furnace.recycler.result_inventory_size = biggest_result_list
    if mods["Age-of-Production"] then
        data.raw.furnace["aop-salvager"].result_inventory_size = biggest_result_list
    end

    rm.SortScrapProducts("scrap-recycling")
    rm.SortScrapProducts("cerys-nuclear-scrap-recycling")
    rm.SortScrapProducts("ancient-military-wreckage-recycling")
end

if mods["quality"] then
  data.raw["tips-and-tricks-item"]["quality-modules"].simulation.init = [[
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.forces.player.unlock_quality("uncommon")
    game.forces.player.unlock_quality("rare")

    local technology = "inserter-capacity-bonus-2"
    local technologies = prototypes.technology
    for name, prerequisite in pairs (technologies[technology].prerequisites) do
      game.forces.player.technologies[name].researched = true
    end
    game.forces.player.technologies[technology].researched = true

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrtWl1vozoQ/S9+hhW2MZhK95dUUUQSp7UuGK6B7mar/Pdr8r0tJDOz+7btS1VsznjmzBzsqd/ZqhpM663r2dM7s+vGdezp+Z119sWV1fjMlbVhT2xbdn3c+9J1beP7eGWqnu0jZt3G/GBPfB9NvFN2nalXlXUvcV2uX60zsbx5SewXETOut701R6uHP3ZLN9Qr4wNqdEaybmtdGIrXr6brWcTapguvNW60NtpPsm8qYrsAqr+pg4njC8vO9H1YQDdO9KZu3sxyCGNVb7zZLG1v6jC0LavOROz4+LiUs2HfuLityt4Eo+tmGOPEkyRidbM5uNjHlSkPS7qEYrEfo/HBFxH9EsmqKTfh8R1HZBLc2Fhv1sdhHbF+144AzdC3wxj9T0ZkdI+ue8b4IWo35tIJ+BTtg9wDVq0INMv0j9K88iFX/wjPGcUZRXCm94OZWkCOzYH818p5kAOaDF8E+AnAggook2lAnpAR+Qwihya+vuXzJpJcXOrAupky4AK7bo1ijqPVocDhp1T8UzE/wldk/Ak+pgxkSAM8wQUop+IDA6TJ+MAAYWuVc1SAxIfKta4zvp+stCvyjKwIjseScgZLUP2GESckGR9GnMCWJhc44q6lObnnu2PgtPMI8La9bLheTOnj76/GVOw8tPxvKKtgM0xxja/LceT0JQyfcbu52XaeZsbh0z1U5y3ncWqY6ZbWvYX1N353fPX6V4hS15frf9lTMjo5OcJnR8TsiBy3CoupuGVUXoCJlZPxgYmFlhyJS6yr4tRmY4c6NlWY7+06bpvK3DVQHAxc02Zw66auw8ypjXNC9QNGhORkfBgREi1RKYoIKeFymj6QZpniseakWSqq30DiMjI+kDh0iSoccRotzepLmsNAQeUFllhpQsaHJVaKlpwMlVipoOIDAyTJ+MAAoTdFuJNyquAy9+iQnGZ4rDnJTHOq30DiNBkfSBy6NHEHZZWgJVN/SWaIG6fyAkssJcj4sMRSaMnBdUhUSsUHBkiR8YEBwu6GBK5DonKwzF2RZyRTaTzWnGSqguo3jLgsIePDiMuwpSlwnZtMYCXzYuCvlsxMUnkBJlZKxgcmFlZyBK6zlGXYBsDVAKYBkOVUP4BEaDI+kAi0ROE6MTm8NyvkA2nOOR5rTppzQfUbRlwuyfgw4nJ0ieI6Nzm6N3sx8FdLc55ReQEmVk7GByYWWnJwnaW8oOLDAqQTMj4sQBq9KcJ1SLSAy1z2QDK1xGPNSaZOqX4DiVNkfCBx6NJE3nHI0ZKZf0lmiJum8gJMrIKMD0usAi05uM5Swan4sAAVgowPDBB6N4TrkBQfpKlrQ+rPyNy1N/IB93zD66aGPpfhRP2F00Fb+jKke3j6z1hmxztry9bbxh8nV2Y7eXmnUNTAQCOP1TyJa70UORX/8Jl5jK/J+J9SX0/hF2R84OWXJMEeRSWnHEV5Ar1uNv7Td5pgwG2zROCsTNAMsXIVjEu0jDP+ZRe2MKFGt+V6MnLy9DUNFlfDdmv8srM/zYGF88+kuRR+/VLK37kyPHf9kieKsIRTcClLWETse+Bk3Dg8iyJSUZZFahE9j7+iMWnVYnHcMIz3XC+3vSP2Znx3WIvKRKFSkepccy3S/f5/Zk4jGg==",
      position = {0, 1}
    }
  ]]
end