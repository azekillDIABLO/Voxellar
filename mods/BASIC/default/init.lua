-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.

-- The API documentation in here was moved into game_api.txt

-- Definitions made by this mod that other mods can use too
default = {}

default.LIGHT_MAX = 20

-- GUI related stuff
default.gui_bg = "background[5,5;1,1;gui_formbg.png;true]"
default.gui_bg_img = "background[5,5;1,1;gui_formbg.png;true]"
default.gui_slots = "listcolors[#100000;#100000;#100000;#100000;#FFFFFF]"

function default.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

default.gui_survival_form = 
			"size[8,7.5;]"..
			default.gui_bg_img..
			default.gui_slots..
			"image[6,1;1,1;gui_furnace_arrow_on_side.png]"..
			"list[current_player;main;0,3.5;8,4;]"..
			"list[current_player;craft;3,0;3,3;]"..
			"list[current_player;craftpreview;7,1;1,1;]"..
			default.get_hotbar_bg(0,4.25)

-- Load files
dofile(minetest.get_modpath("default").."/functions.lua")
dofile(minetest.get_modpath("default").."/nodes.lua")
dofile(minetest.get_modpath("default").."/furnace.lua")
dofile(minetest.get_modpath("default").."/tools.lua")
dofile(minetest.get_modpath("default").."/craftitems.lua")
dofile(minetest.get_modpath("default").."/crafting.lua")
dofile(minetest.get_modpath("default").."/mapgen.lua")
dofile(minetest.get_modpath("default").."/player.lua")
dofile(minetest.get_modpath("default").."/trees.lua")
dofile(minetest.get_modpath("default").."/aliases.lua")
dofile(minetest.get_modpath("default").."/legacy.lua")

local chest_formspec =
	"size[8,9]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;main;0,0.3;8,4;]"..
	"list[current_player;main;0,4.85;8,1;]"..
	"list[current_player;main;0,6.08;8,3;8]"..
	"listring[current_name;main]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0,4.85)

minetest.register_node("default:chest", {
	description = "Chest",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", chest_formspec)
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})

	minetest.register_craft({
	output = 'default:chest',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', '', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

-- Reduce particles send to client if on Server
local SERVER = minetest.is_singleplayer() or false
SERVER = not SERVER
local dur = 3

local VIEW_DISTANCE = 23 -- from what distance (in nodes) leaves are send to player/client

-- constants
local rotat = {"I", "FX"}
local particle_def = {
    pos = {x = 0, y = 0, z =0},
    velocity = {x = 0, y = 0.3, z = 0},
    acceleration = {x = 0, y = 0, z = 0},
    expirationtime = 36,
    size = 2,
    collisiondetection = true,
    vertical = true,
    texture = "smoke.png",
}

-- leaves falling
local function add_fire(pos, duration, offset)
	if offset then
		pos.x = pos.x + offset.x
		pos.z = pos.z + offset.z
		pos.y = pos.y + offset.y
	end
	pos.y = pos.y + 0.19
	particle_def.pos = pos
	particle_def.expirationtime = duration
	particle_def.texture = "smoke.png"
	minetest.add_particle(particle_def)

	pos.y = pos.y + 0.01
	particle_def.pos = pos
	particle_def.texture = "smoke.png"
	minetest.add_particle(particle_def)
end

-- helper functions
local function player_near(pos)
	for  _,object in ipairs(minetest.get_objects_inside_radius(pos, VIEW_DISTANCE)) do
		if object:is_player() then
			return true
		end
	end

	return false
end

local function get_offset(wdir)
	local z = 0
	local x = 0
	if wdir == 4 then
		z = 0.25
	elseif wdir == 2 then
		x = 0.25
	elseif wdir == 5 then
		z = -0.25
	elseif wdir == 3 then
		x = -0.25
	end
	return {x = x, y = 0.08, z = z}
		
end

-- abm for torches

minetest.register_abm({
	nodenames = {"default:torch","mg_villages:torch","default:torch_wall","fire:fire"},
	interval = dur - 1,
	chance = 1,
	action = function(pos)
		if player_near(pos) then
			add_fire(pos, dur - .9)
		end
	end
})
