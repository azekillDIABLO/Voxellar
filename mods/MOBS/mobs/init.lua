local path = minetest.get_modpath("mobs")

-- Mob Api

dofile(path.."/api.lua")

-- Animals

dofile(path.."/chicken.lua") -- JKmurray
dofile(path.."/cow.lua") -- KrupnoPavel
dofile(path.."/rat.lua") -- PilzAdam
dofile(path.."/sheep.lua") -- PilzAdam

-- Monsters

dofile(path.."/treemonster.lua")
dofile(path.."/lava_flan.lua") -- Zeg9
dofile(path.."/mese_monster.lua")
dofile(path.."/spider.lua") -- AspireMint


-- Mob Items
dofile(path.."/crafts.lua")

print ("[MOD] Mobs Redo loaded")

--------the Horror Mobs!------by dOOmed


--arrows
mobs:register_arrow("mobs:fireball", {
   visual = "sprite",
   visual_size = {x = 0.5, y = 0.5},
   textures = {"horror_fireball.png"},
   velocity = 8,
   tail = 1, -- enable tail
   tail_texture = "horror_steam.png",

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 7},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 7},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      self.object:remove()
   end,
})

mobs:register_arrow("mobs:fireball_2", {
   visual = "sprite",
   visual_size = {x = 1, y = 1},
   textures = {"horror_fireshot.png"},
   velocity = 8,
   tail = 0, -- enable tail
   tail_texture = "horror_steam.png",

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 5},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 5},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      self.object:remove()
   end,
})

mobs:register_arrow("mobs:fireball_3", {
   visual = "sprite",
   visual_size = {x = 1, y = 1},
   textures = {"horror_fireshot.png"},
   velocity = 3,
   tail = 1, -- enable tail
   tail_texture = "horror_flame2.png",

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 5},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 5},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      mobs:explosion(pos, 1, 1, 1)
   end,
})

mobs:register_arrow("mobs:fireball_4", {
   visual = "sprite",
   visual_size = {x = 1, y = 1},
   textures = {"horror_plasma.png"},
   velocity = 6,
   tail = 0, -- enable tail
   tail_texture = "horror_steam.png",

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 6},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 6},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      self.object:remove()
   end,
})

mobs:register_arrow("mobs:rocket", {
   visual = "sprite",
   visual_size = {x = 0.5, y = 0.5},
   textures = {"horror_rocket.png"},
   velocity = 8,
   tail = 1, -- enable tail
   tail_texture = "horror_rocket_smoke.png",

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 8},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 8},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      mobs:explosion(pos, 2, 1, 1)
   end,
})

mobs:register_mob("mobs:ghost", {
	type = "monster",
	passive = false,
	reach = 1,
	damage = 12,
	attack_type = "dogfight",
	hp_min = 32,
	hp_max = 42,
	armor = 130,
	collisionbox = {-0.4, 0, -0.5, 0.5, 1.5, 0.5},
	visual = "mesh",
	mesh = "ghost.b3d",
	textures = {
		{"horror_ghost.png"},
	},
   blood_amount = 60,
	blood_texture = "horror_blood_effect.png",
	visual_size = {x=4, y=4.6},
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 2.1,
	sounds = {
		random = "mobs_oerkki",
		attack = "mobs_oerkki",
	},
	jump = true,
	drops = {
		{name = "farming:cotton", chance = 10, min = 1, max = 1},
	},
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	view_range = 5,
	animation = {
		speed_normal = 10,
		speed_run = 15,
		walk_start = 1,
		walk_end = 20,
		run_start = 30,
		run_end = 50,
		stand_start = 1,
		stand_end = 2,
		punch_start = 50,
		punch_end = 70,

	},
})

mobs:register_spawn("mobs:ghost", {"default:snowblock","default:ice","default:stone"}, 20, 10, 15000, -31000, 31000)

mobs:register_egg("mobs:ghost", "Ghost", "default_snow.png", 1)

