local grit_output = _xtend.g('xindustrial_industrial_diamond_grit_output')
local diamonds_output = _xtend.g('xindustrial_raw_industrial_diamond_output')
local diamonds_cooktime = _xtend.g('xindustrial_industrial_diamond_cooktime')


local gritMask = 'xindustrial_industrial_diamond_grit_mask.png'..
                 '^[makealpha:0,0,0'..
                 '^[brighten'

minetest.register_craftitem('xindustrial:industrial_diamond_grit', {
    description = _xtend.t('Industrial Diamond Grit'),
    inventory_image = 'default_diamond_block.png^[combine:16x16:0,0='..gritMask
})

minetest.register_craftitem('xindustrial:raw_industrial_diamond', {
    description = _xtend.t('Raw Industrial Diamond'),
    inventory_image = 'default_diamond.png^[transform2^[brighten'
})

minetest.register_craftitem('xindustrial:industrial_diamond', {
    description = _xtend.t('Industrial Diamond'),
    inventory_image = 'default_diamond.png^[transform2'
})


minetest.register_craft({
    output = 'xindustrial:industrial_diamond_grit '..grit_output,
    recipe = {
        {'xcoal:compressed_coalblock',
        'group:sand',
        'xcoal:compressed_coalblock'},
        {'group:sand',
        'xcoal:compressed_coalblock',
        'group:sand'},
        {'xcoal:compressed_coalblock',
        'group:sand',
        'xcoal:compressed_coalblock'}
    }
})

minetest.register_craft({
    output = 'xindustrial:raw_industrial_diamond '..diamonds_output,
    recipe = {
        {'xindustrial:industrial_diamond_grit',
         'xindustrial:industrial_diamond_grit'},
        {'xindustrial:industrial_diamond_grit',
         'xindustrial:industrial_diamond_grit'}
    }
})

minetest.register_craft({
    type = 'cooking',
    output = 'xindustrial:industrial_diamond',
    recipe = 'xindustrial:raw_industrial_diamond',
    cooktime = diamonds_cooktime
})
