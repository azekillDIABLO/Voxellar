local relevant_nodes = {}
local to_replace = _xtend.v.xfurniture.replace
local relevant_nodes_counter = 0
local nodes_per_category = _xtend.v.xfurniture.nodes_per_category
local crafting_yield = _xtend.g('xfurniture_crafting_yield')
local uncraft_yield = _xtend.g('xfurniture_uncraft_yield')
local ca_id = _xtend.v.xfurniture.crafting_addition.id
local ca_amount = _xtend.v.xfurniture.crafting_addition.amount


-- From all xFurniture registered nodes extract the nodes where the reciepe has
-- to be altered and write them into `relevant_nodes` table. The node IDs are
-- the table IDs and the replacement is the value.
_xtend.d(_xtend.t('Fetching uncraftable objects'))
for category,nodes in pairs(nodes_per_category) do
    for id,definition in pairs(nodes_per_category[category]) do
        for _,match in pairs(to_replace) do
            local match_for = match[1]:gsub(':', '_')
            if string.sub(id, -string.len(match_for)) == match_for then
                relevant_nodes[id] = match[2]
                relevant_nodes_counter = relevant_nodes_counter + 1
            end
        end
    end
end


-- Iterate through all of the nodes where the reciepe has to be altered. Do it
-- for each match string from `to_replace`
_xtend.d(_xtend.t('Replacing recipes of +o uncraftable objects'):gsub('+.', {
    ['+o'] = relevant_nodes_counter
}))
for id,replacement in pairs(relevant_nodes) do
    local current_recipe = minetest.get_craft_recipe(id)['items']
    local new_fields = {}
    local recipe_3d = {{}, {}, {}}
    for i=1,9,1 do new_fields[i] = current_recipe[i] or '' end

    for pos,string in pairs(new_fields) do
        local new = string
        if string ~= ca_id and string ~= '' then new = replacement end
        if pos >= 1 and pos <= 3 then recipe_3d[1][pos] = new end
        if pos >= 4 and pos <= 6 then recipe_3d[2][pos-3] = new end
        if pos >= 7 and pos <= 9 then recipe_3d[3][pos-6] = new end
    end

    minetest.clear_craft({ output = id })

    -- Currently unusable because it adds nearly a minute of loading time
    -- See <https://github.com/minetest/minetest/issues/5790>
    --
    -- minetest.clear_craft({recipe = {{id}}})

    minetest.register_craft({
        output  = id..' '..crafting_yield,
        recipe = recipe_3d,
        replacements = {{ca_id, ca_id..' '..ca_amount}}
    })

    minetest.register_craft({
        type = 'shapeless',
        output = replacement..' '..uncraft_yield,
        recipe = {id}
    })
end
