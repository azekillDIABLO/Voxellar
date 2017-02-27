minetest.register_node("wood_plus:aspen_ladder", {
	description = "Aspen Ladder",
	drawtype = "signlike",
	tiles = {"wood_plus_aspen_ladder.png"},
	inventory_image = "wood_plus_aspen_ladder.png",
	wield_image = "wood_plus_aspen_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("wood_plus:pine_ladder", {
	description = "Pine Ladder",
	drawtype = "signlike",
	tiles = {"wood_plus_pine_ladder.png"},
	inventory_image = "wood_plus_pine_ladder.png",
	wield_image = "wood_plus_pine_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("wood_plus:acacia_ladder", {
	description = "Acacia Ladder",
	drawtype = "signlike",
	tiles = {"wood_plus_acacia_ladder.png"},
	inventory_image = "wood_plus_acacia_ladder.png",
	wield_image = "wood_plus_acacia_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("wood_plus:jungle_ladder", {
	description = "Jungle Ladder",
	drawtype = "signlike",
	tiles = {"wood_plus_jungle_ladder.png"},
	inventory_image = "wood_plus_jungle_ladder.png",
	wield_image = "wood_plus_jungle_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})