mobs:register_mob("mobs:cyberdemon", {
	type = "monster",
	passive = false,
	reach = 3,
	damage = 15,
	attack_type = "shoot",
   shoot_interval = 2,
   arrow = "mobs:rocket",
   shoot_offset = -1,
	hp_min = 102,
	hp_max = 112,
	armor = 130,
	collisionbox = {-0.7, 0, -0.7, 0.7, 6.5, 0.7},
	visual = "mesh",
	mesh = "cyberdemon.b3d",
	textures = {
		{"horror_cyberdemon.png"},
	},
   blood_amount = 90,
	blood_texture = "horror_blood_effect.png",
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2.1,
	sounds = {
		random = "mobs_stone_monster",
		attack = "mobs_stone_monster",
	},
	jump = true,
	drops = {
		{name = "default:mese", chance = 1, min = 1, max = 1},
		{name = "mobs:meat_raw", chance = 1, min = 3, max = 5},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	view_range = 15,
	animation = {
		speed_normal = 10,
		speed_run = 15,
		walk_start = 20,
		walk_end = 40,
		run_start = 20,
		run_end = 40,
		stand_start = 64,
		stand_end = 80,
		shoot_start = 1,
		shoot_end = 15,

	},
})

mobs:register_spawn("mobs:cyberdemon", {"underworlds:black_sand","underworlds:hot_brass"}, 20, 10, 35000, -31000, 31000)

mobs:register_egg("mobs:cyberdemon", "Cyberdemon", "wool_red.png", 1)


mobs:register_mob("mobs:dragon", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 13,
   reach = 3,
   attack_type = "dogshoot",
   shoot_interval = 3.5,
   arrow = "mobs:fireball",
   shoot_offset = 1,
   hp_min = 50,
   hp_max = 85,
   armor = 90,
   collisionbox = {-0.6, -0.9, -0.6, 0.6, 0.6, 0.6},
   visual = "mesh",
   mesh = "dragon_new.b3d",
   textures = {
      {"horror_dragon.png"},
   },
   blood_amount = 90,
   blood_texture = "horror_blood_effect.png",
   visual_size = {x=3, y=3},
   makes_footstep_sound = true,
   sounds = {
      shoot_attack = "mobs_fireball",
   },
   walk_velocity = 3,
   run_velocity = 5,
   jump = true,
   fly = true,
   drops = {
      {name = "mobs:lava_orb", chance = 2, min = 1, max = 3},
      {name = "default:diamond", chance = 2, min = 1, max = 3},
   },
   fall_speed = 0,
   stepheight = 10,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 1,
      walk_end = 22,
      stand_start = 1,
      stand_end = 22,
      run_start = 1,
      run_end = 22,
      punch_start = 22,
      punch_end = 47,
   },
})

mobs:register_spawn("mobs:dragon", {"underworlds:polluted_dirt",}, 20, 10, 35000, -31000, 31000)
   
mobs:register_egg("mobs:dragon", "Zombie Dragon", "horror_orb.png", 1)


mobs:register_mob("mobs:skull", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 10,
   reach = 2,
   attack_type = "dogfight",
   shoot_interval = 2.5,
   arrow = "mobs:fireball",
   shoot_offset = 1,
   hp_min = 30,
   hp_max = 45,
   armor = 80,
   collisionbox = {-0.4, -0.1, -0.4, 0.4, 1.5, 0.4},
   visual = "mesh",
   mesh = "lost_soul.b3d",
   textures = {
      {"lost_soul.png"},
   },
   blood_texture = "horror_flame2.png",
   visual_size = {x=3, y=3},
   makes_footstep_sound = true,
   walk_velocity = 3,
   run_velocity = 5,
   jump = true,
   fly = true,
   do_custom = function(self)
   local apos = self.object:getpos()
		local part = minetest.add_particlespawner(
			12, --amount
			0.3, --time
			{x=apos.x-0.3, y=apos.y+0.6, z=apos.z-0.3}, --minpos
			{x=apos.x+0.3, y=apos.y+0.6, z=apos.z+0.3}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=1.5,z=0}, --minacc
			{x=0.5,y=1.5,z=0.5}, --maxacc
			1, --minexptime
			2, --maxexptime
			3, --minsize
			5, --maxsize
			false, --collisiondetection
			"horror_flame3.png" --texture
		)
   end,
   fall_speed = 0,
   stepheight = 10,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 20,
      walk_end = 40,
      stand_start = 1,
      stand_end = 20,
      run_start = 20,
      run_end = 40,
      punch_start = 40,
      punch_end = 65,
   },
})

