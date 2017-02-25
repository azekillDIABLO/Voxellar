-- Booty mapgen.lua
-- Copyright Duane Robertson (duane@duanerobertson.com), 2017
-- Distributed under the LGPLv2.1 (https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)

local max_depth = 31000
booty_mod.coffers = {}


-- This tables looks up nodes that aren't already stored.
local node = setmetatable({}, {
	__index = function(t, k)
		if not (t and k and type(t) == 'table') then
			return
		end

		t[k] = minetest.get_content_id(k)
		return t[k]
	end
})

local data = {}
local p2data = {}  -- vm rotation data buffer


local ground_nodes = {}
ground_nodes[minetest.get_content_id('default:stone')] = true
ground_nodes[minetest.get_content_id('default:desert_stone')] = true
ground_nodes[minetest.get_content_id('default:sandstone')] = true
ground_nodes[minetest.get_content_id('default:dirt')] = true
ground_nodes[minetest.get_content_id('default:sand')] = true
ground_nodes[minetest.get_content_id('default:silver_sand')] = true
ground_nodes[minetest.get_content_id('default:dirt_with_grass')] = true
ground_nodes[minetest.get_content_id('default:dirt_with_snow')] = true
ground_nodes[minetest.get_content_id('default:dirt_with_dry_grass')] = true


local function generate(p_minp, p_maxp, seed)
	if not (p_minp and p_maxp and seed) then
		return
	end

  if math.random(booty_mod.chest_chance) ~= 1 then
    return
  end

	local minp, maxp = p_minp, p_maxp
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	if not (vm and emin and emax) then
		return
	end

	vm:get_data(data)
	local area = VoxelArea:new({MinEdge = emin, MaxEdge = emax})

  local interface = {}
  for ivm in area:iterp(minp, maxp) do
    if (data[ivm] == node['air'] or data[ivm] == node['default:water_source'] or data[ivm] == node['default:snow']) and ground_nodes[data[ivm - area.ystride]] then
      interface[#interface+1] = ivm
    end
  end

  --print('#interface '..#interface)
  if #interface > 0 then
    local pick = interface[math.random(#interface)]
    --data[pick] = node['booty:coffer']
    local coffer_at = area:position(pick)
    minetest.set_node(coffer_at, {name='booty:coffer'})
    booty_mod.coffers[#booty_mod.coffers+1] = coffer_at
    --print('coffer at '..coffer_at.x..','..coffer_at.y..','..coffer_at.z)
  end


  --vm:set_data(data)

  --if booty_mod.DEBUG then
  --  vm:set_lighting({day = 15, night = 15})
  --else
  --  -- set_lighting causes lighting artifacts,
  --  -- but corrects the light inside trees.
  --  vm:set_lighting({day = 0, night = 0}, minp, maxp)
  --  vm:calc_lighting(minp, maxp)
  --  -- Does not work:
  --  --vm:calc_lighting({x=minp.x,y=emin.y,z=minp.z}, maxp)
  --end
  ----vm:update_liquids()
  --vm:write_to_map()
end


local function pgenerate(...)
	local status, err = pcall(generate, ...)
	--local status, err = true
	--generate(...)
	if not status then
		print('Booty: Could not generate terrain:')
		print(dump(err))
		collectgarbage("collect")
	end
end


minetest.register_on_generated(pgenerate)
