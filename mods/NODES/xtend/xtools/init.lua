_xtend.i()


local materials = {
    {'xindustrial:industrial_diamond', 'diamond'},
    {'xindustrial:molded_mese_crystal', 'mese'}
}

local farming_cotton_output = _xtend.g('xtools_farming_cotton_output')


for k,m in pairs(materials) do
    minetest.register_craft({
        output = 'default:pick_'..m[2],
        recipe = {
            {m[1], m[1], m[1]},
            {'', 'group:stick', ''},
            {'', 'group:stick', ''}
        }
    })

    minetest.register_craft({
        output = 'default:shovel_'..m[2],
        recipe = {
            {'', m[1], ''},
            {'', 'group:stick', ''},
            {'', 'group:stick', ''}
        }
    })

    minetest.register_craft({
        output = 'default:axe_'..m[2],
        recipe = {
            {m[1], m[1], ''},
            {m[1], 'group:stick', ''},
            {'', 'group:stick', ''}

        }
    })

    minetest.register_craft({
        output = 'default:sword_'..m[2],
        recipe = {
            {m[1]},
            {m[1]},
            {'group:stick'}

        }
    })


    -- Hoe from “farming” mod.

    minetest.register_craft({
        output = 'farming:hoe_'..m[2],
        recipe = {
            {m[1], m[1], ''},
            {'', 'group:stick', ''},
            {'', 'group:stick', ''}

        }
    })

end


-- Create farming:cotton from default:wool
-- Creating wool nodes from cotton string items is already possible, the
-- other way round is still missing. Strings can be used to craft several
-- items provided by various mods.

minetest.register_craft({
    output = 'farming:cotton '..farming_cotton_output,
    recipe = {
        {'group:wool'}
    }
})



