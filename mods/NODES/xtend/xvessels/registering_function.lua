_xtend.i()


-- +l  liquid texture
-- +m  top material
-- +f  foots material
local top = '+m.png^(+l^xvessels_mask_top.png^[makealpha:0,0,0)'
local bottom = '+m.png^(+f.png^xvessels_mask_bottom.png^[makealpha:0,0,0)'
local sides = '+m.png^(+f.png^xvessels_mask_foot.png^[makealpha:0,0,0)'


local nodebox = {
    {-0.5, 0, -0.5, 0.5, 0.0625, 0.5}, -- Bottom
    {-0.5, 0.0625, -0.5, 0.5, 0.3125, -0.375}, -- Side_1
    {-0.5, 0.0625, 0.375, 0.5, 0.3125, 0.5}, -- Side_2
    {0.375, 0.0625, -0.5, 0.5, 0.3125, 0.5}, -- Side_3
    {-0.5, 0.0625, -0.5, -0.375, 0.3125, 0.5}, -- Side_4
    {-0.375, -0.5, -0.375, -0.1875, 0.0625, -0.1875}, -- Foot_1
    {-0.4375, 0.0625, -0.4375, 0.4375, 0.1875, 0.4375}, -- Center_part
    {0.1875, -0.5, 0.1875, 0.375, 0.0625, 0.375}, -- Foot_2
    {-0.375, -0.5, 0.1875, -0.1875, 0.0625, 0.375}, -- Foot_3
    {0.1875, -0.5, -0.375, 0.375, 0.0625, -0.1875} -- Foot_4
}


-- Register a vessel
--
-- The registering function takes the desired ID and a settings table as
-- described below to create a vessel.
--
--     settings = {
--         -- The name of the vessel to register. This could either be a single
--         -- String or the return value of a translation function.
--         name = 'Foobar Vessel',
--
--         -- ID of the material the top of the vessel is made. This is used
--         -- for crafting the vessel and also for the texture of the top part.
--         top_material = 'mod:node',
--
--         -- This table holds two values. The first value is the item that is
--         -- needed for the foots when crafting the vessel and the second
--         -- entry is the ID of the node that will be used to create the
--         -- texture from.
--         foot_material = { 'mod:node', 'mod::node' },
--
--         -- Defines if the vessel is a source of light. For example a lava
--         -- brazier that emitts light. If set to a number it emitts light of
--         -- the defined intensity. If set to `false` the vessel is not a
--         -- source of light.
--         light_source = 5,
--
--         -- A groups table as described in the Minetest developers wiki. You
--         -- need to add a `break group` at least (otherwise the vessel is
--         -- unbreakable by tools/hand when not in creative mode).
--         groups = {},
--
--         -- A sounds table as described in the Minetest Lua API documentation,
--         -- or one of the default sounds tables described there, too. If not
--         -- filled with valid sounds definition the vessel does not make any
--         -- sounds when placing or mining.
--         sounds = {},
--
--         -- The texture that is used for the liquid that is in the vessel.
--         liquid_texture = 'texture.png',
--
--         -- The bucket will be used for crafting the vessel and is the bucket
--         -- that will be returned when punching the node with the item that
--         -- is set for the `take_with` entry.
--         bucket = 'mod:item_filled',
--
--         -- When punching the node with this item the item set for `bucket`
--         -- will be returned in exchange for one of this items.
--         take_with = 'mod:empty'
--     }
--
-- @param id       The ID of the vessel to create
-- @param settings The settings table as described
_xtend.f.xvessels.register = function(id, settings)

    local top_material = settings.top_material
    local foot_material_crafting = settings.foot_material[1]
    local foot_material_display = settings.foot_material[2]
    local crafting_bucket = settings.items.craft

    local texture_top = ''
    local texture_bottom = ''
    local texture_sides = ''

    texture_top = top:gsub('+.', {
        ['+l'] = settings.liquid_texture,
        ['+m'] = top_material:gsub(':','_')
    })

    texture_bottom = bottom:gsub('+.', {
        ['+f'] = foot_material_display:gsub(':','_'),
        ['+m'] = top_material:gsub(':','_')
    })
    texture_sides = sides:gsub('+.', {
        ['+f'] = foot_material_display:gsub(':','_'),
        ['+m'] = top_material:gsub(':','_')
    })

    -- Add more groups
    settings.groups['_xvessels'] = 1

    minetest.register_node(id, {
        description = settings.name,
        groups = settings.groups,
        _xvessels = { get = settings.items.get },
        drawtype = 'nodebox',
        paramtype = 'light',
        light_source = settings.light_source and settings.light_source or nil,
        sounds = settings.sounds,
        node_box = { type = 'fixed', fixed = nodebox },
        tiles = {
            texture_top,
            texture_bottom,
            texture_sides, -- right
            texture_sides, -- left
            texture_sides, -- back
            texture_sides  -- front
        },
        on_punch = function(pos, node, player, pointed_thing)
            local wielded = player:get_wielded_item()
            local inventory = player:get_inventory()
            local attributes = minetest.registered_nodes[node.name]._xvessels
            for _,pair in pairs(attributes.get) do
                local match = (pair[1] == wielded:get_name())
                local room = inventory:room_for_item('main', pair[2]..' 1')
                if match and room then
                    wielded:take_item()
                    player:set_wielded_item(wielded)
                    inventory:add_item('main', pair[2]..' 1')
                end
            end
        end
    })

    minetest.register_craft({
        output = id,
        recipe = {
            {top_material,           crafting_bucket, top_material},
            {top_material,           top_material,    top_material},
            {foot_material_crafting, '',              foot_material_crafting}
        }
    })

end
