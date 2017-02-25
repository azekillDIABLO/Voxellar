-- Big_Trees treegen.lua
-- Copyright Duane Robertson (duane@duanerobertson.com), 2017
-- Distributed under the LGPLv2.1 (https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)


local max_depth = 31000
big_trees_mod.rarity = 1.5  -- 1.5


local newnode = big_trees_mod.clone_node("default:tree")
newnode.description = "Bark"
newnode.tiles = {"default_tree.png"}
newnode.is_ground_content = false
newnode.groups.tree = 0
newnode.groups.flammable = 0
minetest.register_node("big_trees:bark", newnode)

newnode = big_trees_mod.clone_node("default:tree")
newnode.description = "Giant Wood"
newnode.tiles = {"big_trees_tree.png"}
newnode.groups.flammable = 1
newnode.is_ground_content = false
minetest.register_node("big_trees:tree", newnode)

newnode = big_trees_mod.clone_node("big_trees:tree")
newnode.description = "Giant Wood With Mineral"
newnode.tiles = {"big_trees_tree.png^big_trees_mineral_aquamarine.png"}
newnode.drop = {
	max_items = 1,
	items = {
		{
			items = { 'default:mese_crystal_fragment', },
			rarity = 10,
		},
		{
			items = { 'default:copper_lump', },
			rarity = 4,
		},
		{
			items = { 'default:stone', },
			rarity = 1,
		},
	},
}
minetest.register_node("big_trees:tree_mineral", newnode)

minetest.register_craft({
	output = 'default:wood 4',
	recipe = {
		{'big_trees:tree'},
	}
})