mobs:register_spawn("mobs:skull", {"fire:basic_flame","default:lava_source","underworlds:polluted_dirt"}, 20, 10, 15000, -31000, 31000)
   
mobs:register_egg("mobs:skull", "Lost Soul", "horror_gfire_inv.png", 1)

mobs:register_mob("mobs:cacodemon", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 16,
   reach = 3,
   attack_type = "shoot",
   shoot_interval = 3,
   arrow = "mobs:fireball_4",
   shoot_offset = 1,
   hp_min = 30,
   hp_max = 45,
   armor = 80,
   collisionbox = {-0.9, -0.2, -0.9, 0.9, 1.5, 0.9},
   visual = "mesh",
   mesh = "cacodemon.b3d",
   textures = {
      {"horror_cacodemon.png"},
   },
   blood_amount = 80,
   blood_texture = "horror_plasma.png",
   visual_size = {x=3, y=3},
   makes_footstep_sound = true,
   walk_velocity = 3,
   run_velocity = 5,
   jump = true,
   fly = true,
   fall_speed = 0,
   stepheight = 10,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 1,
      walk_end = 20,
      stand_start = 1,
      stand_end = 20,
      run_start = 1,
      run_end = 20,
      shoot_start = 20,
      shoot_end = 40,
   },
})

mobs:register_spawn("mobs:cacodemon", {"fire:basic_flame","underworlds:hot_cobble","default:lava_flowing"}, 20, 10, 15000, 2, 31000)
   
mobs:register_egg("mobs:cacodemon", "Cacodemon", "wool_red.png", 1)

mobs:register_mob("mobs:mogall", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 4,
   reach = 10,
   attack_type = "dogfight",
   shoot_interval = 2.5,
   arrow = "mobs:fireball",
   shoot_offset = 1,
   hp_min = 30,
   hp_max = 45,
   armor = 80,
   collisionbox = {-0.3, -0, -0.3, 0.3, 1, 0.3},
   visual = "mesh",
   mesh = "mogall.b3d",
   textures = {
      {"mogall.png"},
   },
   blood_amount = 80,
   blood_texture = "horror_blood_effect.png",
   visual_size = {x=4, y=4},
   makes_footstep_sound = true,
   walk_velocity = 1,
   run_velocity = 2,
   jump = true,
   fly = true,
   fall_speed = 0,
   stepheight = 1.5,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 30,
   animation = {
      speed_normal = 5,
      speed_run = 6,
      walk_start = 20,
      walk_end = 60,
      stand_start = 1,
      stand_end = 20,
      run_start = 20,
      run_end = 60,
      punch_start = 20,
      punch_end = 60,
   },
})

mobs:register_spawn("mobs:mogall", {"default:jungleleaves","default:dirt"}, 20, 10, 15000, 2, 31000)
   
mobs:register_egg("mobs:mogall", "Mogall", "horror_stone.png", 1)

