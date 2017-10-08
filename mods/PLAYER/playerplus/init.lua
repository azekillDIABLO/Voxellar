--[[
	walking on ice makes player walk faster,
	stepping through snow slows player down,
	touching a cactus hurts player,
	suffocation when head is inside solid node,
	player knock-back effects when punched.

	PlayerPlus by TenPlus1
]]

playerplus = {}


-- get node but use fallback for nil or unknown
local node_ok = function(pos, fallback)

	fallback = fallback or "air"

	local node = minetest.get_node_or_nil(pos)

	if node and minetest.registered_nodes[node.name] then
		return node.name
	end

	return fallback
end


local armor_mod = minetest.get_modpath("3d_armor")
local def = {}
local time = 0


minetest.register_globalstep(function(dtime)

	time = time + dtime

	-- every 1 second
	if time < 1 then
		return
	end

	-- reset time for next check
	time = 0

	-- define locals outside loop
	local name, pos, ndef

	-- loop through players
	for _,player in ipairs(minetest.get_connected_players()) do

		-- who am I?
		name = player:get_player_name()

		-- where am I?
		pos = player:getpos()

		-- what is around me?
		pos.y = pos.y - 0.1 -- standing on
		playerplus[name].nod_stand = node_ok(pos)

		-- Does the node below me have an on_walk_over function set?
		ndef = minetest.registered_nodes[playerplus[name].nod_stand]
		if ndef and ndef.on_walk_over then
			ndef.on_walk_over(pos, ndef, player)
		end

		pos.y = pos.y + 1.5 -- head level
		playerplus[name].nod_head = node_ok(pos)
	
		pos.y = pos.y - 1.2 -- feet level
		playerplus[name].nod_feet = node_ok(pos)

		pos.y = pos.y - 0.2 -- reset pos

		-- set defaults
		def.speed = 1
		def.jump = 1
		def.gravity = 1

		-- is 3d_armor mod active? if so make armor physics default
		if armor_mod and armor and armor.def then
			-- get player physics from armor
			def.speed = armor.def[name].speed or 1
			def.jump = armor.def[name].jump or 1
			def.gravity = armor.def[name].gravity or 1
		end

		-- standing on ice? if so walk faster
		if playerplus[name].nod_stand == "default:ice" then
			def.speed = def.speed + 0.4
		end

		-- standing on snow? if so walk slower
		if playerplus[name].nod_stand == "default:snow"
		or playerplus[name].nod_stand == "default:snowblock" then
			def.speed = def.speed - 0.4
		end

		-- set player physics
		player:set_physics_override(def.speed, def.jump, def.gravity)
--		print ("Speed:", def.speed, "Jump:", def.jump, "Gravity:", def.gravity)

		-- Is player suffocating inside a normal node without no_clip privs?
		local ndef = minetest.registered_nodes[playerplus[name].nod_head]

		if ndef.walkable == true
		and ndef.drowning == 0
		and ndef.damage_per_second <= 0
		and ndef.groups.disable_suffocation ~= 1
		and ndef.drawtype == "normal"
		and not minetest.check_player_privs(name, {noclip = true}) then

			if player:get_hp() > 0 then
				player:set_hp(player:get_hp() - 2)
			end
		end

		-- am I near a cactus?
		local near = minetest.find_node_near(pos, 1, "default:cactus")

		if near then

			-- am I touching the cactus? if so it hurts
			for _,object in pairs(minetest.get_objects_inside_radius(near, 1.1)) do

				if object:get_hp() > 0 then
					object:set_hp(object:get_hp() - 2)
				end
			end

		end

	end

end)


-- set to blank on join (for 3rd party mods)
minetest.register_on_joinplayer(function(player)

	local name = player:get_player_name()

	playerplus[name] = {}
	playerplus[name].nod_head = ""
	playerplus[name].nod_feet = ""
	playerplus[name].nod_stand = ""
end)


-- clear when player leaves
minetest.register_on_leaveplayer(function(player)

	playerplus[ player:get_player_name() ] = nil
end)


-- add privelage to disable knock-back
minetest.register_privilege("no_knockback", {
		description = "Disables player knock-back effect",
		give_to_singleplayer = false})

-- is player knock-back effect enabled?
if minetest.setting_getbool("player_knockback") ~= false then

minetest.register_entity("playerplus:temp", {
	physical = true,
	collisionbox = {-0.20, -1, -0.20, 0.20, 1, 0.20},
	visual_size = {x = 0, y = 0},
	visual = "sprite",
	textures = {"trans.png"},
	stepheight = 0.6,

	on_activate = function(self, staticdata, dtime)

		self.timer = (self.timer or 0) + dtime

		if self.timer > 1 then
			self.object:remove()
		end
	end
})


-- player knock-back function
local punchy = function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)

	local damage = 0

	-- get tool damage
	if tool_capabilities then

		local armor = player:get_armor_groups() or {}
		local tmp

		for group,_ in pairs( (tool_capabilities.damage_groups or {}) ) do

			tmp = time_from_last_punch / (tool_capabilities.full_punch_interval or 1.4)

			if tmp < 0 then
				tmp = 0.0
			elseif tmp > 1 then
				tmp = 1.0
			end

			damage = damage + (tool_capabilities.damage_groups[group] or 0) * tmp

		end

		-- check for knockback value
		if tool_capabilities.damage_groups["knockback"] then
			damage = tool_capabilities.damage_groups["knockback"]
		end

	end
	-- END tool damage

--	print ("---", player:get_player_name(), damage)

	if not dir then return end

	-- check if player has 'no_knockback' privelage
	local privs = minetest.get_player_privs(player:get_player_name())

	if privs["no_knockback"] then
		return
	end

	local vel = damage * 2
	local pos = player:getpos() ; pos.y = pos.y + 1.0
	local ent = minetest.add_entity(pos, "playerplus:temp")
	local obj = ent:get_luaentity()
	local yaw = player:get_look_horizontal() or 0 ; yaw = -yaw * (180 / math.pi)

	if obj and not player:get_attach() then

		player:set_attach(ent, "", {x = 0, y = 0, z = 0}, {x = 0, y = yaw, z = 0})

		ent:setvelocity({
			x = dir.x * vel,
			y = 0,
			z = dir.z * vel
		})

		ent:setacceleration({
			x = dir.x * -1,
			y = 0,
			z = dir.z * -1
		})

		minetest.after(0.25, function()

			player:set_detach()

			ent:remove()
		end)

	else
		ent:remove()
	end
end

minetest.register_on_punchplayer(punchy)

end -- END if

minetest.register_tool("playerplus:stick", {
	description = "KB Stick",
	inventory_image = "default_stick.png",
	wield_image = "default_stick.png",
	tool_capabilities = {
		full_punch_interval = 1.4,
		damage_groups = {fleshy = 0, knockback = 11},
	},
})

--[[
minetest.override_item("default:mese", {
	on_walk_over = function(pos, node, player)
		print ("---", node.name, player:get_player_name() )
	end
})
]]
