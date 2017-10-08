--[[
Add natural slopes to Minetest Game
--]]

-- Dirt slopes

natural_slopes.register_slope("default:dirt", {
	groups = {crumbly = 3},
	tiles = {"default_dirt.png"},
	description = "Dirt slope",
	sounds = default.node_sound_dirt_defaults({
		footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},
	})},
	10
)
natural_slopes.register_slope("default:dirt_with_grass", {
	description = "Dirt with Grass slope",
	groups = {crumbly = 3, soil = 1},
	tiles = {top = "default_grass.png",
		bottom = "default_dirt.png",
		front = "default_grass.png",
		side = {name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
	drop = "default:dirt",
	},
	25
)
natural_slopes.register_slope("default:dirt_with_dry_grass", {
	description = "Dirt with Dry Grass slope",
	tiles = {top = "default_dry_grass.png",
		bottom = "default_dirt.png",
		front = "default_dry_grass.png",
		side = {name = "default_dirt.png^default_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
	drop = "default:dirt",
	},
	20
)
natural_slopes.register_slope("default:dirt_with_snow", {
	description = "Dirt with Snow slope",
	tiles = {top = "default_snow.png",
		bottom = "default_dirt.png",
		front = "default_snow.png",
		side = {name = "default_dirt.png^default_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, snowy = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
	}),
	drop = "default:dirt",
	},
	25
)
natural_slopes.register_slope("default:dirt_with_rainforest_litter", {
	description = "Dirt with Rainforest Litter slope",
	tiles = {top = "default_rainforest_litter.png",
		bottom = "default_dirt.png",
		front = "default_rainforest_litter.png",
		side = {name = "default_dirt.png^default_rainforest_litter_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
	drop = "default:dirt",
	},
	15
)

-- Sand slopes

natural_slopes.register_slope("default:sand", {
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	tiles = {"default_sand.png"},
	description = "Sand slope",
	sounds = default.node_sound_sand_defaults()},
	5
)
natural_slopes.register_slope("default:desert_sand", {
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	tiles = {"default_desert_sand.png"},
	description = "Desert sand slope",
	sounds = default.node_sound_sand_defaults()},
	5
)
natural_slopes.register_slope("default:silver_sand", {
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	tiles = {"default_silver_sand.png"},
	description = "Silver sand slope",
	sounds = default.node_sound_sand_defaults()},
	5
)
natural_slopes.register_slope("default:gravel", {
	groups = {crumbly = 2, falling_node = 1},
	tiles = {"default_gravel.png"},
	description = "Gravel slope",
	sounds = default.node_sound_sand_defaults()},
	7
)

natural_slopes.register_slope("default:clay", {
	description = "Clay slope",
	tiles = {"default_clay.png"},
	groups = {crumbly = 3},
	drop = 'default:clay_lump 4',
	sounds = default.node_sound_dirt_defaults()},
	8
)

natural_slopes.register_slope("default:snowblock", {
	description = "Snow Block slope",
	tiles = {"default_snow.png"},
	groups = {crumbly = 3, puts_out_fire = 1, cools_lava = 1, snowy = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "default:dirt_with_grass" then
			minetest.set_node(pos, {name = "default:dirt_with_snow"})
		end
	end,
	},
	20
)

