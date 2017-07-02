local S
if (minetest.get_modpath("intllib")) then
	S = intllib.Getter()
else
	S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

local returnmirror = {}
returnmirror.cost_teleport = 200
returnmirror.cost_set = 20

if tonumber(minetest.setting_get("returnmirror_cost_teleport")) ~= nil then
	returnmirror.cost_teleport = tonumber(minetest.setting_get("returnmirror_cost_teleport"))
end
if tonumber(minetest.setting_get("returnmirror_cost_set")) ~= nil then
	returnmirror.cost_set = tonumber(minetest.setting_get("returnmirror_cost_set"))
end

if minetest.get_modpath("mana") ~= nil then
	returnmirror.mana = true
else
	returnmirror.mana = false
end

returnmirror.mana_check = function(player, cost)
	local allowed
	if returnmirror.mana then
		if mana.subtract(player:get_player_name(), cost) then
			allowed = true
		else
			allowed = false
		end
	else
		allowed = true
	end
	return allowed
end

returnmirror.set_position_inactive = function(itemstack, user, pointed_thing)
	-- Use pointed node's on_rightclick function first, if present
	if pointed_thing.type == "node" then
		local node = minetest.get_node(pointed_thing.under)
		if user and not user:get_player_control().sneak then
			if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
				return minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, user, itemstack) or itemstack
			end
		end
	end

	local pos = user:getpos()
	if returnmirror.mana_check(user, returnmirror.cost_set) then
		local newitem = ItemStack("returnmirror:mirror_active")
		newitem:set_metadata(minetest.pos_to_string(pos))
		minetest.sound_play( {name="returnmirror_set", gain=1}, {pos=pos, max_hear_distance=12})
		return newitem
	else
		minetest.sound_play( {name="returnmirror_fail", gain=1}, {pos=pos, max_hear_distance=18})
	end
end

returnmirror.set_position_active = function(itemstack, user, pointed_thing)
	-- Use pointed node's on_rightclick function first, if present
	if pointed_thing.type == "node" then
		local node = minetest.get_node(pointed_thing.under)
		if user and not user:get_player_control().sneak then
			if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
				return minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, user, itemstack) or itemstack
			end
		end
	end

	local pos = user:getpos()
	if returnmirror.mana_check(user, returnmirror.cost_set) then
		itemstack:set_metadata(minetest.pos_to_string(pos))
		minetest.sound_play( {name="returnmirror_set", gain=1}, {pos=pos, max_hear_distance=12})
		return itemstack
	else
		minetest.sound_play( {name="returnmirror_fail", gain=1}, {pos=pos, max_hear_distance=18})
	end
end

local longdesc, usagehelp
if minetest.get_modpath("doc_items") then
	usagehelp = S("Rightclick to set the mirror's teleport location. Leftclick to immediately teleport back to the mirror's teleport location.")
	if minetest.get_modpath("mana") ~= nil then
		longdesc = S("This item allows to teleport the user back to a previously set location, at the cost of mana.")
		usagehelp = usagehelp .. " " .. S("Setting the teleport location costs @1 mana, teleporting costs @2 mana.", returnmirror.cost_set, returnmirror.cost_teleport)
	else
		longdesc = S("This item allows to teleport its user back to a previously set location.")
	end
end

minetest.register_tool("returnmirror:mirror_inactive", {
	description = S("Mirror of Returning"),
	_doc_items_longdesc = longdesc,
	_doc_items_usagehelp = usagehelp,
	inventory_image = "returnmirror_mirror_inactive.png",
	wield_image = "returnmirror_mirror_inactive.png",
	tool_capabilities = {},
	range = 2,
	on_use = function(itemstack, user, pointed_thing)
		minetest.sound_play( {name="returnmirror_fail", gain=1}, {pos=user:getpos(), max_hear_distance=18})
	end,
	on_place = returnmirror.set_position_inactive,
	on_secondary_use = returnmirror.set_position_inactive,
})

minetest.register_tool("returnmirror:mirror_active", {
	description = S("Mirror of Returning"),
	_doc_items_create_entry = false,
	stack_max = 1,
	inventory_image = "returnmirror_mirror_active.png",
	wield_image = "returnmirror_mirror_active.png",
	tool_capabilities = {},
	range = 2,
	on_use = function(itemstack, user, pointed_thing)
		local dest_string = itemstack:get_metadata()
		local dest = minetest.string_to_pos(dest_string)
		local src = user:getpos()
		local fail = true
		if dest ~= nil then
			if returnmirror.mana_check(user, returnmirror.cost_teleport) then
				fail = false
				minetest.sound_play( {name="returnmirror_teleport", gain=1}, {pos=src, max_hear_distance=30})
				minetest.add_particlespawner({
					amount = 50,
					time = 0.1,
					minpos = {x=src.x-0.4, y=src.y+0.25, z=src.z-0.4},
					maxpos = {x=src.x+0.4, y=src.y+0.75, z=src.z+0.4},
					minvel = {x=-0.2, y=-0.2, z=-0.2},
					maxvel = {x=0.2, y=0.2, z=0.2},
					minexptime=3,
					maxexptime=4.5,
					minsize=1,
					maxsize=1.25,
					texture = "returnmirror_particle_departure.png",
				})
				user:setpos(dest)
				minetest.sound_play( {name="returnmirror_teleport", gain=1}, {pos=dest, max_hear_distance=30})
				minetest.add_particlespawner({
					amount = 100,
					time = 0.1,
					minpos = {x=dest.x-0.4, y=dest.y+0.25, z=dest.z-0.4},
					maxpos = {x=dest.x+0.4, y=dest.y+0.75, z=dest.z+0.4},
					minvel = {x=-0.4, y=-0.3, z=-0.4},
					maxvel = {x=0.4, y=0.3, z=0.4},
					minexptime=6,
					maxexptime=12,
					minsize=1,
					maxsize=1.25,
					texture = "returnmirror_particle_arrival.png",
				})
			end
		end
		if fail then
			minetest.sound_play( {name="returnmirror_fail", gain=1}, {pos=src, max_hear_distance=18})
		end
	end,
	on_place = returnmirror.set_position_active,
	on_secondary_use = returnmirror.set_position_active,
	groups = { not_in_creative_inventory = 1 },
})

minetest.register_alias("returnmirror:returnmirror", "returnmirror:mirror_inactive")

if minetest.get_modpath("doc") ~= nil then
	doc.add_entry_alias("tools", "returnmirror:mirror_inactive", "tools", "returnmirror:mirror_active")
end
