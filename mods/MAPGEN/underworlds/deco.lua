-- Underworlds deco.lua
-- Copyright Duane Robertson (duane@duanerobertson.com), 2017
-- Distributed under the LGPLv2.1 (https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)


local newnode
local light_max = default.light_max or 10


if not minetest.registered_items['fun_caves:stalactite'] then
  -- Speleothems can be made into cobblestone, to get them out of inventory.
  minetest.register_craft({
    output = "default:cobble",
    recipe = {
      {"", "", ""},
      {"underworlds:stalactite", "underworlds:stalactite", ""},
      {"underworlds:stalactite", "underworlds:stalactite", ""},
    },
  })

  minetest.register_craft({
    output = "default:cobble",
    recipe = {
      {"", "", ""},
      {"underworlds:stalagmite", "underworlds:stalagmite", ""},
      {"underworlds:stalagmite", "underworlds:stalagmite", ""},
    },
  })

  -- What's a cave without speleothems?
  local spel = {
    {type1="stalactite", type2="stalagmite", tile="default_stone.png"},
    {type1="stalactite_slimy", type2="stalagmite_slimy", tile="default_stone.png^underworlds_algae.png"},
    {type1="stalactite_mossy", type2="stalagmite_mossy", tile="default_stone.png^underworlds_moss.png"},
    {type1="icicle_down", type2="icicle_up", desc="Icicle", tile="caverealms_thin_ice.png", drop="default:ice"},
  }

  for _, desc in pairs(spel) do
    minetest.register_node("underworlds:"..desc.type1, {
      description = (desc.desc or "Stalactite"),
      tiles = {desc.tile},
      is_ground_content = true,
      walkable = false,
      paramtype = "light",
      drop = (desc.drop or "underworlds:stalactite"),
      drawtype = "nodebox",
      node_box = { type = "fixed", 
        fixed = {
          {-0.07, 0.0, -0.07, 0.07, 0.5, 0.07}, 
          {-0.04, -0.25, -0.04, 0.04, 0.0, 0.04}, 
          {-0.02, -0.5, -0.02, 0.02, 0.25, 0.02}, 
        } },
      groups = {rock=1, cracky=3},
      sounds = default.node_sound_stone_defaults(),
    })

    minetest.register_node("underworlds:"..desc.type2, {
      description = (desc.desc or "Stalagmite"),
      tiles = {desc.tile},
      is_ground_content = true,
      walkable = false,
      paramtype = "light",
      drop = "underworlds:stalagmite",
      drawtype = "nodebox",
      node_box = { type = "fixed", 
        fixed = {
          {-0.07, -0.5, -0.07, 0.07, 0.0, 0.07}, 
          {-0.04, 0.0, -0.04, 0.04, 0.25, 0.04}, 
          {-0.02, 0.25, -0.02, 0.02, 0.5, 0.02}, 
        } },
      groups = {rock=1, cracky=3},
      sounds = default.node_sound_stone_defaults(),
    })
  end
end

if not minetest.registered_items['fun_caves:hot_stone'] then
  -- stone, hot
  minetest.register_node("underworlds:hot_stone", {
    description = "Hot Stone",
    tiles = {"default_desert_stone.png^[colorize:#FF0000:150"},
    is_ground_content = true,
    groups = {crumbly=2, surface_hot=3},
    light_source = light_max - 5,
    damage_per_second = 1,
    sounds = default.node_sound_stone_defaults({
      footstep = {name="default_stone_footstep", gain=0.25},
    }),
  })
end

if not minetest.registered_items['fun_caves:glowing_fungal_stone'] then
  -- Glowing fungal stone provides an eerie light.
  minetest.register_node("underworlds:glowing_fungal_stone", {
    description = "Glowing Fungal Stone",
    tiles = {"default_stone.png^vmg_glowing_fungal.png",},
    is_ground_content = true,
    light_source = light_max - 4,
    groups = {cracky=3, stone=1},
    drop = {items={ {items={"default:cobble"},}, {items={"underworlds:glowing_fungus",},},},},
    sounds = default.node_sound_stone_defaults(),
  })

  -- Glowing fungus grows underground.
  minetest.register_craftitem("underworlds:glowing_fungus", {
    description = "Glowing Fungus",
    drawtype = "plantlike",
    paramtype = "light",
    tiles = {"vmg_glowing_fungus.png"},
    inventory_image = "vmg_glowing_fungus.png",
    groups = {dig_immediate = 3},
  })
end

if not minetest.registered_items['fun_caves:black_sand'] then
  -- black (oily) sand
  local newnode = underworlds_mod.clone_node("default:sand")
  newnode.description = "Black Sand"
  newnode.tiles = {"underworlds_black_sand.png"}
  newnode.groups['falling_node'] = 0
  minetest.register_node("underworlds:black_sand", newnode)
end

if not minetest.registered_items['fun_caves:hot_cobble'] then
  -- cobble, hot - cobble with lava instead of mortar XD
  minetest.register_node("underworlds:hot_cobble", {
    description = "Hot Cobble",
    tiles = {"caverealms_hot_cobble.png"},
    is_ground_content = true,
    groups = {crumbly=2, surface_hot=3},
    --light_source = 2,
    damage_per_second = 1,
    sounds = default.node_sound_stone_defaults({
      footstep = {name="default_stone_footstep", gain=0.25},
    }),
  })
