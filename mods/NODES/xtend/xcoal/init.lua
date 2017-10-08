_xtend.i()


local charcoal_output = _xtend.g('xcoal_charcoal_output')
local charcoal_cooktime = _xtend.g('xcoal_charcoal_cooktime')
local charcoal_burntime = _xtend.g('xcoal_charcoal_burntime')
local charcoal_torches_output = _xtend.g('xcoal_charcoal_torches_output')
local ccb_burntime = _xtend.g('xcoal_compressed_coalblock_burntime')
local ccb_uncraft_yield = _xtend.g('xcoal_compressed_coalblock_uncraft_yield')
local ccb_crafting_yield = _xtend.g('xcoal_compressed_coalblock_crafting_yield')


-- Smelt xcoal:charcoal from default:tree and default:jungletree

minetest.register_craftitem('xcoal:charcoal', {
    description = _xtend.t('Charcoal'),
    inventory_image = 'default_coal_lump.png^[transform3'
})

minetest.register_craft({
    type = 'cooking',
    recipe = 'group:tree',
    output = 'xcoal:charcoal '..charcoal_output,
    cooktime = charcoal_cooktime
})

minetest.register_craft({
	type = 'fuel',
	recipe = 'xcoal:charcoal',
	burntime = charcoal_burntime
})


-- Craft default items with charcoal

minetest.register_craft({
	output = 'default:torch '..charcoal_torches_output,
	recipe = {
		{'xcoal:charcoal'},
		{'group:stick'}
	}
})

minetest.register_craft({
	output = 'default:coalblock',
	recipe = {
		{'xcoal:charcoal', 'xcoal:charcoal', 'xcoal:charcoal'},
		{'xcoal:charcoal', 'xcoal:charcoal', 'xcoal:charcoal'},
		{'xcoal:charcoal', 'xcoal:charcoal', 'xcoal:charcoal'}
	}
})


-- Compressed coal block

minetest.register_node('xcoal:compressed_coalblock', {
	description = _xtend.t('Compressed Coal Block'),
	tiles = {'default_coal_block.png^[colorize:#00000066'},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_craft({
	output = 'xcoal:compressed_coalblock '..ccb_crafting_yield,
	recipe = {
		{'default:coalblock', 'default:coalblock', 'default:coalblock'},
		{'default:coalblock', 'default:coalblock', 'default:coalblock'},
		{'default:coalblock', 'default:coalblock', 'default:coalblock'}
	}
})

minetest.register_craft({
	type = 'fuel',
	recipe = 'xcoal:compressed_coalblock',
	burntime = ccb_burntime
})

minetest.register_craft({
	output = 'default:coalblock '..ccb_uncraft_yield,
	recipe = {
        {'xcoal:compressed_coalblock'}
    }
})
