local rm = require("__pf-functions__/recipe-manipulation")

if data.raw.item["skyseeker-armature"] and mods["planet-muluna"] then
    for k, v in pairs(data.raw.recipe) do
        if v.category == "muluna-telescope" then
            rm.AddIngredient(v, "skyseeker-armature")
            rm.AddProduct(v, {type="item", name="skyseeker-armature", amount=1, probability=0.9, ignored_by_productivity=1})
            v.allow_quality = false
        end
    end 
end