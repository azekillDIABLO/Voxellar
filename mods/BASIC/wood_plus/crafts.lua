-- Extra chests

minetest.register_craft({
	output = "wood_plus:acacia_chest",
	recipe = {
		{"default:acacia_wood", "default:acacia_wood", "default:acacia_wood"},
		{"default:acacia_wood", ""                   , "default:acacia_wood"},
		{"default:acacia_wood", "default:acacia_wood", "default:acacia_wood"}
	}
})

minetest.register_craft({
	output = "wood_plus:aspen_chest",
	recipe = {
		{"default:_aspen_wood", "default:_aspen_wood", "default:_aspen_wood"},
		{"default:_aspen_wood", ""                   , "default:_aspen_wood"},
		{"default:_aspen_wood", "default:_aspen_wood", "default:_aspen_wood"}
	}
})

minetest.register_craft({
	output = "wood_plus:pine_chest",
	recipe = {
		{"default:pine_wood", "default:pine_wood", "default:pine_wood"},
		{"default:pine_wood", ""                 , "default:pine_wood"},
		{"default:pine_wood", "default:pine_wood", "default:pine_wood"}
	}
})

minetest.register_craft({
	output = "wood_plus:jungle_chest",
	recipe = {
		{"default:junglewood", "default:junglewood", "default:junglewood"},
		{"default:junglewood", ""                  , "default:junglewood",},
		{"default:junglewood", "default:junglewood", "default:junglewood"}
	}
})

-- Extra ladders

minetest.register_craft({
	output = "default:ladder_wood",
	recipe = {
		{"default:stick", ""			 , "default:stick"},
		{"default:stick","default:stick",  "default:stick"},
		{"default:stick", ""			 , "default:stick"}
	}
})

minetest.register_craft({
	output = "wood_plus:acacia_ladder",
	recipe = {
		{"wood_plus:acacia_stick","                       ", "wood_plus:acacia_stick"},
		{"wood_plus:acacia_stick", "wood_plus:acacia_stick", "wood_plus:acacia_stick"},
		{"wood_plus:acacia_stick", "                      ", "wood_plus:acacia_stick"}
	}
})

minetest.register_craft({
	output = "wood_plus:aspen_ladder",
	recipe = {
		{"wood_plus:aspen_stick", "                     ", "wood_plus:aspen_stick"},
		{"wood_plus:aspen_stick", "wood_plus:aspen_stick", "wood_plus:aspen_stick"},
		{"wood_plus:aspen_stick", "                     ", "wood_plus:aspen_stick"}
	}
})

minetest.register_craft({
	output = "wood_plus:pine_ladder",
	recipe = {
		{"wood_plus:pine_stick", "                    ", "wood_plus:pine_stick"},
		{"wood_plus:pine_stick", "wood_plus:pine_stick", "wood_plus:pine_stick"},
		{"wood_plus:pine_stick", "                    ", "wood_plus:pine_stick"}
	}
})

minetest.register_craft({
	output = "wood_plus:jungle_ladder",
	recipe = {
		{"wood_plus:jungle_stick", "                      ", "wood_plus:jungle_stick"},
		{"wood_plus:jungle_stick", "wood_plus:jungle_stick", "wood_plus:jungle_stick"},
		{"wood_plus:jungle_stick", "                      ", "wood_plus:jungle_stick"}
	}
})

