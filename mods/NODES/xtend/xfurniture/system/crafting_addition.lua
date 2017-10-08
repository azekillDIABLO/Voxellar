local width = 15
local height = 7.75
local _formspec = 'size['..width..','..height..';]';


local to_formspec = function(addition)
    _formspec = _formspec..addition
end


local get_example_nodes = function (category)
    local nodes = _xtend.v.xfurniture.nodes_per_category
    local result = {}
    local objects_in_category = 0

    if nodes['category_'..category] == nil then return 0,0 end

    for id,node in pairs(nodes['category_'..category]) do
        for group in pairs(node.groups) do
            local xfurniture_group = string.sub(group,1,12) == '_xfurniture_'
            local not_category_group = group ~= '_xfurniture_category'
            if xfurniture_group and not_category_group then
                local replacement = 'xfurniture:%1_default_wood'
                local example = group:gsub('_xfurniture_(.*)', replacement)
                result[example] = example
            end
        end
    end


    for x,y in pairs(result) do objects_in_category = objects_in_category+1 end

    return result, objects_in_category
end


local show_category = function (category)
    local nodes = _xtend.v.xfurniture.nodes_per_category
    local current_field = 0
    local current_row = 0

    if nodes['category_'..category] == nil then return end
    
    for id,_ in pairs(get_example_nodes(category)) do
        current_field = current_field + 1
        to_formspec(('item_image_button[+x,+y;1,1;+i;+n;]'):gsub('+.', {
            ['+x'] = current_field + 2.25, -- current field
            ['+y'] = current_row, -- current row
            ['+i'] = id, -- ID of the node
            ['+n'] = id..','..category -- name (for fields)
        }))
        if current_field == (width - 7) then
            current_field = 0
            current_row = current_row + 1
        end
    end
end


local show_recipe = function (id)
    local recipe = minetest.get_craft_recipe(id)['items']
    local current_field = 0
    local current_row = 0

    for i=1,9 do
        local node = recipe[i]
        current_field = current_field + 1

        to_formspec(('item_image_button[+x,+y;1,1;+i;+n;]'):gsub('+.', {
            ['+x'] = ((width - 4) + current_field), -- current field (X)
            ['+y'] = current_row, -- current row (Y)
            ['+i'] = node and node or '', -- ID
            ['+n'] = 'crafting_field_'..current_row..current_field -- name
        }))

        if current_field == 3 then
            current_row = current_row + 1
            current_field = 0
        end
    end
end


local initialize_formspec = function(player, fields)
    local categories = _xtend.v.xfurniture.category_names

    for i=2,9 do
        local position = i-2
        local category = 'category_'..i
        local _,nodes_in_category = get_example_nodes(i)
        local label = categories[category]..' ('..nodes_in_category..')'
        to_formspec('button[0,'..position..';3,1;'..category..';'..label..']')
        if fields['category_'..i] then show_category(i) end
    end

    if type(fields) == 'table' then
        for field,_ in pairs(fields) do
            if string.sub(field,1,11) == 'xfurniture:' then
                local id,category = field:match("([^,]+),([^,]+)")
                show_category(category)
                show_recipe(id)
            end
        end
    end

end


local get_formspec = function(player, fields)
    local player_name = player:get_player_name()
    _formspec = 'size['..width..','..height..';]';
    initialize_formspec(player, fields)
    minetest.show_formspec(player_name, '_xfurniture_guide',_formspec)
end


minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname == '_xfurniture_guide' then
        get_formspec(player, fields)
    end
end)

---------------------------------------------------------------------------

local ca_id = _xtend.v.xfurniture.crafting_addition.id
local ca_amount = _xtend.v.xfurniture.crafting_addition.amount

minetest.register_craftitem(ca_id, {
    description = _xtend.t('Crafting Addition for xFurniture objects'),
    groups = {_xfurniture = 1},
    inventory_image = 'xfurniture_crafting_addition.png',
    stack_max = 2,
    on_use = function(item, player, pt) get_formspec(player, '') end
})

minetest.register_craft({
    type = 'shapeless',
    output = ca_id..' '..ca_amount,
    recipe = {'default:cobble', 'default:dirt', 'default:dirt'}
})