mobs:register_mob("mobs:shadow", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 8,
   reach = 3,
   attack_type = "dogfight",
   shoot_interval = 2.5,
   arrow = "mobs:fireball",
   shoot_offset = 1,
   hp_min = 30,
   hp_max = 45,
   armor = 100,
   collisionbox = {-0.3, -0, -0.3, 0.3, 1, 0.3},
   visual = "mesh",
   mesh = "shadow.b3d",
   textures = {
      {"blank.png"},
   },
   blood_amount = 60,
   blood_texture = "horror_shadow.png",
   visual_size = {x=4, y=4},
   makes_footstep_sound = true,
   walk_velocity = 1,
   run_velocity = 2,
   jump = true,
   fly = true,
   fall_speed = 0,
   stepheight = 1.5,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 30,
   do_custom = function(self)
   local apos = self.object:getpos()
		local part = minetest.add_particlespawner(
			1, --amount
			0.3, --time
			{x=apos.x-0.3, y=apos.y+0.3, z=apos.z-0.3}, --minpos
			{x=apos.x+0.3, y=apos.y+0.3, z=apos.z+0.3}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=1,z=0}, --minacc
			{x=0.5,y=1.2,z=0.5}, --maxacc
			3, --minexptime
			5, --maxexptime
			2, --minsize
			3, --maxsize
			false, --collisiondetection
			"horror_shadow.png" --texture
		)
   end,
   animation = {
      speed_normal = 5,
      speed_run = 6,
      walk_start = 2,
      walk_end = 19,
      stand_start = 2,
      stand_end = 19,
      run_start = 2,
      run_end = 19,
      punch_start = 2,
      punch_end = 19,
   },
})

mobs:register_spawn("mobs:shadow", {"underworlds:black_sand", "underworlds:polluted_dirt"}, 20, 10, 15000, 2, -110)
   
mobs:register_egg("mobs:shadow", "Shadow elemental", "default_obsidian.png", 1)


mobs:register_mob("mobs:mothman", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 2,
   reach = 3,
   attack_type = "dogfight",
   hp_min = 30,
   hp_max = 45,
   armor = 80,
   collisionbox = {-0.3, -0.3, -0.3, 0.3, 0.3, 0.3},
   visual = "mesh",
   mesh = "mothman.b3d",
   textures = {
      {"mothman.png"},
   },
   blood_amount = 60,
   blood_texture = "horror_blood_effect.png",
   visual_size = {x=3, y=3},
   makes_footstep_sound = true,
   walk_velocity = 3,
   run_velocity = 8,
   jump = true,
   fly = true,
   do_custom = function(self)
   local apos = self.object:getpos()
		local part = minetest.add_particlespawner(
			1, --amount
			0.3, --time
			{x=apos.x-0.3, y=apos.y-0.3, z=apos.z-0.3}, --minpos
			{x=apos.x+0.3, y=apos.y-0.3, z=apos.z+0.3}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=-1,z=0}, --minacc
			{x=0.5,y=-1,z=0.5}, --maxacc
			3, --minexptime
			5, --maxexptime
			3, --minsize
			5, --maxsize
			false, --collisiondetection
			"horror_dust.png" --texture
		)
   end,
   fall_speed = 0,
   stepheight = 5,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 20,
      speed_run = 33,
      walk_start = 1,
      walk_end = 11,
      stand_start = 1,
      stand_end = 11,
      run_start = 1,
      run_end = 11,
      punch_start = 1,
      punch_end = 11,
   },
})

mobs:register_spawn("mobs:mothman", {"default:dirt_with_grass"}, 20, 10, 15000, 2, 31000)
   
mobs:register_egg("mobs:mothman", "Mothman", "horror_orb.png", 1)


mobs:register_mob("mobs:manticore", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 4,
   reach = 3,
   attack_type = "dogfight",
   hp_min = 30,
   hp_max = 45,
   armor = 130,
   collisionbox = {-0.5, -0.5, -0.6, 0.6, 0.6, 0.6},
   visual = "mesh",
   mesh = "manticore.b3d",
   textures = {
      {"manticore.png"},
   },
   blood_amount = 80,
   blood_texture = "horror_blood_effect.png",
   visual_size = {x=3, y=3},
   makes_footstep_sound = true,
   walk_velocity = 2.5,
   run_velocity = 3.5,
   jump = true,
   drops = {
      {name = "mobs:cockroach", chance = 1, min = 1, max = 1},
   },
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 1,
      walk_end = 11,
      stand_start = 1,
      stand_end = 11,
      run_start = 1,
      run_end = 11,
      punch_start = 11,
      punch_end = 26,
   },
})

