-- Mesecon (Mesecons mod)

local output = _xtend.g('xindustrial_mesecons_output')
local cooktime = _xtend.g('xindustrial_mesecons_cooktime')

minetest.register_craft({
    type = 'cooking',
    recipe = 'xindustrial:molded_mese_crystal',
    output = 'mesecons:wire_00000000_off '..output,
    cooktime = cooktime
})
