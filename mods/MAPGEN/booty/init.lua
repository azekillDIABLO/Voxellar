-- Booty init.lua
-- Copyright Duane Robertson (duane@duanerobertson.com), 2017
-- Distributed under the LGPLv2.1 (https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)

booty_mod = {}
booty_mod.version = "1.0"
booty_mod.path = minetest.get_modpath(minetest.get_current_modname())
booty_mod.world = minetest.get_worldpath()
booty_mod.tnt_chance = 20
booty_mod.poison_chance = 20
booty_mod.pit_chance = 20
booty_mod.pit_depth = 12
booty_mod.monster_chance = 20
booty_mod.treasures_per_level = 5
booty_mod.chest_chance = 5  -- chance of a chest in any given chunk


-- Level isn't really useful at this point...
local treasures = {}

do
  local options = {}
  options['default:acacia_wood']       =  {  1,  10,    10    }
  options['default:apple']             =  {  1,  10,    10    }
  options['default:book']              =  {  1,  50,    10    }
  options['default:bronze_ingot']      =  {  1,  120,   5     }
  options['default:coal_lump']         =  {  1,  30,    10    }
  options['default:copper_ingot']      =  {  1,  85,    5     }
  options['default:diamond']           =  {  1,  155,   5     }
  options['default:glass']             =  {  1,  50,    5     }
  options['default:gold_ingot']        =  {  1,  155,   5     }
  options['default:junglewood']        =  {  1,  10,    10    }
  options['default:mese_crystal']      =  {  1,  200,   nil   }
  options['default:meselamp']          =  {  1,  300,   nil   }
  options['default:obsidian']          =  {  1,  240,   nil   }
  options['default:obsidian_glass']    =  {  1,  240,   5     }
  options['default:obsidian_shard']    =  {  1,  85,    nil   }
  options['default:paper']             =  {  1,  50,    10    }
  options['default:pick_diamond']      =  {  1,  450,   nil   }
  options['default:pick_mese']         =  {  1,  600,   nil   }
  options['default:steel_ingot']       =  {  1,  50,    5     }
  options['default:sword_diamond']     =  {  1,  450,   nil   }
  options['default:sword_mese']        =  {  1,  400,   nil   }
  options['default:wood']              =  {  1,  10,    10    }
  options['booty:constant_flame']      =  {  1,  400,   nil   }
  options['booty:flaming_sword']       =  {  1,  600,   nil   }
  options['booty:moon_glass']          =  {  1,  480,   5     }
  options['booty:moon_juice']          =  {  1,  240,   5     }
  options['booty:moonstone']           =  {  1,  400,   nil   }
  options['booty:onion']               =  {  1,  20,    10    }
  options['booty:philosophers_stone']  =  {  1,  5000,  nil   }
  options['booty:unobtainium']         =  {  1,  5000,  nil   }
  options['elixirs:breathe']           =  {  1,  200,   5     }
  options['elixirs:liquid_bronze']     =  {  1,  250,   5     }
  options['elixirs:liquid_copper']     =  {  1,  150,   5     }
  options['elixirs:liquid_diamond']    =  {  1,  300,   5     }
  options['elixirs:liquid_mese']       =  {  1,  350,   5     }
  options['elixirs:liquid_steel']      =  {  1,  200,   5     }
  options['elixirs:liquid_stone']      =  {  1,  100,   5     }
  options['elixirs:liquid_wood']       =  {  1,  50,    5     }
  options['elixirs:molotov_cocktail']  =  {  1,  150,   5     }
  options['elixirs:naptha']            =  {  1,  100,   5     }
  options['farming:cotton']            =  {  1,  80,    10    }
  options['farming:flour']             =  {  1,  80,    10    }
  options['farming:seed_cotton']       =  {  1,  20,    10    }
  options['farming:seed_wheat']        =  {  1,  20,    10    }

  for name, d in pairs(options) do
    if minetest.registered_items[name] then
      treasures[#treasures+1] = { level = d[1], rarity = d[2], name = name }
      if d[3] then
        treasures[#treasures].name = name..' '..d[3]
      end
    end
  end

  for name, desc in pairs(minetest.registered_items) do
    if name:find('^wool:') then
      treasures[#treasures+1] = { level = 1, rarity = 20, name = name..' 2' }
    end
  end

  if minetest.registered_entities['mobs_monster:stone_monster'] then
    treasures[#treasures+1] = { level = 1, rarity = 400, name = 'mobs_monster:stone_monster', }
  end

  if minetest.registered_entities['mobs_monster:dungeon_master'] then
    treasures[#treasures+1] = { level = 1, rarity = 400, name = 'mobs_monster:dungeon_master', }
  end
end


local function clone_node(name)
	if not (name and type(name) == 'string') then
		return
	end

	local node = minetest.registered_nodes[name]
	local node2 = table.copy(node)
	return node2
end


local function disintigrate(minp, maxp)
	if not (minp and maxp) then
		return
	end
	minp = vector.round(minp)
	maxp = vector.round(maxp)

	local air = minetest.get_content_id('air')
	local vm = minetest.get_voxel_manip()
	if not vm then
		return
	end

	local emin, emax = vm:read_from_map(minp, maxp)
	local area = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
	local data = vm:get_data()
	local p = {}
	for z = minp.z, maxp.z do
		for y = minp.y, maxp.y do
			local ivm = area:index(minp.x, y, z)
			for x = minp.x, maxp.x do
				data[ivm] = air
				ivm = ivm + 1
			end
		end
	end
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end


if status_mod and status_mod.register_status then
	status_mod.register_status({
		name = 'poisoned',
		during = function(player)
			if not player then
				return
			end
			local player_name = player:get_player_name()
			if not player_name or player_name == '' then
				return
			end

			local damage = 1
			if status_mod.db.status and status_mod.db.status[player_name] and status_mod.db.status[player_name]['poisoned'] and status_mod.db.status[player_name]['poisoned']['damage'] then
				damage = tonumber(status_mod.db.status[player_name]['poisoned']['damage'])
			end

			local hp = player:get_hp()
			if hp and type(hp) == 'number' then
				hp = hp - damage
				player:set_hp(hp)
			end
		end,
		terminate = function(player)
			if not player then
				return
			end

			local player_name = player:get_player_name()
			minetest.chat_send_player(player_name, 'Your sickness ebbs away.')
		end,
	})
end


local chest_formspec =
	"size[8,9]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[current_name;main;0,0.3;8,4;]" ..
	"list[current_player;main;0,4.85;8,1;]" ..
	"list[current_player;main;0,6.08;8,3;8]" ..
	"listring[current_name;main]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,4.85)


local newnode = clone_node("default:chest")
newnode.description = "Treasure Chest"
newnode.on_construct = nil
newnode.light_source = 1
newnode.drop = 'default:chest'
newnode.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
	if not (pos and clicker) then
		return
	end

	local meta = minetest.get_meta(pos)
	if not meta then
		return
	end
  local level = math.floor((math.random() ^ 10) * 150) + 1
  --print('booty level '..level)

	local ready = meta:get_string('formspec')
	if treasures and ready == '' then
		meta:set_string("formspec", '0')
		if false and math.random(booty_mod.monster_chance) == 1 and booty_mod.dungeon_spawns and #booty_mod.dungeon_spawns > 0 then
    -- FIX ME
			meta:set_string("formspec", '')
			minetest.remove_node(pos)

			local desc = booty_mod.dungeon_spawns[math.random(#booty_mod.dungeon_spawns)]

			if not desc then
				return
			end

			local mpos = table.copy(pos)
			mpos.y = mpos.y + 1
			local obj = minetest.add_entity(mpos, desc.name)
			if not obj then
				return
			end
			local mob = obj:get_luaentity()
			if not mob then
				return
			end

			if mob.hp_max and mob.object and mob.health and mob.damage then
				local factor = 1 + (math.max(math.abs(pos.x), math.abs(pos.y), math.abs(pos.z)) / 6200)
				mob.started_in_dungeon = true
				factor = factor * 1.5
				mob.hp_max = math.floor(mob.hp_max * factor)
				mob.damage = math.floor(mob.damage * factor)
				mob.health = math.floor(mob.health * factor)
				mob.object:set_hp(mob.health)
				mob.initial_promotion = true
				check_for_death(mob)

				--print('Dungeon quality '..desc.name..': '..mob.health..' health, '..mob.damage..' damage')
			end
		elseif status_mod and status_mod.set_status and math.random(booty_mod.poison_chance) == 1 then
			local player_name = clicker:get_player_name()
			if not player_name or player_name == '' then
				return
			end
			minetest.chat_send_player(player_name, minetest.colorize('#FF0000', 'You\'ve been poisoned!'))
			status_mod.set_status(player_name, 'poisoned', 2 ^ math.random(8), {damage = 1})
			meta:set_string("formspec", '')
			return
		elseif minetest.registered_items['tnt:tnt_burning'] and math.random(booty_mod.tnt_chance) == 1 then
			meta:set_string("formspec", '')
			minetest.set_node(pos, {name = 'tnt:tnt_burning'})
			local timer = minetest.get_node_timer(pos)
			if timer then
				timer:start(3)
			end
			minetest.sound_play("default_dig_crumbly", {pos = pos, gain = 0.5, max_hear_distance = 10})
			return
		elseif math.random(booty_mod.pit_chance) == 1 then
			minetest.remove_node(pos)

			pos = clicker:getpos()
			if not pos then
				return
			end

			disintigrate({x = pos.x - 1, y = pos.y - booty_mod.pit_depth, z = pos.z - 1}, {x = pos.x + 1, y = pos.y + 2, z = pos.z + 1})

			return
		end

		meta:set_string("formspec", chest_formspec)
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
		local something
		for i = 1, 100 do
			for j = 1, booty_mod.treasures_per_level * level do
				for _, tre in pairs(treasures) do
					if tre.name and tre.level and tre.rarity and tre.level <= math.ceil(level / 10) and math.random(tre.rarity) == 1 and inv:room_for_item('main', tre.name) then
						inv:add_item('main', tre.name)
						something = true
					end
				end
			end

			if something then
				break
			end
		end
	end
end
minetest.register_node("booty:coffer", newnode)


-- This would be interesting, I suppose.
if false then
  minetest.register_abm({
    nodenames = {"default:dirt_with_grass", 'default:dirt_with_dry_grass', 'default:stone'},
    neighbors = {'air'},
    interval = 200,
    chance = 1000,
    catch_up = false,
    action = function(pos, node)
      if not (pos and node) then
        return
      end

      pos.y = pos.y + 1
      local node = minetest.get_node_or_nil(pos)
      if not node or node.name ~= "air" then
        return
      end

      minetest.set_node(pos, {name = 'booty:coffer'})
    end
  })
end


if minetest.registered_items['inspire:inspiration'] then
  minetest.register_craft({
    output = 'booty:coffer',
    recipe = {
      {'inspire:inspiration', 'inspire:inspiration', 'inspire:inspiration'},
      {'inspire:inspiration', 'default:chest', 'inspire:inspiration'},
      {'inspire:inspiration', 'inspire:inspiration', 'inspire:inspiration'},
    },
  })
else
  minetest.register_craft({
    output = 'booty:coffer',
    recipe = {
      {'', '', ''},
      {'default:mese_crystal', 'default:chest', 'default:mese_crystal'},
      {'', '', ''},
    },
  })
end


dofile(booty_mod.path .. "/mapgen.lua")


-- Debugging
if false then
  minetest.register_chatcommand("coffers", {
    params = "",
    description = "Display coffer success",
    privs = {},
    func = function(player_name, param)
      local fail = 0
      local succ = 0
      for _, p in pairs(booty_mod.coffers) do
        local node = minetest.get_node_or_nil(p)
        if node then
          if node.name == 'booty:coffer' then
            succ = succ + 1
          else
            fail = fail + 1
          end
        end
      end
      print('* succeeded: '..succ)
      print('* failed: '..fail)
    end,
  })
end
