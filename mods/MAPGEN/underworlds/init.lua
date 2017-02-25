-- Underworlds init.lua
-- Copyright Duane Robertson (duane@duanerobertson.com), 2017
-- Distributed under the LGPLv2.1 (https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)


underworlds_mod = {}
underworlds_mod.version = "1.0"
underworlds_mod.path = minetest.get_modpath(minetest.get_current_modname())
underworlds_mod.world = minetest.get_worldpath()


underworlds_mod.underzones = {
	Caina = {
		name = 'Caina',
		ceiling_node = 'default:ice',
		column_node = 'default:ice',
		column_node_rare  =  'underworlds:thin_ice',
		floor_node = 'default:ice',
    high_chunk = -2,
    low_chunk = -4,
		regular_columns = false,
		stalactite = 'underworlds:icicle_down',
		stalactite_chance = 12,
		stone_depth = 2,
		vary = true,
	},
	Phlegethos = {
		name = 'Phlegethos',
		ceiling_node = 'underworlds:black_sand',
		column_node = 'default:stone',
		column_node_rare  =  'underworlds:hot_stone',
		floor_node = 'underworlds:hot_cobble',
		fluid = 'default:lava_source',
		fluid_chance = 1200,
    high_chunk = -6,
    low_chunk = -8,
		lake = 'default:lava_source',
		lake_level = 5,
		regular_columns = false,
		stone_depth = 1,
		vary = true,
	},
	Dis = {
		name = 'Dis',
    ceiling_height = 2,
		ceiling_node = 'underworlds:hot_brass',
    city = true,
		column_node = 'default:steelblock',
    floor_depth = 10,
		floor_node = 'underworlds:hot_brass',
    high_chunk = -10,
    low_chunk = -10,
		regular_columns = true,
		stone_depth = 1,
		vary = false,
	},
	Minauros = {
		name = 'Minauros',
		ceiling_node = 'underworlds:black_sand',
		column_node = 'underworlds:polluted_dirt',
		column_node_rare  =  'underworlds:glowing_fungal_stone',
		floor_node = 'underworlds:polluted_dirt',
		fluid = 'underworlds:water_poison_source',
		fluid_chance = 2000,
    high_chunk = -12,
		lake = 'underworlds:water_poison_source',
		lake_level = 10,
    low_chunk = -14,
		regular_columns = false,
		stone_depth = 2,
		vary = true,
	},
	Styx = {
		name = 'Styx',
		ceiling_node = 'default:dirt',
		floor_node = 'default:dirt',
    high_chunk = -16,
    low_chunk = -20,
		regular_columns = false,
		stone_depth = 2,
    sea_chunk = -16,
		vary = true,
	},
}

for _, uz in pairs(underworlds_mod.underzones) do
  if uz.low_chunk and uz.high_chunk then
    uz.lower_bound = uz.low_chunk * 80 - 32
    uz.floor = uz.lower_bound + (uz.floor_depth or 20)
    uz.upper_bound = uz.high_chunk * 80 + 47
    uz.ceiling = uz.upper_bound - (uz.ceiling_height or 20)
  end
  if uz.sea_chunk then
    uz.sealevel = uz.sea_chunk * 80
  end
end


function underworlds_mod.clone_node(name)
	if not (name and type(name) == 'string') then
		return
	end

	local node = minetest.registered_nodes[name]
	local node2 = table.copy(node)
	return node2
end


underworlds_mod.place_schematic = function(minp, maxp, data, p2data, area, node, pos, schem, center)
	if not (minp and maxp and data and p2data and area and node and pos and schem and type(data) == 'table' and type(p2data) == 'table' and type(schem) == 'table') then
		return
	end

	local rot = math.random(4) - 1
	local yslice = {}
	if schem.yslice_prob then
		for _, ys in pairs(schem.yslice_prob) do
			yslice[ys.ypos] = ys.prob
		end
	end

	if center then
		pos.x = pos.x - math.floor(schem.size.x / 2)
		pos.z = pos.z - math.floor(schem.size.z / 2)
	end

	for z1 = 0, schem.size.z - 1 do
		for x1 = 0, schem.size.x - 1 do
			local x, z
			if rot == 0 then
				x, z = x1, z1
			elseif rot == 1 then
				x, z = schem.size.z - z1 - 1, x1
			elseif rot == 2 then
				x, z = schem.size.x - x1 - 1, schem.size.z - z1 - 1
			elseif rot == 3 then
				x, z = z1, schem.size.x - x1 - 1
			end
			local dz = pos.z - minp.z + z
			local dx = pos.x - minp.x + x
			if pos.x + x > minp.x and pos.x + x < maxp.x and pos.z + z > minp.z and pos.z + z < maxp.z then
				local ivm = area:index(pos.x + x, pos.y, pos.z + z)
				local isch = z1 * schem.size.y * schem.size.x + x1 + 1
				local math_random = math.random
				for y = 0, schem.size.y - 1 do
					local dy = pos.y - minp.y + y
						if yslice[y] or 255 >= math_random(255) then
							local prob = schem.data[isch].prob or schem.data[isch].param1 or 255
							if prob >= math_random(255) and schem.data[isch].name ~= "air" then
								data[ivm] = node[schem.data[isch].name]
							end
							local param2 = schem.data[isch].param2 or 0
							p2data[ivm] = param2
						end

					ivm = ivm + area.ystride
					isch = isch + schem.size.x
				end
			end
		end
	end
end


-- Create and initialize a table for a schematic.
function underworlds_mod.schematic_array(width, height, depth)
	if not (width and height and depth and type(width) == 'number' and type(height) == 'number' and type(depth) == 'number') then
		return
	end

	-- Dimensions of data array.
	local s = {size={x=width, y=height, z=depth}}
	s.data = {}

	for z = 0,depth-1 do
		for y = 0,height-1 do
			for x = 0,width-1 do
				local i = z*width*height + y*width + x + 1
				s.data[i] = {}
				s.data[i].name = "air"
				s.data[i].param1 = 000
			end
		end
	end

	s.yslice_prob = {}

	return s
end


dofile(underworlds_mod.path .. "/deco.lua")
dofile(underworlds_mod.path .. "/mapgen.lua")
