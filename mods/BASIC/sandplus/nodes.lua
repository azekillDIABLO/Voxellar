--+--Blocks--+--

minetest.register_node("sandplus:desert_sandstone", {
	description = "Desert Sandstone",
	tiles = {"desert_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("sandplus:desert_sandstonebrick", {
	description = "Desert Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"desert_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("sandplus:desert_sandstone_block", {
	description = "Desert Sandstone Block",
	tiles = {"desert_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("sandplus:silver_sandstone", {
	description = "Silver Sandstone",
	tiles = {"silver_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("sandplus:silver_sandstonebrick", {
	description = "Silver Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"silver_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("sandplus:silver_sandstone_block", {
	description = "Silver Sandstone Block",
	tiles = {"silver_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

--+--Stairs and Slabs--+--

stairs.register_stair_and_slab(
	"desert_sandstone",
	"sandplus:desert_sandstone",
	{crumbly = 1, cracky = 3},
	{"desert_sandstone.png"},
	"Desert Sandstone Stair",
	"Desert Sandstone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_sandstonebrick",
	"sandplus:desert_sandstonebrick",
	{cracky = 2},
	{"desert_sandstone_brick.png"},
	"Desert Sandstone Brick Stair",
	"Desert Sandstone Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_sandstone_block",
	"sandplus:desert_sandstone_block",
	{cracky = 2},
	{"desert_sandstone_block.png"},
	"Desert Sandstone Block Stair",
	"Desert Sandstone Block Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"silver_sandstone",
	"sandplus:silver_sandstone",
	{crumbly = 1, cracky = 3},
	{"silver_sandstone.png"},
	"Silver Sandstone Stair",
	"Silver Sandstone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"silver_sandstonebrick",
	"sandplus:silver_sandstonebrick",
	{cracky = 2},
	{"silver_sandstone_brick.png"},
	"Silver Sandstone Brick Stair",
	"Silver Sandstone Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"silver_sandstone_block",
	"sandplus:silver_sandstone_block",
	{cracky = 2},
	{"silver_sandstone_block.png"},
	"Silver Sandstone Block Stair",
	"Silver Sandstone Block Slab",
	default.node_sound_stone_defaults()
)
