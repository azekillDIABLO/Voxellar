pvp=minetest.setting_getbool("enable_pvp")
gamemodshot_user=""
gamemodshot_user_name=""
gamemod_shot_gamemod={}
gamemod_max_number=10

function gamemod_max(add)
	local c=0
	for i in pairs(gamemod_shot_gamemod) do
		c=c+1
		if gamemod_shot_gamemod[i]:getpos()==nil then
			table.remove(gamemod_shot_gamemod,c)
			c=c-1
		end
	end
	if c+1>gamemod_max_number  then return false end
	if add then
		table.insert(gamemod_shot_gamemod,add)
		return true
	end
	return true
end


minetest.register_craft({
	output = "gamemod:gamemod",
	recipe = {
		{"default:steel_ingot","","default:steel_ingot"},
		{"","default:steelblock",""},
		{"default:steel_ingot","","default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "gamemod:gamemod_mese",
	recipe = {
		{"default:mese_crystal","","default:mese_crystal"},
		{"","default:mese",""},
		{"default:mese_crystal","","default:mese_crystal"},
	}
})

minetest.register_craft({
	output = "gamemod:gamemod_wood",
	recipe = {
		{"default:stick","","default:stick"},
		{"","group:wood",""},
		{"default:stick","","default:stick"},
	}
})
function gamemod_drops(name)
	local d=minetest.registered_nodes[name].drop
	if d=="" or d==nil then return name end
	if d.items then
		if d.items[1].items and d.items[2] and d.items[2].items then
			return d.items[math.random(1,2)].items[1]
		end
		if d.items[1].items then
			return d.items[1].items[1]
		end
		return name
	end
	return d
end

------------------------------------------------------------------------------------------------------------

minetest.register_tool("gamemod:gamemod_mese", {
	description = "gamemod Mese",
	range = 1,
	inventory_image = "gamemod_gamemod_m.png",
on_use=function(itemstack, user, pointed_thing)
	if gamemod_max()==false then
		minetest.chat_send_player(user:get_player_name(), "Too many gamemods: (max " .. gamemod_max_number .. ")")
		return itemstack
	end
	local pos=user:getpos()
	for i, ob in pairs(minetest.get_objects_inside_radius(pos, 5)) do
		if ob:get_luaentity() and ob:get_luaentity().name=="gamemod:chakr_m" then
			return itemstack
		end
	end

	gamemodshot_user=user
	gamemodshot_user_name=user:get_player_name()
	local dir = user:get_look_dir()
	local veloc=15
	pos.y=pos.y+1.5
	local m=minetest.env:add_entity(pos, "gamemod:chakr_m")
	gamemod_max(m)
	m:setvelocity({x=dir.x*veloc, y=dir.y*veloc, z=dir.z*veloc})
	m:setyaw(user:get_look_yaw()+math.pi)
	itemstack:take_item()
	minetest.sound_play("gamemod_throw", {pos=pos, gain = 1.0, max_hear_distance = 5,})
	return itemstack
end,
})

minetest.register_entity("gamemod:chakr_m",{
	hp_max = 999,
	physical = false,
	weight = 0,
	visual="mesh",
	mesh="gamemod_gamemod.obj",
	visual_size = {x=1, y=1},
	textures = {"gamemod_gamemod_m.png","gamemod_gamemod_m.png","gamemod_gamemod_m.png","gamemod_gamemod_m.png","gamemod_gamemod_m.png","gamemod_gamemod_m.png"},
	colors = {}, 
	spritediv = {x=1, y=1},
	initial_sprite_basepos = {x=1, y=1},
	is_visible = true,
	makes_footstep_sound = false,
	automatic_rotate = math.pi * 4,
	timer = 0,
	timer2 = 0,
	timer3 = 0,
	stuck = 0,
	user={},
	user_name="",
	opos={x=0,y=0,z=0},
	gamemod_m=1,
	on_activate=function(self, staticdata)
		if gamemodshot_user_name=="" then
			minetest.add_item(self.object:getpos(), "gamemod:gamemod_mese")
			self.object:remove()
			return false
		end
		self.user=gamemodshot_user
		self.user_name=gamemodshot_user_name
		gamemodshot_user_name=""
		gamemodshot_user=""
	end,
	on_step = function(self, dtime)
		self.timer=self.timer+dtime
		if self.timer<0.05 then return self end
		self.timer3=self.timer3+self.timer

		if self.user==nil then
			self.timer3=10
			self.stuck=1
		end

		if self.timer3>=2 then
			if self.stuck==1 then 
				minetest.add_item(self.object:getpos(), "gamemod:gamemod_mese")
				if self.ob then self.ob:set_detach() self.ob:setacceleration({x=0,y=-8,z=0}) end
				self.object:set_hp(0)
				self.object:punch(self.object, {full_punch_interval=1.0,damage_groups={fleshy=10}}, "default:bronze_pick", nil)
				return
			else
				self.timer3=-4
				self.stuck=1
			end
		end
		self.timer=0
		self.timer2=self.timer2+dtime
		self.object:set_hp(999)
		local pos=self.object:getpos()

			local name=minetest.get_node(pos).name
			if name~="air" and (minetest.get_node_group(name, "snappy")>0 or minetest.get_node_group(name, "dig_immediate")>0 or minetest.get_node_group(name, "oddly_breakable_by_hand")>0 or minetest.get_node_group(name, "cracky")>0 ) and minetest.is_protected(pos,self.user:get_player_name())==false and string.find(name,"chest",1)==nil then 
				minetest.add_item(pos, gamemod_drops(name))
				minetest.set_node(pos, {name="air"})

			if name=="air" or minetest.get_node(self.opos).name=="air" then minetest.set_node(pos, {name="gamemod:light"}) end

			elseif minetest.registered_nodes[minetest.get_node(pos).name].walkable then
				self.timer3=-4
				self.stuck=1
			end

			for i, ob in pairs(minetest.get_objects_inside_radius(pos, 2)) do
				if ob:get_hp()<10 and (not ob:get_attach()) and ob:get_luaentity() and (not ob:get_luaentity().gamemod_m) then
					self.stuck=1
					self.ob=ob
					ob:set_attach(self.object, "", {x=0,y=0,z=0}, {x=0,y=0,z=0})
					self.timer3=-4
					break
				end

				if (not ob:get_attach()) and ((ob:get_luaentity() and (not ob:get_luaentity().itemstring) and (not ob:get_luaentity().gamemod_m)) or ((not ob:get_luaentity()) and ob:get_player_name()~=self.user_name and pvp)) then
					ob:set_hp(ob:get_hp()-10)
					ob:punch(self.user, {full_punch_interval=1.0,damage_groups={fleshy=10}}, "default:bronze_pick", nil)
					minetest.sound_play("gamemod_hard_punch", {pos=ob:getpos(), gain = 1.0, max_hear_distance = 5,})
				end
			end
		if self.stuck==1 then
			if self.user==nil or self.user:getpos()==nil  then
				self.timer3=10
				self.stuck=1
				return
			end
			local ta=self.user:getpos()
			ta.y=ta.y+1
			local vec = {x = pos.x - ta.x, y = pos.y - ta.y, z = pos.z - ta.z}
			local amount = (vec.x ^ 2 + vec.y ^ 2 + vec.z ^ 2) ^ 0.5
			local v = -15
			vec.x = vec.x * v / amount
			vec.y = vec.y * v / amount
			vec.z = vec.z * v / amount
			self.object:setvelocity(vec)

			for i, ob in pairs(minetest.get_objects_inside_radius(pos, 2)) do
				if (not ob:get_luaentity()) and ob:get_player_name()==self.user_name then

					if self.object==nil or self.user==nil or self.user:getpos()==nil  then
						self.timer3=10
						self.stuck=1
						return
					end

					if self.ob and self.ob:get_attach() and self.ob:get_hp()~=nil and self.ob:get_hp()>0 then
						self.ob:set_detach()
						self.ob:set_hp(0)
						self.ob:punch(self.user, {full_punch_interval=1.0,damage_groups={fleshy=10}}, "default:bronze_pick", nil)
					end
					if self.object:get_attach() then self.object:set_detach() return false end
					if self.ob and self.ob==nil then return false end
					self.user:get_inventory():add_item("main", ItemStack("gamemod:gamemod_mese"))
					self.object:set_hp(0)
					self.object:punch(self.object, {full_punch_interval=1.0,damage_groups={fleshy=10}}, "default:bronze_pick", nil)
					break
				end
			end
			for i, ob in pairs(minetest.get_objects_inside_radius(pos, 3)) do
				if ob:get_luaentity() and (not ob:get_attach()) and ob:get_luaentity().itemstring and ob:get_luaentity().itemstring~="gamemod:gamemod_mese" then
					ob:punch(self.user, {full_punch_interval=1.0,damage_groups={fleshy=10}}, "default:bronze_pick", nil)
				end
			end
		end
		self.opos=self.object:getpos()
	end,
})

minetest.register_abm({
	nodenames = {"gamemod:light"},
	interval = 2,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
	minetest.set_node(pos, {name="air"})
	end,
})

minetest.register_node("gamemod:light", {
	description = "Light",
	tiles = {"gamemod_light.png",},
	drop="",
	light_source = 10,
	paramtype = "light",
	alpha = 50,
	walkable=false,
	drawtype = "airlike",
	sunlight_propagates = false,
	pointable = false,
	buildable_to = true,
	groups = {not_in_creative_inventory=1},
can_dig = function(pos, player)
		return false
end,
})
------------------------------------------------------------------------------------------------------------
minetest.register_tool("gamemod:gamemod", {
	description = "gamemod",
	range = 1,
	inventory_image = "gamemod_gamemod.png",
on_use=function(itemstack, user, pointed_thing)

	if gamemod_max()==false then
		minetest.chat_send_player(user:get_player_name(), "Too many gamemods: (max " .. gamemod_max_number .. ")")
		return itemstack
	end


	local pos=user:getpos()
	for i, ob in pairs(minetest.get_objects_inside_radius(pos, 5)) do
		if ob:get_luaentity() and ob:get_luaentity().name=="gamemod:chakr" then
			return itemstack
		end
	end

	gamemodshot_user=user
	gamemodshot_user_name=user:get_player_name()
	local dir = user:get_look_dir()
	local veloc=15
	pos.y=pos.y+1.5
	local m=minetest.env:add_entity(pos, "gamemod:chakr")
	gamemod_max(m)
	m:setvelocity({x=dir.x*veloc, y=dir.y*veloc, z=dir.z*veloc})
	m:setyaw(user:get_look_yaw()+math.pi)
	itemstack:take_item()
	minetest.sound_play("gamemod_throw", {pos=pos, gain = 1.0, max_hear_distance = 5,})
	return itemstack
end,
})

minetest.register_entity("gamemod:chakr",{
	hp_max = 999,
	physical = false,
	weight = 0,
	visual="mesh",
	mesh="gamemod_gamemod.obj",
	visual_size = {x=1, y=1},
	textures = {"gamemod_gamemod.png","gamemod_gamemod.png","gamemod_gamemod.png","gamemod_gamemod.png","gamemod_gamemod.png","gamemod_gamemod.png"},
	colors = {}, 
	spritediv = {x=1, y=1},
	initial_sprite_basepos = {x=1, y=1},
	is_visible = true,
	makes_footstep_sound = false,
	automatic_rotate = math.pi * 4,
	timer = 0,
	timer2 = 0,
	timer3 = 0,
	stuck = 0,
	user={},
	user_name="",
	gamemod_s=1,
on_punch=function(self, puncher, time_from_last_punch, tool_capabilities, dir)
	if puncher:get_luaentity() or (puncher:get_player_name()~=self.user_name) then
		self.timer3=-2
		self.stuck=1
	end	
	end,
	on_activate=function(self, staticdata)
		if gamemodshot_user=="" then
			minetest.add_item(self.object:getpos(), "gamemod:gamemod")
			self.object:remove()
			return false
		end
		self.user=gamemodshot_user
		self.user_name=gamemodshot_user_name
		gamemodshot_user_name=""
		gamemodshot_user=""
	end,
	on_step = function(self, dtime)
		self.timer=self.timer+dtime
		if self.timer<0.05 then return self end
		self.timer3=self.timer3+self.timer

		if self.user==nil then
			self.timer3=10
			self.stuck=1
		end


		if self.timer3>=2 then
			if self.stuck==1 then 
				minetest.add_item(self.object:getpos(), "gamemod:gamemod")
				if self.ob then self.ob:set_detach() self.ob:setacceleration({x=0,y=-8,z=0}) end
				self.object:set_hp(0)
				self.object:punch(self.object, {full_punch_interval=1.0,damage_groups={fleshy=10}}, "default:bronze_pick", nil)
				return

			else
				self.timer3=-2
				self.stuck=1
			end
		end
		self.timer=0
		self.timer2=self.timer2+dtime
		self.object:set_hp(999)
		local pos=self.object:getpos()


			for i, ob in pairs(minetest.get_objects_inside_radius(pos, 2)) do
				if ob:get_hp()<10 and (not ob:get_attach()) and ob:get_luaentity() and (not ob:get_luaentity().gamemod_s) then
					self.stuck=1
					self.ob=ob
					ob:set_attach(self.object, "", {x=0,y=0,z=0}, {x=0,y=0,z=0})
					self.timer3=-2
					break
				end
				if self.stuck==0 then
					if (ob:get_luaentity() and (not ob:get_luaentity().gamemod_s) and (not ob:get_luaentity().itemstring) ) or ((not ob:get_luaentity()) and ob:get_player_name()~=self.user_name and pvp) then
						ob:set_hp(ob:get_hp()-5)
						ob:punch(self.user, {full_punch_interval=1.0,damage_groups={fleshy=10}}, "default:bronze_pick", nil)
						minetest.sound_play("gamemod_hard_punch", {pos=ob:getpos(), gain = 1.0, max_hear_distance = 5,})
					end
				end
			end

		if self.stuck==0 then
			local name=minetest.get_node(pos).name
			if name~="air" and (minetest.get_node_group(name, "snappy")>0 or minetest.get_node_group(name, "dig_immediate")>0 or minetest.get_node_group(name, "oddly_breakable_by_hand")>0) and minetest.is_protected(pos,self.user:get_player_name())==false and string.find(name,"chest",1)==nil then 
				minetest.add_item(pos, gamemod_drops(name))
				minetest.set_node(pos, {name="air"})
			elseif minetest.registered_nodes[name].walkable then
				self.timer3=-2
				self.stuck=1
			end

		else

			if self.user==nil or self.user:getpos()==nil then
				self.timer3=10
				self.stuck=1
				return
			end


			local ta=self.user:getpos()
			ta.y=ta.y+1
			local vec = {x = pos.x - ta.x, y = pos.y - ta.y, z = pos.z - ta.z}
			local amount = (vec.x ^ 2 + vec.y ^ 2 + vec.z ^ 2) ^ 0.5
			local v = -15
			vec.x = vec.x * v / amount
			vec.y = vec.y * v / amount
			vec.z = vec.z * v / amount
			self.object:setvelocity(vec)

			for i, ob in pairs(minetest.get_objects_inside_radius(pos, 2)) do
				if (not ob:get_attach()) and ((ob:get_luaentity() and (not ob:get_luaentity().itemstring) and (not ob:get_luaentity().gamemod_s)) or ((not ob:get_luaentity()) and ob:get_player_name()~=self.user_name and pvp)) then
					ob:set_hp(ob:get_hp()-15)
					ob:punch(self.user, {full_punch_interval=1.0,damage_groups={fleshy=10}}, "default:bronze_pick", nil)
					minetest.sound_play("gamemod_hard_punch", {pos=ob:getpos(), gain = 1.0, max_hear_distance = 5,})
				end


				if (not ob:get_luaentity()) and ob:get_player_name()==self.user_name then

					if self.user==nil or self.user:getpos()==nil  then
						self.timer3=10
						self.stuck=1
						return
					end

					if self.ob and self.ob:get_attach() and self.ob:get_hp()>0 then
						self.ob:set_detach()
						self.ob:set_hp(0)
						self.ob:punch(self.user, {full_punch_interval=1.0,damage_groups={fleshy=10}}, "default:bronze_pick", nil)
					end
					if self.object:get_attach() then self.object:set_detach() return false end
					self.user:get_inventory():add_item("main", ItemStack("gamemod:gamemod"))
					self.object:set_hp(0)
					self.object:punch(self.object, {full_punch_interval=1.0,damage_groups={fleshy=10}}, "default:bronze_pick", nil)
				end
			end
			for i, ob in pairs(minetest.get_objects_inside_radius(pos, 3)) do
				if ob:get_luaentity() and (not ob:get_attach()) and ob:get_luaentity().itemstring and ob:get_luaentity().itemstring~="gamemod:gamemod" then
					ob:punch(self.user, {full_punch_interval=1.0,damage_groups={fleshy=10}}, "default:bronze_pick", nil)
				end
			end



		end
	end,
})
------------------------------------------------------------------------------------------------------------
minetest.register_tool("gamemod:gamemod_wood", {
	description = "Wooden gamemod",
	range = 1,
	inventory_image = "gamemod_gamemod_w.png",
on_use=function(itemstack, user, pointed_thing)
	if gamemod_max()==false then
		minetest.chat_send_player(user:get_player_name(), "Too many gamemods: (max " .. gamemod_max_number .. ")")
		return itemstack
	end
	local pos=user:getpos()
	for i, ob in pairs(minetest.get_objects_inside_radius(pos, 5)) do
		if ob:get_luaentity() and ob:get_luaentity().name=="gamemod:gamemodr_w" then
			return itemstack
		end
	end

	gamemodshot_user=user
	gamemodshot_user_name=user:get_player_name()
	local dir = user:get_look_dir()
	local veloc=15
	pos.y=pos.y+1.5
	local m=minetest.env:add_entity(pos, "gamemod:chakr_w")
	gamemod_max(m)
	m:setvelocity({x=dir.x*veloc, y=dir.y*veloc, z=dir.z*veloc})
	m:setyaw(user:get_look_yaw()+math.pi)
	itemstack:take_item()
	minetest.sound_play("gamemod_throw", {pos=pos, gain = 1.0, max_hear_distance = 5,})
	return itemstack
end,
})

minetest.register_entity("gamemod:chakr_w",{
	hp_max = 999,
	physical = false,
	weight = 0,
	visual="mesh",
	mesh="gamemod_gamemod.obj",
	visual_size = {x=1, y=1},
	textures = {"gamemod_gamemod_w.png","gamemod_gamemod_w.png","gamemod_gamemod_w.png","gamemod_gamemod_w.png","gamemod_gamemod_w.png","gamemod_gamemod_w.png"},
	colors = {}, 
	spritediv = {x=1, y=1},
	initial_sprite_basepos = {x=1, y=1},
	is_visible = true,
	makes_footstep_sound = false,
	automatic_rotate = math.pi * 4,
	timer = 0,
	timer2 = 0,
	timer3 = 0,
	stuck = 0,
	user={},
	user_name="",
	opos={x=0,z=0,y=0},
	gamemod_w=1,
on_punch=function(self, puncher, time_from_last_punch, tool_capabilities, dir)
	if puncher:get_luaentity() or (puncher:get_player_name()~=self.user_name) then
		minetest.add_item(self.object:getpos(), "gamemod:gamemod_wood")
		self.object:remove()
	end	
	end,
	on_activate=function(self, staticdata)
		if gamemodshot_user_name=="" then
			minetest.add_item(self.object:getpos(), "gamemod:gamemod_wood")
			self.object:remove()
			return false
		end
		self.user=gamemodshot_user
		self.user_name=gamemodshot_user_name
		gamemodshot_user_name=""
		gamemodshot_user=""
	end,
	on_step = function(self, dtime)
		self.timer=self.timer+dtime
		if self.timer<0.05 then return self end
		self.timer3=self.timer3+self.timer

		if self.user==nil then
			self.timer3=10
			self.stuck=1
		end


		if self.timer3>=2 then
			if self.stuck==1 then 
				minetest.add_item(self.object:getpos(), "gamemod:gamemod_wood")
				self.object:remove()
				return
			else
				self.timer3=-2
				self.stuck=1
			end
		end
		self.timer=0
		self.timer2=self.timer2+dtime
		self.object:set_hp(999)
		local pos=self.object:getpos()

			local name=minetest.get_node(pos).name
			if name~="air" and (minetest.get_node_group(name, "snappy")>0 or minetest.get_node_group(name, "dig_immediate")>0) and minetest.is_protected(pos,self.user:get_player_name())==false then
					minetest.add_item(pos, gamemod_drops(name))
					minetest.set_node(pos, {name="air"})
			elseif minetest.registered_nodes[minetest.get_node(pos).name].walkable then
				minetest.add_item(self.opos, "gamemod:gamemod_wood")
				self.object:remove()
				return false
			end
			for i, ob in pairs(minetest.get_objects_inside_radius(pos, 2)) do
				if (not ob:get_attach()) and (ob:get_luaentity() and (not ob:get_luaentity().gamemod_w) and (not ob:get_luaentity().itemstring)) or ((not ob:get_luaentity()) and ob:get_player_name()~=self.user_name and pvp) then
					ob:set_hp(ob:get_hp()-2)
					ob:punch(self.user, {full_punch_interval=1.0,damage_groups={fleshy=10}}, "default:bronze_pick", nil)
					minetest.sound_play("gamemod_hard_punch", {pos=ob:getpos(), gain = 1.0, max_hear_distance = 5,})
				end
			end
	if self.stuck==0 then
		else
			if self.user==nil or self.user:getpos()==nil then
				self.timer3=10
				self.stuck=1
				return
			end
			local ta=self.user:getpos()
			ta.y=ta.y+1
			local vec = {x = pos.x - ta.x, y = pos.y - ta.y, z = pos.z - ta.z}
			local amount = (vec.x ^ 2 + vec.y ^ 2 + vec.z ^ 2) ^ 0.5
			local v = -15
			vec.x = vec.x * v / amount
			vec.y = vec.y * v / amount
			vec.z = vec.z * v / amount
			self.object:setvelocity(vec)

			for i, ob in pairs(minetest.get_objects_inside_radius(pos, 2)) do
				if (not ob:get_luaentity()) and ob:get_player_name()==self.user_name then

					if self.object==nil or self.user==nil or self.user:getpos()==nil  then
						self.timer3=10
						self.stuck=1
						return
					end

					if self.object:get_attach() then self.object:set_detach() return false end
					self.user:get_inventory():add_item("main", ItemStack("gamemod:gamemod_wood"))
					self.object:remove()
				end
			end
		end
	self.opos=pos
	end,
})
