local crafting_yield = _xtend.g('xfurniture_crafting_yield')
local uncraft_yield = _xtend.g('xfurniture_uncraft_yield')
local use_lightsource = _xtend.g('xfurniture_use_light_source') == 'true'
local hide_objects = _xtend.g('xfurniture_hide_objects')
local ca_id = _xtend.v.xfurniture.crafting_addition.id
local ca_amount = _xtend.v.xfurniture.crafting_addition.amount


-- Get node definition from recipe
--
-- Since all parts of the reciepe are the same node it is okay to scan the
-- recipe table and return the first not empty field of the recipe for getting
-- the node description that will be used in the registering function.
local get_definition = function(recipe)
    for l,line in pairs(recipe) do
        for f,field in pairs(line) do
            if (field ~= '') and not (field == 'ca') then
                return _xtend.v.xfurniture.nodes[field]
            end
        end
    end
end


local parse_recipe = function(recipe)
    local parsed = {{},{},{}}
    local category = 0

    for l,line in pairs(recipe) do
        for f,field in pairs(line) do
            parsed[l][f] = (field == 'ca') and ca_id or field
            if field == 'ca' then
                if l == 1 then category = f end
                if l == 2 then category = f+3 end
                if l == 3 then category = f+6 end
            end
        end
    end

    return parsed,category
end


-- register an new furniture object
--
-- The function wants an object definition. An object definition is a simple
-- table containing the following information
--
--     {
--       name,
--       minetest_fixed_nodebox,
--       recipe_id_table
--     }
-- 
-- name: The name of the object to be registered. This name will be used as
--       node name only
--
-- minetest_fixed_nodebox: A `box` or table of boxes as described in the MT
--                         developer wiki but without any additional
--                         information. Only the box itselfas described in the
--                         examples. http://dev.minetest.net/Node_boxes
--
-- recipe_id_table: A table containing the recipe as described in the MT dev
--                  wiki http://dev.minetest.net/minetest.register_craft and
--                  the second entry of the table has to be the ID for the
--                  node of the object you're about to create.
--
-- @param table The nametable as described
-- @return void
_xtend.f.xfurniture.register = function(_object_definition_table)

    local _name = _object_definition_table[1]
    local _nodebox = _object_definition_table[2]
    local _recipe = _object_definition_table[3][1]
    local _object = _object_definition_table[3][2]

    local _node_definition = get_definition(_recipe)
    local _material = _node_definition.name
    local _lightsource = use_lightsource and _node_definition.light_source
    local _parsed_recipe,_category = parse_recipe(_recipe)

    local _description = _xtend.t('+o made of +d'):gsub('(+.)', {
        ['+o'] = _xtend.c(_name),
        ['+d'] = _node_definition.description
    })

    local _node_id = ('xfurniture:+o_+m'):gsub('+.', {
        ['+o'] = _object,
        ['+m'] = _material:gsub(':', '_')
    }):gsub('_+', '_')

    local _groups = {
        choppy = 2,
        oddly_breakable_by_hand = 1,
        dig_immediate = 2,
        flammable = 2,
        _xfurniture = 1,
        _xfurniture_category = _category
    }
    _groups['_xfurniture_'.._object] = 1

    if hide_objects == 'true' then
        -- Default creative inventory and all craftguides that respect it
        -- There might be some more. Please open an issue if you enabled the
        -- corresponding option and the items are still shown in your favorite
        -- crafting assistance tool.
        --
        -- If you’re the author of such a tool feel free to implement checking
        -- for this standard group being present and hide objects when it is,
        -- or provide me with a group I can add here to hide the objects from
        -- your speciel inventory or formspec.
        _groups['not_in_creative_inventory'] = 1
    end


    minetest.register_node(_node_id, {
        description = _description,
        tiles = _node_definition.tiles,
        drawtype = 'nodebox',
        paramtype = 'light',
        paramtype2 = 'facedir',
        sounds = _node_definition.sounds,
        groups = _groups,
        light_source = _lightsource,
        node_box = {
            type = 'fixed',
            fixed = _nodebox
        }
    })

    minetest.register_craft({
        output = _node_id..' '..crafting_yield,
        recipe = _parsed_recipe,
        replacements = {{ca_id, ca_id..' '..ca_amount}}
    })

    minetest.register_craft({
        type = 'shapeless',
        output = _material..' '..uncraft_yield,
        recipe = {_node_id},
    })

end