minetest.register_node("big_trees:ironwood", {
	description = "Ironwood",
	tiles = {"big_trees_tree.png^[colorize:#B7410E:80"},
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, level=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("big_trees:diamondwood", {
	description = "Diamondwood",
	tiles = {"big_trees_tree.png^[colorize:#5D8AA8:80"},
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, level=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("big_trees:petrified_wood", {
	description = "Petrified Wood",
	tiles = {"ores_petrified_wood.png"},
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

newnode = big_trees_mod.clone_node("default:leaves")
newnode.tiles = {"default_leaves.png^[noalpha"}
newnode.special_tiles = nil
newnode.groups.leafdecay = 0
newnode.drawtype = nil
newnode.waving = nil
minetest.register_node("big_trees:leaves", newnode)

-- save for special occasions
newnode = big_trees_mod.clone_node("big_trees:leaves")
minetest.register_node("big_trees:leaves_special", newnode)

newnode = big_trees_mod.clone_node("big_trees:leaves_special")
if big_trees_mod.date and big_trees_mod.date[2] == 7 and big_trees_mod.date[3] > 1 and big_trees_mod.date[3] < 5 then
	newnode.tiles = {'default_steel_block.png^[colorize:#FF0000:200'}
	newnode.light_source = 15
end
minetest.register_node("big_trees:leaves_special_1", newnode)

newnode = big_trees_mod.clone_node("big_trees:leaves_special")
if big_trees_mod.date and big_trees_mod.date[2] == 7 and big_trees_mod.date[3] > 1 and big_trees_mod.date[3] < 5 then
	newnode.tiles = {'default_steel_block.png^[colorize:#FFFFFF:200'}
	newnode.light_source = 15
end
minetest.register_node("big_trees:leaves_special_2", newnode)

newnode = big_trees_mod.clone_node("big_trees:leaves_special")
if big_trees_mod.date and big_trees_mod.date[2] == 7 and big_trees_mod.date[3] > 1 and big_trees_mod.date[3] < 5 then
	newnode.tiles = {'default_steel_block.png^[colorize:#0000FF:200'}
	newnode.light_source = 15
end
minetest.register_node("big_trees:leaves_special_3", newnode)

newnode = big_trees_mod.clone_node("default:water_source")
newnode.description = "Water"
newnode.liquid_range = 0
newnode.liquid_viscosity = 1
newnode.liquid_renewable = false
newnode.liquid_alternative_flowing = "big_trees:weightless_water"
newnode.liquid_alternative_source = "big_trees:weightless_water"
minetest.register_node("big_trees:weightless_water", newnode)

newnode = big_trees_mod.clone_node("big_trees:weightless_water")
newnode.description = "Sap"
newnode.tiles[1].name =  "big_trees_sap_source_animated.png"
newnode.special_tiles[1].name =  "big_trees_sap_source_animated.png"
newnode.liquid_alternative_flowing = "big_trees:sap"
newnode.liquid_alternative_source = "big_trees:sap"
newnode.post_effect_color = {a = 120, r = 255, g = 191, b = 0}
minetest.register_node("big_trees:sap", newnode)

if bucket and bucket.liquids then
  bucket.liquids['big_trees:weightless_water'] = {
    source = 'big_trees:weightless_water',
    flowing = 'big_trees:weightless_water',
    itemname = 'bucket:bucket_water',
  }

  bucket.register_liquid(
    "big_trees:sap",
    "big_trees:sap",
    "big_trees:bucket_sap",
    "big_trees_bucket_sap.png",
    "Bucket of Sap",
    {sap_bucket = 1}
  )
end

minetest.register_node("big_trees:amber", {
	description = "Amber",
	drawtype = "glasslike",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"big_trees_amber.png"},
	light_source = 1,
	use_texture_alpha = true,
	is_ground_content = false,
	groups = {cracky = 3, level=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("big_trees:syrup", {
	description = "Syrup",
	drawtype = "plantlike",
	tiles = {"big_trees_syrup.png"},
	inventory_image  = "big_trees_syrup.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	on_use = minetest.item_eat(2, "vessels:glass_bottle"),
	sounds = default.node_sound_glass_defaults(),
})

newnode = big_trees_mod.clone_node("default:tree")
newnode.description = "Glowing Fungal Wood"
newnode.tiles = {"big_trees_tree.png^vmg_glowing_fungal.png",}
newnode.drop = {items={ {items={"default:wood"},}, {items={"big_trees:glowing_fungus",},},},}
newnode.light_source = (big_trees_mod.light_max or 10) - 4
minetest.register_node("big_trees:glowing_fungal_wood", newnode)


minetest.register_craftitem("big_trees:charcoal", {
	description = "Charcoal Briquette",
	inventory_image = "default_coal_lump.png",
	groups = {coal = 1}
})

minetest.register_craft({
	type = "fuel",
	recipe = "big_trees:charcoal",
	burntime = 50,
})

minetest.register_craft({
	type = "cooking",
	output = "default:sand",
	recipe = "big_trees:bark",
})

minetest.register_craft({
	type = "cooking",
	output = "default:iron_lump",
	recipe = "big_trees:ironwood",
})

minetest.register_craft({
	type = "cooking",
	output = "default:diamond",
	recipe = "big_trees:diamondwood",
})

minetest.register_craft({
	type = "cooking",
	output = "big_trees:charcoal",
	recipe = "group:tree",
})

minetest.register_craft({
	output = 'default:torch 4',
	recipe = {
		{'group:coal'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:coalblock',
	recipe = {
		{'group:coal', 'group:coal', 'group:coal'},
		{'group:coal', 'group:coal', 'group:coal'},
		{'group:coal', 'group:coal', 'group:coal'},
	}
})

if minetest.get_modpath('tnt') then
	minetest.register_craft({
		output = "tnt:gunpowder",
		type = "shapeless",
		recipe = {"group:coal", "default:gravel"}
	})
end

minetest.register_craft({
	output = 'big_trees:syrup',
	type = "shapeless",
	recipe = {
		'vessels:glass_bottle',
		'group:sap_bucket',
	},
	replacements = {
		{'big_trees:bucket_sap', 'bucket:bucket_empty'},
		{'big_trees:bucket_wood_sap', 'big_trees:bucket_wood_empty'},
	},
})

minetest.register_craft({
	type = "cooking",
	output = "big_trees:amber",
	recipe = "big_trees:bucket_sap",
	replacements = {{'big_trees:bucket_sap', 'bucket:bucket_empty'},},
})


--minetest.register_craft( {
--	output = "vessels:glass_bottle 10",
--	recipe = {
--		{ "big_trees:amber", "", "big_trees:amber" },
--		{ "big_trees:amber", "", "big_trees:amber" },
--		{ "", "big_trees:amber", "" }
--	}
--})


local tree_noise_1 = {offset = 0, scale = 1, seed = 7227, spread = {x = 10, y = 10, z = 10}, octaves = 3, persist = 1, lacunarity = 2}
local wood_noise = {offset = 0, scale = 1, seed = -4640, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.7, lacunarity = 2}

--local totals = {}
--local interest = {}
--interest['big_trees:tree'] = true
--interest['big_trees:ironwood'] = true
--interest['big_trees:diamondwood'] = true
--interest['big_trees:bark'] = true
--interest['big_trees:weightless_water'] = true
--interest['big_trees:sap'] = true
--interest['big_trees:tree_mineral'] = true


big_trees_mod.is_tree = function(minp)
	local tree_n = minetest.get_perlin(tree_noise_1):get2d({x=math.floor((minp.x + 32) / 160) * 80, y=math.floor((minp.z + 32) / 160) * 80})
	if not tree_n or minp.y < -112 or minp.y > 208 or (not big_trees_mod.DEBUG and tree_n < 1.5) then
		return
	end

	return true
end

big_trees_mod.treegen = function(minp, maxp, data, area, node)
	if not (minp and maxp and data and area and node and type(data) == 'table') then
		return
	end

	local tree_n = minetest.get_perlin(tree_noise_1):get2d({x=math.floor((minp.x + 32) / 160) * 80, y=math.floor((minp.z + 32) / 160) * 80})
	if not tree_n or minp.y < -112 or minp.y > 208 or (not big_trees_mod.DEBUG and tree_n < big_trees_mod.rarity) then
		return
	end

	local csize = vector.add(vector.subtract(maxp, minp), 1)
	local map_max = {x = csize.x, y = csize.y + 2, z = csize.z}
	local map_min = {x = minp.x, y = minp.y - 1, z = minp.z}

	local wood_1 = minetest.get_perlin_map(wood_noise, map_max):get3dMap_flat(map_min)
	if not wood_1 then
		return
	end

	local write = false

	local index = 0
	local index3d = 0
	local math_random = math.random
	local math_floor = math.floor
	local math_abs = math.abs
	local math_max = math.max
	local math_sqrt = math.sqrt
	for z = minp.z, maxp.z do
		for x = minp.x, maxp.x do
			local dx = (x + 32) % 160 - 80
			local dz = (z + 32) % 160 - 80
			local r2 = 70 + math_floor(dx / 4) % 3 * 6 + math_floor(dz / 4) % 3 * 6

			index = index + 1
			index3d = (z - minp.z) * (csize.y + 2) * csize.x + (x - minp.x) + 1
			local ivm = area:index(x, minp.y - 1, z)
			local distance = math_floor(math_sqrt(dx ^ 2 + dz ^ 2))

			for y = minp.y - 1, maxp.y + 1 do
				local dy = y - minp.y
				local r = 20
				if math_abs(y - 50) > 130 then
					r = math_max(0, r - math_floor((math_abs(y - 50) - 130) / 2))
				end

				local distance3
				if y > 112 then
					distance3 = math_floor(math_sqrt(dx ^ 2 + dz ^ 2 + (y - 192) ^ 2))
				end

				if distance < r then
					if distance % 8 == 7 and wood_1[index3d] < 0.3 then
						data[ivm] = node['big_trees:petrified_wood']
					elseif wood_1[index3d] < -0.9 then
						data[ivm] = node['big_trees:weightless_water']
					elseif wood_1[index3d] < -0.8 then
						data[ivm] = node['air']
					elseif wood_1[index3d] < -0.1 then
						data[ivm] = node['big_trees:tree']
					elseif wood_1[index3d] < 0.1 then
						data[ivm] = node['air']
					elseif wood_1[index3d] < 0.7 then
						data[ivm] = node['big_trees:tree']
					elseif wood_1[index3d] < 1.2 then
						data[ivm] = node['big_trees:ironwood']
					else
						data[ivm] = node['big_trees:diamondwood']
					end

					if data[ivm] ~= node['air'] and data[ivm] ~= node['big_trees:weightless_water'] then
						if math_random(200) == 1 then
							data[ivm] = node['big_trees:sap']
						elseif math_random(1000) == 1 then
							data[ivm] = node['big_trees:tree_mineral']
						end
					end
					write = true
				elseif y < 222 and y > -132 and distance < r + 2 then
					data[ivm] = node['big_trees:bark']
					write = true

				-- foliage
				elseif y < 272 and y > 112 and distance3 and distance3 < r2 and y % 10 == 0 and (math_floor(dx / 4) % 3 == 0 or math_floor(dz / 4) % 3 == 0) then
					if data[ivm] == node['air'] then
						data[ivm] = node['big_trees:bark']
						write = true
					end
				elseif y < 275 and y > 115 and distance3 and distance3 < r2 and (y + 3) % 10 < 7 and (math_floor((dx + 3) / 4) % 3 < 2 or math_floor((dz + 3) / 4) % 3 < 2) then
					local r = math_abs(((y + 3) % 10) - 3)
					if (r < 2 or math_random(r) == 1) and data[ivm] == node['air'] then
						if distance3 > r2 - 10 and math_random(10) == 1 then
							data[ivm] = node['big_trees:leaves_special_'..math.random(3)]
						else
							data[ivm] = node['big_trees:leaves']
						end
						write = true
					end
				end

				--totals[data[ivm]] = totals[data[ivm]] and totals[data[ivm]] + 1 or 1

				ivm = ivm + area.ystride
				index3d = index3d + csize.x
			end
		end
	end

	--for key, total in pairs(totals) do
	--	local name = minetest.get_name_from_content_id(key)
	--	if interest[name] then
	--		print(name, total)
	--	end
	--end

	return write
end
