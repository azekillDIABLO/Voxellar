-- Boilerplate to support localized strings if intllib mod is installed.
local S
if minetest.get_modpath("intllib") then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
else
	S = function(s) return s end
end

mtg_plus = {}

-- New nodes and crafts
minetest.register_node("mtg_plus:dirty_glass", {
	description = S("Dirty Glass"),
	drawtype = "glasslike_framed_optional",
	tiles = {"mtg_plus_dirty_glass.png", "mtg_plus_dirty_glass_detail.png"},
	paramtype = "light",
	sunlight_propagates = false,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:dirty_glass 3",
	recipe = { { "", "default:dirt", "" },
		{"default:glass", "default:glass", "default:glass"},
	}
})

minetest.register_node("mtg_plus:goldglass", {
	description = S("Goldglass"),
	drawtype = "glasslike_framed_optional",
	tiles = {"mtg_plus_goldglass.png", "mtg_plus_goldglass_detail.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = { cracky = 3, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:goldglass 1",
	recipe = { { "default:gold_ingot", },
		{ "default:glass",},
		{ "default:gold_ingot", },
	}
})

minetest.register_node("mtg_plus:dirtbrick", {
	description = S("Soft Dirt Brick"),
	tiles = {"mtg_plus_dirt_brick.png"},
	is_ground_content = false,
	groups = { crumbly = 2, soil = 1 },
	sounds = default.node_sound_dirt_defaults(),
	drop = "default:dirt 4",
})

minetest.register_craft({
	output = "mtg_plus:dirtbrick 4",
	recipe = { { "default:dirt", "default:dirt", },
	{ "default:dirt", "default:dirt", }, },
})

minetest.register_node("mtg_plus:harddirtbrick", {
	description = S("Hardened Dirt Brick"),
	tiles = {"mtg_plus_dirt_brick_hard.png"},
	is_ground_content = false,
	groups = { crumbly = 1, level = 1, soil = 1 },
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_craft({
	type = "cooking",
	output = "mtg_plus:harddirtbrick",
	recipe = "mtg_plus:dirtbrick",
	cooktime = 5,
})

minetest.register_node("mtg_plus:graveldirt", {
	description = S("Gravel Dirt"),
	tiles = {"mtg_plus_graveldirt.png"},
	is_ground_content = false,
	groups = { crumbly = 2, level = 1, soil = 1, },
	sounds = default.node_sound_dirt_defaults(),
	drop = {
		items = {
			{ items = { "default:gravel" } },
			{ items = { "default:dirt" } },
		}
	},
})

minetest.register_craft({
	output = "mtg_plus:graveldirt",
	recipe = { { "default:gravel" },
		{ "default:dirt" } },
})

minetest.register_node("mtg_plus:gravel_cobble", {
	description = S("Gravel Cobblestone"),
	tiles = {"mtg_plus_gravel_cobble.png"},
	is_ground_content = false,
	groups = { cracky = 3, stone = 1 },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:gravel_cobble 2",
	recipe = { { "default:gravel", "default:gravel" },
		{ "default:gravel", "default:gravel" } },
})

minetest.register_craft({
	type = "cooking",
	output = "default:gravel",
	recipe = "mtg_plus:gravel_cobble",
})

minetest.register_node("mtg_plus:goldbrick", {
	description = S("Gold Brick"),
	tiles = {"mtg_plus_gold_brick.png"},
	is_ground_content = false,
	groups = { cracky = 1, },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:goldbrick 4",
	recipe = { { "default:goldblock", "default:goldblock", },
	{ "default:goldblock", "default:goldblock", }, },
})

minetest.register_node("mtg_plus:bronzebrick", {
	description = S("Bronze Brick"),
	tiles = {"mtg_plus_bronze_brick.png"},
	is_ground_content = false,
	groups = { cracky = 1, level = 2 },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:bronzebrick 4",
	recipe = { { "default:bronzeblock", "default:bronzeblock", },
	{ "default:bronzeblock", "default:bronzeblock", }, },
})

minetest.register_node("mtg_plus:copperbrick", {
	description = S("Copper Brick"),
	tiles = {"mtg_plus_copper_brick.png"},
	is_ground_content = false,
	groups = { cracky = 1, level = 2 },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:copperbrick 4",
	recipe = { { "default:copperblock", "default:copperblock", },
	{ "default:copperblock", "default:copperblock", }, },
})

minetest.register_node("mtg_plus:steelbrick", {
	description = S("Steel Brick"),
	tiles = {"mtg_plus_steel_brick.png"},
	is_ground_content = false,
	groups = { cracky = 1, level = 2 },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:steelbrick 4",
	recipe = { { "default:steelblock", "default:steelblock", },
	{ "default:steelblock", "default:steelblock", }, },
})

minetest.register_node("mtg_plus:stonebrick_gold", {
	description = S("Stone Brick with Golden Edges"),
	tiles = {"mtg_plus_stone_brick_gold.png"},
	is_ground_content = false,
	groups = { cracky = 2, stone = 1 },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:stonebrick_gold 4",
	recipe = { {  "", "default:stonebrick", "", },
	{ "default:stonebrick", "default:gold_ingot", "default:stonebrick", },
	{ "", "default:stonebrick", "", } }
})

minetest.register_node("mtg_plus:desert_stonebrick_gold", {
	description = S("Desert Stone Brick with Golden Edges"),
	tiles = {"mtg_plus_desert_stone_brick_gold.png"},
	is_ground_content = false,
	groups = { cracky = 2, stone = 1 },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:desert_stonebrick_gold 4",
	recipe = { { "", "default:desert_stonebrick", "" },
	{ "default:desert_stonebrick", "default:gold_ingot", "default:desert_stonebrick", },
	{ "", "default:desert_stonebrick", "", } }
})

minetest.register_node("mtg_plus:sandstonebrick_gold", {
	description = S("Sandstone Brick with Golden Edges"),
	tiles = {"mtg_plus_sandstone_brick_gold.png"},
	is_ground_content = false,
	groups = { cracky = 2, },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:sandstonebrick_gold 4",
	recipe = { { "", "default:sandstonebrick", "", },
	{ "default:sandstonebrick", "default:gold_ingot", "default:sandstonebrick", },
	{ "", "default:sandstonebrick", "", } }
})

minetest.register_node("mtg_plus:obsidianbrick_gold", {
	description = S("Obsidian Brick with Golden Edges"),
	tiles = {"mtg_plus_obsidian_brick_gold.png"},
	is_ground_content = false,
	groups = { cracky = 1, level = 2 },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:obsidianbrick_gold 4",
	recipe = { { "", "default:obsidianbrick", "", },
	{ "default:obsidianbrick", "default:gold_ingot", "default:obsidianbrick", },
	{ "", "default:obsidianbrick", "", } }
})

minetest.register_node("mtg_plus:sandstone_cobble", {
	description = S("Sandstone Cobblestone"),
	tiles = {"mtg_plus_sandstone_cobble.png"},
	groups = {cracky = 3, },
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:sandstone_cobble 2",
	recipe = { { "default:sandstone", "default:sandstone" } },
})

minetest.register_craft({
	type = "cooking",
	output = "default:sandstone",
	recipe = "mtg_plus:sandstone_cobble",
})

minetest.register_node("mtg_plus:jungle_cobble", {
	description = S("Jungle Cobblestone"),
	tiles = {"mtg_plus_jungle_cobble.png"},
	groups = {cracky=3, stone=1},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:jungle_cobble",
	type = "shapeless",
	recipe = { "default:jungleleaves", "default:jungleleaves", "default:cobble" },
})

minetest.register_craft({
	output = "mtg_plus:jungle_cobble",
	type = "shapeless",
	recipe = { "default:jungleleaves", "default:mossycobble" },
})

minetest.register_node("mtg_plus:harddiamondblock",{
	description = S("Aggregated Diamond Block"),
	tiles = { "mtg_plus_hard_diamond_block.png" },
	is_ground_content = true,
	groups = { cracky = 1, level = 4 },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:harddiamondblock 1",
	type = "shapeless",
	recipe = { "default:diamondblock", "default:diamondblock" }
})

minetest.register_node("mtg_plus:ice_block", {
	description = S("Ice Block"),
	tiles = {"mtg_plus_ice_block.png"},
	groups = {cracky = 3, puts_out_fire = 1},
	is_ground_content = false,
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:ice_block 9",
	recipe = { { "default:ice", "default:ice", "default:ice" },
	{ "default:ice", "default:ice", "default:ice" },
	{ "default:ice", "default:ice", "default:ice" } }
})

if minetest.get_modpath("xdecor") then
	-- xdecor compability
	minetest.register_craft({
		output = "xdecor:packed_ice 2",
		recipe = { { "mtg_plus:ice_block", "mtg_plus:ice_block", "mtg_plus:ice_block" },
		{ "mtg_plus:ice_block", "", "mtg_plus:ice_block" },
		{ "mtg_plus:ice_block", "mtg_plus:ice_block", "mtg_plus:ice_block" }, },
	})

	minetest.register_craft({
		output = "mtg_plus:ice_tile16",
		recipe = { { "xdecor:packed_ice", "xdecor:packed_ice" },
		{ "xdecor:packed_ice", "xdecor:packed_ice" }, },
	})
end

minetest.register_node("mtg_plus:ice_tile4", {
	description = S("Ice Tile"),
	tiles = {"mtg_plus_ice_tile4.png"},
	groups = {cracky = 3, level = 1, puts_out_fire = 1},
	is_ground_content = false,
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:ice_tile4",
	recipe = { { "mtg_plus:ice_block", "mtg_plus:ice_block" },
	{ "mtg_plus:ice_block", "mtg_plus:ice_block" },}
})

minetest.register_node("mtg_plus:ice_tile16", {
	description = S("Dense Ice Tile"),
	tiles = {"mtg_plus_ice_tile16.png"},
	groups = {cracky = 3, level = 2, puts_out_fire = 1},
	is_ground_content = false,
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:ice_tile16",
	recipe = { { "mtg_plus:ice_tile4", "mtg_plus:ice_tile4" },
	{ "mtg_plus:ice_tile4", "mtg_plus:ice_tile4" } }
})

minetest.register_node("mtg_plus:ice_window", {
	description = S("Ice Window"),
	drawtype = "glasslike",
	tiles = {"mtg_plus_ice_window.png"},
	sunlight_propagates = true,
	groups = {cracky = 3, puts_out_fire = 1},
	is_ground_content = false,
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:ice_window",
	type = "cooking",
	recipe = "mtg_plus:ice_tile4",
	cooktime = 1,
})


minetest.register_node("mtg_plus:papyrus_block", {
	description = S("Papyrus Block"),
	tiles = {"mtg_plus_papyrus_block_y.png","mtg_plus_papyrus_block_y.png","mtg_plus_papyrus_block_side2.png","mtg_plus_papyrus_block_side2.png","mtg_plus_papyrus_block_side.png","mtg_plus_papyrus_block_side.png"},
	groups = {snappy = 2, choppy = 2, flammable = 3},
	is_ground_content = false,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:papyrus_block",
	recipe = { { "default:papyrus", "default:papyrus", "default:papyrus", },
	{ "default:papyrus", "default:papyrus", "default:papyrus", },
	{ "default:papyrus", "default:papyrus", "default:papyrus", } }
})

minetest.register_craft({
	output = "default:papyrus 9",
	recipe = { { "mtg_plus:papyrus_block" } }
})

minetest.register_node("mtg_plus:snow_brick", {
	description = S("Soft Snow Brick"),
	tiles = {"mtg_plus_snow_brick.png"},
	groups = {crumbly = 2, puts_out_fire = 1},
	is_ground_content = false,
	sounds = default.node_sound_dirt_defaults({
		footstep={name="default_snow_footstep", gain = 0.15},
		dig={name="default_snow_footstep", gain = 0.2},
		dug={name="default_snow_footstep", gain = 0.2}
	}),
})

minetest.register_craft({
	output = "mtg_plus:snow_brick 4",
	recipe = { { "default:snowblock", "default:snowblock" },
	{ "default:snowblock", "default:snowblock", } },
})

minetest.register_craft({
	output = "default:snowblock 4",
	recipe = { { "mtg_plus:snow_brick" } },
})

minetest.register_node("mtg_plus:hard_snow_brick", {
	description = S("Hard Snow Brick"),
	tiles = {"mtg_plus_hard_snow_brick.png"},
	groups = {crumbly = 1, cracky = 2, puts_out_fire = 1},
	is_ground_content = false,
	sounds = default.node_sound_dirt_defaults({
		dig={name="default_snow_footstep", gain = 0.2},
		dug={name="default_snow_footstep", gain = 0.2}
	}),
})

minetest.register_craft({
	output = "mtg_plus:hard_snow_brick",
	recipe = { { "mtg_plus:snow_brick", "mtg_plus:snow_brick" },
		{  "mtg_plus:snow_brick", "mtg_plus:snow_brick" } },
})

minetest.register_node("mtg_plus:ice_snow_brick", {
	description = S("Icy Snow Brick"),
	tiles = {"mtg_plus_ice_snow_brick.png"},
	groups = {cracky = 2, puts_out_fire = 1},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:ice_snow_brick 2",
	type = "shapeless",
	recipe = { "mtg_plus:hard_snow_brick", "mtg_plus:ice_brick" },
})

minetest.register_node("mtg_plus:ice_brick", {
	description = S("Ice Brick"),
	tiles = {"mtg_plus_ice_brick.png"},
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1},
	is_ground_content = false,
	sounds = default.node_sound_glass_defaults(),
})

if minetest.get_modpath("xdecor") then
	-- Alternate crafting recipe for xdecor compability
	minetest.register_craft({
		output = "mtg_plus:ice_brick 4",
		recipe = { { "", "default:ice", "default:ice" },
		{ "default:ice", "default:ice", "" } },
	})
	minetest.register_craft({
		output = "mtg_plus:ice_brick 4",
		recipe = { { "default:ice", "default:ice", "" },
		{ "", "default:ice", "default:ice" } },
	})
else
	-- Normal crafting recipe
	minetest.register_craft({
		output = "mtg_plus:ice_brick 4",
		recipe = { { "default:ice", "default:ice" },
		{ "default:ice", "default:ice" } },
	})
end

minetest.register_node("mtg_plus:goldwood", {
	description = S("Goldwood"),
	tiles = {"mtg_plus_goldwood.png"},
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:goldwood",
	type = "shapeless",
	recipe = { "group:wood", "default:gold_ingot" },
})

minetest.register_node("mtg_plus:gold_diamond_block", {
	description = S("Diamond Block with Golden Frame"),
	tiles = {"mtg_plus_gold_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:gold_diamond_block",
	recipe = { { "", "default:gold_ingot", "", },
	{ "default:gold_ingot", "default:diamondblock", "default:gold_ingot", },
	{ "", "default:gold_ingot", "", } },
})


minetest.register_node("mtg_plus:goldapple", {
	description = S("Golden Decor Apple"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"mtg_plus_goldapple.png"},
	inventory_image = "mtg_plus_goldapple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = { dig_immediate = 3, attached_node = 1 },
	sounds = default.node_sound_defaults(),
})


minetest.register_craft({
	output = "mtg_plus:goldapple",
	type = "shapeless",
	recipe = { "default:apple", "default:gold_ingot" },
})

-- Cups
local cupnodebox = {
	type = "fixed",
	fixed = {
	{-0.3,-0.5,-0.3,0.3,-0.4,0.3}, -- stand
	{-0.1,-0.4,-0.1,0.1,0,0.1}, -- handle
	{-0.3,0,-0.3,0.3,0.1,0.3}, -- cup (lower part)
	-- the 4 sides of the upper part
	{-0.2,0.1,-0.3,0.2,0.5,-0.2},
	{-0.2,0.1,0.2,0.2,0.5,0.3},
	{-0.3,0.1,-0.3,-0.2,0.5,0.3},
	{0.2,0.1,-0.3,0.3,0.5,0.3},
	}
}

local cupselbox = {
	type = "fixed",
	fixed = {
	{-0.3,-0.5,-0.3,0.3,-0.4,0.3}, -- stand
	{-0.1,-0.4,-0.1,0.1,0,0.1}, -- handle
	{-0.3,0,-0.3,0.3,0.5,0.3}, -- upper part
	}
}

mtg_plus.register_cup = function(subname, description, tiles, craftitem, craft_count, extra_groups, extra_sounds)
	local groups = { dig_immediate=3, falling_node=1, }
	if extra_groups then
		for k,v in pairs(extra_groups) do
			groups[k] = v
		end
	end
	local sounds = default.node_sound_defaults({
		footstep = { name = "default_hard_footstep", gain = 0.3 },
	})
	if extra_sounds then
		for k,v in pairs(extra_sounds) do
			sounds[k] = v
		end
	end
	minetest.register_node("mtg_plus:cup_"..subname, {
		description = description,
		tiles = tiles,
		paramtype = "light",
		drawtype = "nodebox",
		node_box = cupnodebox,
		selection_box = cupselbox,
		groups = groups,
		sounds = sounds,
	})

	if craftitem ~= nil then
		if craft_count == nil then craft_count = 1 end

		minetest.register_craft({
			output = "mtg_plus:cup_"..subname.." "..craft_count,
			recipe = {
				{craftitem, "", craftitem},
				{"", craftitem, ""},
				{"", craftitem, ""},
			}
		})
	end

end

mtg_plus.register_cup("bronze", S("Bronze Cup"), { "mtg_plus_cup_bronze.png" }, "default:bronze_ingot", 2)
mtg_plus.register_cup("gold", S("Golden Cup"), { "mtg_plus_cup_gold.png" }, "default:gold_ingot", 2)
mtg_plus.register_cup("diamond", S("Diamond Cup"), { "mtg_plus_cup_diamond.png" }, "default:diamond", 1)

-- Ladders
minetest.register_node("mtg_plus:ladder_papyrus", {
	description = S("Papyrus Ladder"),
	drawtype = "signlike",
	tiles = {"mtg_plus_ladder_papyrus.png"},
	inventory_image = "mtg_plus_ladder_papyrus.png",
	wield_image = "mtg_plus_ladder_papyrus.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = { type = "wallmounted", },
	groups = { snappy = 2, choppy = 1, flammable = 2 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:ladder_papyrus 2",
	recipe = { {"default:papyrus", "", "default:papyrus"},
	{"farming:string", "default:papyrus", "farming:string"},
	{"default:papyrus", "", "default:papyrus"}},
})

minetest.register_node("mtg_plus:ladder_gold", {
	description = S("Golden Ladder"),
	drawtype = "signlike",
	tiles = {"mtg_plus_ladder_gold.png"},
	inventory_image = "mtg_plus_ladder_gold.png",
	wield_image = "mtg_plus_ladder_gold.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = { type = "wallmounted", },
	groups = { cracky = 3, },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mtg_plus:ladder_gold 15",
	recipe = { {"default:gold_ingot", "", "default:gold_ingot"},
	{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
	{"default:gold_ingot", "", "default:gold_ingot"}},
})

-- Stairs/slabs
local stairslab_ignore_groups = { "wood", "stone", "soil" }

local function simple_stair_slab(subname, desc_stair, desc_slab)
	local itemstring = "mtg_plus:"..subname
	local groups = table.copy(minetest.registered_nodes[itemstring].groups)
	for i=1,#stairslab_ignore_groups do
		groups[stairslab_ignore_groups[i]] = nil
	end
	stairs.register_stair_and_slab(subname, itemstring, groups, minetest.registered_nodes[itemstring].tiles, desc_stair, desc_slab, minetest.registered_nodes[itemstring].sounds)
end

simple_stair_slab("sandstone_cobble", S("Sandstone Cobblestone Stair"), S("Sandstone Cobblestone Slab"))
simple_stair_slab("jungle_cobble", S("Jungle Cobblestone Stair"), S("Jungle Cobblestone Slab"))
simple_stair_slab("hard_snow_brick", S("Hard Snow Brick Stair"), S("Hard Snow Brick Slab"))
simple_stair_slab("ice_snow_brick", S("Icy Snow Brick Stair"), S("Icy Snow Brick Slab"))
simple_stair_slab("ice_brick", S("Ice Brick Stair"), S("Ice Brick Slab"))
simple_stair_slab("ice_tile4", S("Ice Tile Stair"), S("Ice Tile Slab"))
simple_stair_slab("goldwood", S("Goldwood Stair"), S("Goldwood Slab"))
simple_stair_slab("goldbrick", S("Gold Brick Stair"), S("Gold Brick Slab"))
simple_stair_slab("bronzebrick", S("Bronze Brick Stair"), S("Bronze Brick Slab"))
simple_stair_slab("copperbrick", S("Copper Brick Stair"), S("Copper Brick Slab"))
simple_stair_slab("steelbrick", S("Steel Brick Stair"), S("Steel Brick Slab"))
simple_stair_slab("harddirtbrick", S("Hardened Dirt Brick Stair"), S("Hardened Dirt Brick Slab"))
simple_stair_slab("gravel_cobble", S("Gravel Cobblestone Stair"), S("Gravel Cobblestone Slab"))

stairs.register_slab("ice_block", "mtg_plus:ice_block", {cracky=3}, {"mtg_plus_ice_block.png", "mtg_plus_ice_block.png", "mtg_plus_ice_block_slab.png", "mtg_plus_ice_block_slab.png", "mtg_plus_ice_block_slab.png", "mtg_plus_ice_block_slab.png"}, S("Ice Block Slab"), minetest.registered_items["mtg_plus:ice_block"].sounds)
stairs.register_stair("ice_block", "mtg_plus:ice_block", {cracky=3}, {"mtg_plus_ice_block_slab.png", "mtg_plus_ice_block.png", "mtg_plus_ice_block_stair1.png", "mtg_plus_ice_block_stair2.png", "mtg_plus_ice_block.png", "mtg_plus_ice_block_slab.png"}, S("Ice Block Stair"), minetest.registered_items["mtg_plus:ice_block"].sounds)

-- Beds

beds.register_bed("mtg_plus:bed_simple_white", {
	description = S("White Simple Bed"),
	inventory_image = "mtg_plus_bed_simple_white.png",
	wield_image = "mtg_plus_bed_simple_white.png",
	tiles = {
		bottom = {
			"mtg_plus_bed_simple_white_top_bottom.png^[transformR90",
			"default_wood.png",
			"mtg_plus_bed_simple_white_side_bottom_r.png",
			"mtg_plus_bed_simple_white_side_bottom_r.png^[transformfx",
			"beds_transparent.png",
			"mtg_plus_bed_simple_white_side_bottom.png"
		},
		top = {
			"mtg_plus_bed_simple_white_top_top.png^[transformR90",
			"default_wood.png",
			"mtg_plus_bed_simple_white_side_top_r.png",
			"mtg_plus_bed_simple_white_side_top_r.png^[transformfx",
			"mtg_plus_bed_simple_white_side_top.png",
			"beds_transparent.png",
		}
	},
	nodebox = {
		bottom = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
		top = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"wool:white", "wool:white", "wool:white"},
		{"group:wood", "group:wood", "group:wood"}
	},
})

-- TODO: Make golden bed non-flammable
beds.register_bed("mtg_plus:gold_bed", {
	description = S("Golden Bed"),
	inventory_image = "mtg_plus_gold_bed.png",
	wield_image = "mtg_plus_gold_bed.png",
	tiles = {
		bottom = {
			"mtg_plus_gold_bed_top1.png",
			"default_gold_block.png",
			"mtg_plus_gold_bed_side1.png",
			"mtg_plus_gold_bed_side1.png^[transformFX",
			"default_gold_block.png",
			"mtg_plus_gold_bed_foot.png",
		},
		top = {
			"mtg_plus_gold_bed_top2.png",
			"default_gold_block.png",
			"mtg_plus_gold_bed_side2.png",
			"mtg_plus_gold_bed_side2.png^[transformFX",
			"mtg_plus_gold_bed_head.png",
			"default_gold_block.png",
		}
	},
	nodebox = {
		bottom = {
			{-0.5, -0.5, -0.5, -0.375, -0.065, -0.4375},
			{0.375, -0.5, -0.5, 0.5, -0.065, -0.4375},
			{-0.5, -0.375, -0.5, 0.5, -0.125, -0.4375},
			{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
			{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
			{-0.4375, -0.3125, -0.4375, 0.4375, -0.0625, 0.5},
		},
		top = {
			{-0.5, -0.5, 0.4375, -0.375, 0.1875, 0.5},
			{0.375, -0.5, 0.4375, 0.5, 0.1875, 0.5},
			{-0.5, 0, 0.4375, 0.5, 0.125, 0.5},
			{-0.5, -0.375, 0.4375, 0.5, -0.125, 0.5},
			{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
			{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
			{-0.4375, -0.3125, -0.5, 0.4375, -0.0625, 0.4375},
		}
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"", "", "group:stick"},
		{"wool:yellow", "wool:yellow", "wool:yellow"},
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
	},
})

-- Doors
doors.register("door_wood_bar", {
	tiles = {{ name = "mtg_plus_door_wood_bar.png", backface_culling = true }},
	description = S("Wooden Bar Door"),
	inventory_image = "mtg_plus_door_wood_bar_item.png",
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_fencegate_open",
	sound_close = "doors_fencegate_close",
	groups = { snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{"xpanes:wood",},
		{"xpanes:wood",},
	}
})

doors.register("door_papyrus", {
	tiles = {{ name = "mtg_plus_door_papyrus.png", backface_culling = true }},
	description = S("Papyrus Door"),
	inventory_image = "mtg_plus_door_papyrus_item.png",
	sounds = default.node_sound_leaves_defaults(),
	sound_open = "doors_fencegate_open",
	sound_close = "doors_fencegate_close",
	groups = { snappy = 2, choppy = 1, flammable = 2 },
	recipe = {
		{"default:papyrus", "default:papyrus"},
		{"farming:string", "farming:string"},
		{"default:papyrus", "default:papyrus"},
	}
})



doors.register("door_iron_bar", {
	tiles = {{ name = "mtg_plus_door_iron_bar.png", backface_culling = true }},
	description = S("Iron Bar Door"),
	inventory_image = "mtg_plus_door_iron_bar_item.png",
	sound_open = "mtg_plus_door_iron_bar_open",
	sound_close = "mtg_plus_door_iron_bar_close",
	sounds = default.node_sound_stone_defaults(),
	groups = { snappy = 2, bendy = 1, cracky = 1, melty = 2, },
	recipe = {
		{"xpanes:bar",},
		{"xpanes:bar",},
	}
})

if minetest.get_modpath("xdecor") then
	-- xdecor compability
	minetest.register_craft({
		output = "doors:prison_door",
		recipe = {
			{ "doors:door_iron_bar" },
			{ "doors:door_iron_bar" },
			{ "doors:door_iron_bar" },
		}
	})

	minetest.register_craft({
		output = "doors:door_iron_bar 3",
		recipe = {
			{ "doors:prison_door" },
		}
	})
end

doors.register("door_ice", {
	tiles = {{ name = "mtg_plus_door_ice.png", backface_culling = true }},
	description = S("Ice Door"),
	inventory_image = "mtg_plus_door_ice_item.png",
	groups = { cracky = 3, puts_out_fire = 1 },
	sounds = default.node_sound_glass_defaults(),
	sound_open = "mtg_plus_door_ice_open",
	sound_close = "mtg_plus_door_ice_close",
	recipe = {
		{"default:ice", "default:ice"},
		{"default:ice", "default:ice"},
		{"default:ice", "default:ice"},
	}
})

doors.register("door_icesteel", {
	tiles = {{ name = "mtg_plus_door_icesteel.png", backface_culling = true }},
	description = S("Icy Steel Door"),
	protected = true,
	sound_open = "mtg_plus_door_icesteel_open",
	sound_close = "mtg_plus_door_icesteel_close",
	inventory_image = "mtg_plus_door_icesteel_item.png",
	sounds = default.node_sound_stone_defaults(),
	groups = { snappy = 1, bendy = 2, cracky = 3, melty = 3, level = 2, puts_out_fire = 1 },
})

minetest.register_craft({
	output = "doors:door_icesteel 2",
	type = "shapeless",
	recipe = {"doors:door_ice", "doors:door_steel"},
})

doors.register_fencegate("mtg_plus:gate_goldwood", {
	description = S("Goldwood Fence Gate"),
	material = "mtg_plus:goldwood",
	texture = "mtg_plus_goldwood.png",
	groups = {choppy=2, flammable=2},
})

-- Walls
walls.register("mtg_plus:wall_sandstone_cobble", S("Sandstone Cobblestone Wall"), "mtg_plus_sandstone_cobble.png", "mtg_plus:sandstone_cobble", default.node_sound_stone_defaults())
walls.register("mtg_plus:wall_jungle_cobble", S("Jungle Cobblestone Wall"), "mtg_plus_jungle_cobble.png", "mtg_plus:jungle_cobble", default.node_sound_stone_defaults())
walls.register("mtg_plus:wall_ice_tile16", S("Dense Ice Tile Wall"), "mtg_plus_ice_tile16.png", "mtg_plus:ice_tile16", default.node_sound_glass_defaults())
walls.register("mtg_plus:wall_gravel_cobble", S("Gravel Cobblestone Wall"), "mtg_plus_gravel_cobble.png", "mtg_plus:gravel_cobble", default.node_sound_stone_defaults())

do
	local groups = minetest.registered_items["mtg_plus:wall_ice_tile16"].groups
	groups.stone = nil
	minetest.override_item("mtg_plus:wall_ice_tile16", { groups = groups })

	groups = minetest.registered_items["mtg_plus:wall_sandstone_cobble"].groups
	groups.stone = nil
	minetest.override_item("mtg_plus:wall_sandstone_cobble", { groups = groups })
end

-- xpanes
xpanes.register_pane("paper", {
	description = S("Paper Barrier"),
	inventory_image = "mtg_plus_paperwall.png",
	wield_image = "mtg_plus_paperwall.png",
	textures = {"mtg_plus_paperwall.png", "mtg_plus_paperwall.png", "mtg_plus_paperwall.png"},
	groups = {snappy=3, flammable=4, pane=1},
	sounds = {
		footstep = {name="mtg_plus_paper_step", gain=0.1, max_hear_distance=7},
		place = {name="mtg_plus_paper_step", gain=0.3, max_hear_distance=13},
		dig = {name="mtg_plus_paper_dig", gain=0.1, max_hear_distance=11},
		dug = {name="mtg_plus_paper_dug", gain=0.2, max_hear_distance=13},
	},
	recipe = {
		{ "default:paper", "default:paper", "default:paper" },
		{ "default:paper", "default:paper", "default:paper" },
	}
})

xpanes.register_pane("wood", {
	description = S("Wooden Bars"),
	inventory_image = "mtg_plus_wooden_bar.png",
	wield_image = "mtg_plus_wooden_bar.png",
	textures = {"mtg_plus_wooden_bar.png", "mtg_plus_wooden_bar_side.png", "mtg_plus_wooden_bar_y.png"},
	groups = {choppy=3, oddly_breakable_by_hand=2, flammable=2, pane=1},
	sounds = default.node_sound_wood_defaults(),
	recipe = {
		{ "group:wood", "", "group:wood" },
		{ "group:wood", "", "group:wood" },
		{ "group:wood", "", "group:wood" },
	}
})

xpanes.register_pane("obsidian_glass", {
	description = S("Obsidian Glass Pane"),
	inventory_image = "default_obsidian_glass.png",
	wield_image = "default_obsidian_glass.png",
	textures = {"default_obsidian_glass.png", "mtg_plus_obsidian_glass_pane_half.png", "default_obsidian.png"},
	groups = {cracky=3, pane=1},
	sounds = default.node_sound_glass_defaults(),
	recipe = {
		{ "default:obsidian_glass", "default:obsidian_glass", "default:obsidian_glass" },
		{ "default:obsidian_glass", "default:obsidian_glass", "default:obsidian_glass" },
	}
})

xpanes.register_pane("goldglass", {
	description = S("Goldglass Pane"),
	inventory_image = "mtg_plus_goldglass.png",
	wield_image = "mtg_plus_goldglass.png",
	textures = {"mtg_plus_goldglass.png","mtg_plus_goldglass.png","mtg_plus_goldglass.png",},
	groups = {cracky=3,oddly_breakable_by_hand=2,pane=1},
	sounds = default.node_sound_glass_defaults(),
	recipe = {
		{ "mtg_plus:goldglass","mtg_plus:goldglass","mtg_plus:goldglass", },
		{ "mtg_plus:goldglass","mtg_plus:goldglass","mtg_plus:goldglass", },
	}
})

xpanes.register_pane("goldglass2", {
	description = S("Golden Window"),
	inventory_image = "mtg_plus_goldglass2.png",
	wield_image = "mtg_plus_goldglass2.png",
	textures = {"mtg_plus_goldglass2.png","mtg_plus_goldglass2.png","mtg_plus_goldglass2.png",},
	groups = {cracky=3,oddly_breakable_by_hand=3,pane=1},
	sounds = default.node_sound_glass_defaults(),
	recipe = {
		{ "default:gold_ingot","default:gold_ingot","default:gold_ingot", },
		{ "default:gold_ingot","default:glass","default:gold_ingot", },
		{ "default:gold_ingot","default:gold_ingot","default:gold_ingot", },
	}
})

xpanes.register_pane("papyrus", {
	description = S("Papyrus Lattice"),
	inventory_image = "mtg_plus_papyrus_lattice.png",
	wield_image = "mtg_plus_papyrus_lattice.png",
	textures = {"mtg_plus_papyrus_lattice.png","mtg_plus_papyrus_lattice.png","mtg_plus_papyrus_lattice.png"},
	groups = {snappy=2, choppy=1, flammable=2,pane=1},
	sounds = default.node_sound_leaves_defaults(),
	recipe = {
		{ "default:papyrus", "farming:string", "default:papyrus" },
		{ "default:papyrus", "farming:string", "default:papyrus" },
	}
})

if minetest.get_modpath("xdecor") then
	-- xdecor compability
	minetest.register_craft({
		output = "xpanes:papyrus 2",
		recipe = {
			{ "", "farming:string", "" },
			{ "farming:string", "xpanes:bamboo_frame", "farming:string" },
		}
	})

	minetest.register_craft({
		output = "xpanes:bamboo_frame",
		recipe = { { "xpanes:papyrus", "xpanes:papyrus", }, }
	})
end

xpanes.register_pane("ice", {
	description = S("Ice Window Pane"),
	inventory_image = "mtg_plus_ice_window.png",
	wield_image = "mtg_plus_ice_window.png",
	textures = {"mtg_plus_ice_window.png", "mtg_plus_ice_window.png", "mtg_plus_ice_window.png"},
	groups = {cracky=3, pane=1},
	sounds = default.node_sound_glass_defaults(),
	recipe = {
		{ "mtg_plus:ice_window", "mtg_plus:ice_window", "mtg_plus:ice_window", },
		{ "mtg_plus:ice_window", "mtg_plus:ice_window", "mtg_plus:ice_window", }
	}
})

-- moreblocks extras
if minetest.get_modpath("moreblocks") then
	minetest.register_craft({
		type = "shapeless",
		output = "default:glass",
		recipe = {"mtg_plus:dirty_glass", "moreblocks:sweeper"}
	})
	minetest.register_craft({
		type = "shapeless",
		output = "moreblocks:clean_glass",
		recipe = {"mtg_plus:dirty_glass", "moreblocks:sweeper", "moreblocks:sweeper"}
	})
	minetest.register_craft({
		output = "mtg_plus:dirty_glass",
		recipe = {
			{"default:dirt"},
			{"moreblocks:clean_glass"}
		}
	})
	minetest.register_craft({
		type = "shapeless",
		output = "mtg_plus:ice_window",
		recipe = { "mtg_plus:ice_tile4", "moreblocks:sweeper" },
	})

end