mobs:register_spawn("mobs:manticore", {"default:dirt_with_grass","default:mossycobble"}, 20, 10, 15000, 2, 31000)
   
mobs:register_egg("mobs:manticore", "Manticore", "default_dirt.png", 1)


mobs:register_mob("mobs:imp", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 10,
   reach = 4,
   attack_type = "dogshoot",
   shoot_interval = 2.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
   arrow = "mobs:fireball_2",
   shoot_offset = 0.5,
   hp_min = 40,
   hp_max = 55,
   armor = 80,
   collisionbox = {-0.5, 0, -0.6, 0.6, 3, 0.6},
   visual = "mesh",
   mesh = "imp.b3d",
   textures = {
      {"horror_imp.png"},
   },
   blood_amount = 80,
   blood_texture = "horror_blood_effect.png",
   visual_size = {x=2, y=2},
   makes_footstep_sound = true,
   walk_velocity = 2.5,
   run_velocity = 3.5,
   jump = true,
   drops = {
      {name = "default:coal_lump", chance = 1, min = 1, max = 2},
   },
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 35,
      walk_end = 55,
      stand_start = 1,
      stand_end = 30,
      run_start = 35,
      run_end = 55,
      punch_start = 60,
      punch_end = 80,
	  shoot_start = 80,
	  shoot_end = 100,
   },
})

mobs:register_spawn("mobs:imp", {"default:dirt","underworlds:hot_cobble","default:gravel"}, 20, 10, 15000, 2, -110)
   
mobs:register_egg("mobs:imp", "Imp", "default_dirt.png", 1)

mobs:register_mob("mobs:werewolf", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 8,
   reach = 2,
   attack_type = "dogfight",
   shoot_interval = 2.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
   arrow = "mobs:fireball_2",
   shoot_offset = 0.5,
   hp_min = 10,
   hp_max = 25,
   armor = 100,
   collisionbox = {-0.5, 0, -0.6, 0.6, 2, 0.6},
   visual = "mesh",
   mesh = "werewolf.b3d",
   textures = {
      {"horror_werewolf.png"},
   },
   blood_amount = 80,
   blood_texture = "horror_blood_effect.png",
   visual_size = {x=2, y=2},
   makes_footstep_sound = true,
   walk_velocity = 1,
   run_velocity = 8,
   jump = true,
   drops = {
      {name = "default:papyrus", chance = 1, min = 1, max = 6},
   },
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 45,
      walk_end = 65,
      stand_start = 1,
      stand_end = 20,
      run_start = 66,
      run_end = 86,
      punch_start = 20,
      punch_end = 44,
   },
})

mobs:register_spawn("mobs:werewolf", {"default:dirt_with_grass","default:gravel"}, 20, 10, 35000, 2, 31000)
   
mobs:register_egg("mobs:werewolf", "Werewolf", "default_gravel.png", 1)

mobs:register_mob("mobs:mancubus", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 9,
   reach = 2,
   attack_type = "shoot",
   shoot_interval = 1,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
   arrow = "mobs:fireball_3",
   shoot_offset = 0.5,
   hp_min = 50,
   hp_max = 65,
   armor = 100,
   collisionbox = {-0.8, 0, -0.8, 0.8, 3, 0.8},
   visual = "mesh",
   mesh = "mancubus.b3d",
   textures = {
      {"mancubus.png"},
   },
   blood_amount = 80,
   blood_texture = "horror_blood_effect.png",
   visual_size = {x=2, y=2},
   makes_footstep_sound = true,
   walk_velocity = 0.5,
   run_velocity = 1,
   jump = true,
   drops = {
      {name = "mobs:meat_raw", chance = 1, min = 1, max = 2},
   },
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 20,
      walk_end = 40,
      stand_start = 45,
      stand_end = 65,
      run_start = 20,
      run_end = 40,
	  shoot_start = 1,
	  shoot_end = 15,
   },
})