end

newnode = underworlds_mod.clone_node("default:water_source")
newnode.description = "Poisonous Water"
newnode.groups.poison = 3
newnode.light_source = 6
newnode.liquid_alternative_flowing = "underworlds:water_poison_flowing"
newnode.liquid_alternative_source = "underworlds:water_poison_source"
newnode.post_effect_color = {a = 103, r = 108, g = 128, b = 64}
newnode.special_tiles[1].name = "underworlds_water_poison_source_animated.png"
newnode.tiles[1].name = "underworlds_water_poison_source_animated.png"
minetest.register_node("underworlds:water_poison_source", newnode)

newnode = underworlds_mod.clone_node("default:water_flowing")
newnode.description = "Poisonous Water"
newnode.groups.poison = 3
newnode.light_source = 6
newnode.liquid_alternative_flowing = "underworlds:water_poison_flowing"
newnode.liquid_alternative_source = "underworlds:water_poison_source"
newnode.post_effect_color = {a = 103, r = 108, g = 128, b = 64}
newnode.special_tiles[1].name = "underworlds_water_poison_flowing_animated.png"
newnode.tiles[1] = "underworlds_water_poison.png"
minetest.register_node("underworlds:water_poison_flowing", newnode)

if not minetest.registered_items['fun_caves:thin_ice'] then
  -- ice, thin -- transparent
  minetest.register_node("underworlds:thin_ice", {
    description = "Thin Ice",
    tiles = {"caverealms_thin_ice.png"},
    is_ground_content = true,
    groups = {cracky=3},
    sounds = default.node_sound_glass_defaults(),
    use_texture_alpha = true,
    light_source = 1,
    drawtype = "glasslike",
    sunlight_propagates = true,
    freezemelt = "default:water_source",
    paramtype = "light",
  })
end

-- Iron, hot
newnode = underworlds_mod.clone_node("default:steelblock")
newnode.description = "Hot Iron Block"
newnode.tiles = {"default_steel_block.png^[colorize:#FF3000:150"}
newnode.groups.surface_hot=3
newnode.light_source = 3
minetest.register_node("underworlds:hot_iron", newnode)

-- Brass, hot
newnode = underworlds_mod.clone_node("default:steelblock")
newnode.description = "Hot Brass Block"
newnode.tiles = {"default_steel_block.png^[colorize:#FFBF00:150"}
newnode.groups.surface_hot=3
newnode.light_source = 2
minetest.register_node("underworlds:hot_brass", newnode)

-- Polluted dirt
newnode = underworlds_mod.clone_node("default:dirt")
newnode.description = "Polluted Dirt"
newnode.tiles = {"default_dirt.png^[colorize:#100020:100"}
newnode.groups.soil = 0
minetest.register_node("underworlds:polluted_dirt", newnode)

-- Bare branches
minetest.register_node('underworlds:sticks_default', {
	description = 'Sticks',
	drawtype = 'allfaces_optional',
	waving = 1,
	visual_scale = 1.3,
	tiles = {'underworlds_dry_twigs.png'},
	paramtype = 'light',
	is_ground_content = false,
	drop = 'default:stick 2',
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
})

-- Black leaves
newnode = underworlds_mod.clone_node("default:leaves")
newnode.description = "Blackened Leaves"
newnode.tiles = {"default_leaves.png^[colorize:#100020:200"}
newnode.special_tiles = {"default_leaves_simple.png^[colorize:#100020:200"}
newnode.groups = {snappy = 3, flammable = 2}
minetest.register_node("underworlds:leaves_black", newnode)


underworlds_mod.schematics = {}
do
	local w, h, d = 5, 8, 5
	local s = underworlds_mod.schematic_array(w, h, d)

	for y = 0, math.floor(h/2)-1 do
		s.data[2*d*h + y*d + 2 + 1].name = 'default:tree'
		s.data[2*d*h + y*d + 2 + 1].param1 = 255
	end

	for z = 0, d-1 do
		for y = math.floor(h/2), h-1 do
			for x = 0, w-1 do
				if y < h - 1 or (x ~= 0 and x ~= w-1 and z ~= 0 and z ~= d-1) then
					if math.random(2) == 1 then
						s.data[z*d*h + y*d + x + 1].name = 'underworlds:leaves_black'
					else
						s.data[z*d*h + y*d + x + 1].name = 'underworlds:sticks_default'
					end

					if y == h-1 or x == 0 or x == w-1 or z == 0 or z == d-1 then
						s.data[z*d*h + y*d + x + 1].param1 = 150
					else
						s.data[z*d*h + y*d + x + 1].param1 = 225
					end
				end
			end
		end
	end

	for z = math.floor(d/2)-1, math.floor(d/2)+1, 2 do
		for x = math.floor(w/2)-1, math.floor(w/2)+1, 2 do
			s.data[z*d*h + math.floor(h/2)*d + x + 1].name = 'default:tree'
			s.data[z*d*h + math.floor(h/2)*d + x + 1].param1 = 150
		end
	end

	for y = 0, h-1 do
		if y / 3 == math.floor(y / 3) then
			s.yslice_prob[#s.yslice_prob+1] = {ypos=y,prob=170}
		end
	end

	underworlds_mod.schematics['decaying_tree'] = s
end