mobs:register_spawn("mobs:mancubus", {"default:stone","underworlds:hot_cobble","underworlds:hot_brass","default:sand"}, 20, 10, 15000, 2, 31)
   
mobs:register_egg("mobs:mancubus", "Mancubus", "default_sand.png", 1)

mobs:register_mob("mobs:birdie", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 4,
   reach = 3,
   attack_type = "dogfight",
   hp_min = 30,
   hp_max = 45,
   armor = 100,
   collisionbox = {-0.5, -0, -0.6, 0.6, 1.6, 0.6},
   visual = "mesh",
   mesh = "birdie.b3d",
   textures = {
      {"birdie.png"},
   },
   blood_amount = 80,
   blood_texture = "horror_blood_effect.png",
   visual_size = {x=3, y=3},
   makes_footstep_sound = true,
   walk_velocity = 1,
   run_velocity = 2,
   jump = true,
   drops = {
      {name = "mobs:meat_raw", chance = 1, min = 1, max = 2},
   },
   water_damage = 0,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 42,
      walk_end = 62,
      stand_start = 1,
      stand_end = 11,
      run_start = 42,
      run_end = 62,
      punch_start = 20,
      punch_end = 35,
   },
})

mobs:register_spawn("mobs:birdie", {"default:dirt_with_grass","default:dirt_with_dry_grass"}, 20, 10, 15000, 2, 31000)
   
mobs:register_egg("mobs:birdie", "Birdie", "default_dirt.png", 1)

mobs:register_mob("mobs:pinky", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 8,
   reach = 4,
   attack_type = "dogfight",
   hp_min = 100,
   hp_max = 185,
   armor = 80,
   collisionbox = {-0.8, -0, -0.8, 0.8, 1.9, 0.8},
   visual = "mesh",
   mesh = "pinky.b3d",
   textures = {
      {"pinky.png"},
   },
   blood_amount = 80,
   blood_texture = "horror_blood_effect.png",
   visual_size = {x=3, y=3},
   makes_footstep_sound = true,
   walk_velocity = 2,
   run_velocity = 6,
   jump = true,
   drops = {
      {name = "mobs:flesh", chance = 1, min = 1, max = 1},
   },
   water_damage = 0,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 20,
      speed_run = 30,
      walk_start = 1,
      walk_end = 20,
      stand_start = 20,
      stand_end = 40,
      run_start = 1,
      run_end = 20,
      punch_start = 40,
      punch_end = 60,
   },
})

mobs:register_spawn("mobs:pinky", {"default:sand","underworlds:polluted_dirt"}, 20, 10, 15000, 2, 31000)
   
mobs:register_egg("mobs:pinky", "Pinky", "horror_flesh.png", 1)

mobs:register_mob("mobs:demon", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 8,
   reach = 2,
   attack_type = "dogfight",
   hp_min = 30,
   hp_max = 45,
   armor = 100,
   collisionbox = {-0.4, -0.5, -0.6, 0.6, 3, 0.6},
   visual = "mesh",
   mesh = "demon.b3d",
   textures = {
      {"demon.png"},
   },
   blood_amount = 80,
   blood_texture = "horror_blood_effect.png",
   visual_size = {x=3.5, y=3},
   makes_footstep_sound = true,
   walk_velocity = 2,
   run_velocity = 3,
   jump = true,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
	replace_rate = 5,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "air"},
	replace_with = "mobs:gfire",
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 1,
      walk_end = 20,
      stand_start = 39,
      stand_end = 50,
      run_start = 1,
      run_end = 20,
      punch_start = 21,
      punch_end = 38,
   },
})

mobs:register_spawn("mobs:demon", {"fire:basic_flame","default:lava_source"}, 20, 10, 15000, 2, 31000)
   
mobs:register_egg("mobs:demon", "Demon", "default_dirt.png", 1)

mobs:register_mob("mobs:armour", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 18,
   reach = 2,
   attack_type = "dogfight",
   hp_min = 30,
   hp_max = 45,
   armor = 200,
   collisionbox = {-0.3, -1, -0.3, 0.3, 1, 0.3},
   visual = "mesh",
   mesh = "armour.b3d",
   textures = {
      {"armour.png"},
   },
   blood_texture = "horror_blood_effect.png",
   visual_size = {x=2, y=2},
   makes_footstep_sound = true,
   walk_velocity = 0.5,
   run_velocity = 1,
   jump = true,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 17,
      speed_run = 20,
      walk_start = 22,
      walk_end = 62,
      stand_start = 1,
      stand_end = 1,
      run_start = 21,
      run_end = 62,
      punch_start = 1,
      punch_end = 21,
   },
})

mobs:register_spawn("mobs:armour", {"underworlds:hot_brass"}, 20, 10, 15000, 2, 31000)
   
mobs:register_egg("mobs:armour", "Axe Armour", "default_stone.png", 1)

mobs:register_mob("mobs:sam", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 3,
   reach = 1,
   attack_type = "dogfight",
   hp_min = 30,
   hp_max = 45,
   armor = 80,
   collisionbox = {-0.25, 0.35, -0.25, 0.25, 0.9, 0.25},
   physical = false,
   visual = "mesh",
   mesh = "character.b3d",
   textures = {
      {"horror_sam.png"},
   },
   blood_amount = 60,
   blood_texture = "horror_blood_effect.png",
   visual_size = {x=1, y=1},
   makes_footstep_sound = false,
   walk_velocity = 0.01,
   run_velocity = 5,
   jump = false,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 1,
      speed_run = 1,
      walk_start = 1,
      walk_end = 1,
      stand_start = 1,
      stand_end = 1,
      run_start = 1,
      run_end = 1,
      punch_start = 1,
      punch_end = 1,
   },
})

mobs:register_spawn("mobs:sam", {"default:stone","default:dirt_with_grass"}, 20, 10, 15000, 2, 31000)
   
mobs:register_egg("mobs:sam", "Sam Head", "default_brick.png", 1)
-------H-o-r-r-o-r nodes (because of the abm can't be replaced with normal nodes; needs to be those one)

minetest.register_node("mobs:fire", {
	description = "decorative fire",
	drawtype = "plantlike",
	sunlight_propagates = true,
	paramtype = "light",
	light_source = 40,
	walkable = false,
	damage_per_second = 2,
	tiles = {{
		name = "horror_fire.png",
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 1.00},
	}}
,
	inventory_image = "horror_fire_inv.png",
	wield_image = "horror_fire_inv.png",
	groups = {crumbly=1},
})

minetest.register_node("mobs:gfire", {
	description = "decorative green fire",
	drawtype = "plantlike",
	sunlight_propagates = true,
	paramtype = "light",
	light_source = 30,
	walkable = false,
	damage_per_second = 2,
	tiles = {{
		name = "horror_gfire.png",
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 1.00},
	}}
,
	inventory_image = "horror_gfire_inv.png",
	wield_image = "horror_gfire_inv.png",
	groups = {crumbly=1, leafdecay=1, not_in_creative_inventory=1},
})

minetest.register_abm({
	nodenames = {"mobs:gfire"},
	interval = 5,
	chance = 1,
	action = function(pos)
		minetest.remove_node(pos)
	end
})

minetest.register_abm({
	nodenames = {"mobs:fire"},
	interval = 1,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner({
			amount = 30,
			time = 4,
			minpos = {x=pos.x-0.5, y=pos.y, z=pos.z-0.5},
			maxpos = {x=pos.x+0.5, y=pos.y+1, z=pos.z+0.5},
			minvel = {x=-0.1, y=0.5, z=-0.1},
			maxvel = {x=0.1, y=0.5, z=0.1},
			minacc = {x=0, y=0, z=0},
			maxacc = {x=0, y=0, z=0},
			minexptime = 0.5,
			maxexptime = 0.5,
			minsize = 0.1,
			maxsize = 0.5,
			collisiondetection = false,
			texture = "horror_smoke.png"
		})
	end
})