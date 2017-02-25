

-- dmobs by D00Med

--mounts api

dofile(minetest.get_modpath("dmobs").."/api.lua")

--enable dragons(disable to remove tamed dragons and dragon bosses)
local dragons = true

mobs:register_mob("dmobs:panda", {
	type = "animal",
	passive = false,
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 12,
	hp_max = 22,
	armor = 130,
	collisionbox = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
	visual = "mesh",
	mesh = "panda.b3d",
	textures = {
		{"dmobs_panda.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	replace_rate = 10,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "ethereal:bamboo"},
	replace_with = "air",
	follow = {"default:papyrus"},
	view_range = 14,
	animation = {
		speed_normal = 6,
		speed_run = 10,
		walk_start = 25,
		walk_end = 45,
		stand_start = 10,
		stand_end = 10,
		run_start = 25,
		run_end = 45,
		punch_start = 46,
		punch_end = 57,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_spawn("dmobs:panda", {"default:dirt_with_grass","ethereal:bamboo_dirt"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("dmobs:panda", "Panda", "default_papyrus.png", 1)


mobs:register_mob("dmobs:fox", {
	type = "monster",
	attacks_monsters = true,
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 42,
	hp_max = 52,
	armor = 130,
	collisionbox = {-0.4, -0.6, -0.4, 0.3, 0.3, 0.3},
	runaway = true,
	pathfinding = true,
	visual = "mesh",
	mesh = "fox.b3d",
	textures = {
		{"dmobs_fox.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=1.5, y=1.5},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2.5,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	replace_rate = 10,
	replace_what = {"farming:wheat_5", "default:fence_wood", "default:grass_5", "default:dirt_with_grass"},
	replace_with = "air",
	follow = {"mobs:meat_raw"},
	view_range = 14,
	animation = {
		speed_normal = 6,
		speed_run = 15,
		walk_start = 25,
		walk_end = 35,
		stand_start = 51,
		stand_end = 60,
		run_start = 1,
		run_end = 16,
		punch_start = 36,
		punch_end = 51,
	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_spawn("dmobs:fox", {"default:dirt_with_grass","default:dirt"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("dmobs:fox", "Fox", "wool_orange.png", 1)

mobs:register_mob("dmobs:hedgehog", {
	type = "monster",
	passive = true,
	reach = 0.8,
	damage = 8,
	attack_type = "dogfight",
	hp_min = 12,
	hp_max = 22,
	armor = 130,
	collisionbox = {-0.1, -0.1, -0.2, 0.2, 0.2, 0.2},
	visual = "mesh",
	mesh = "hedgehog.b3d",
	textures = {
		{"dmobs_hedgehog.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = true,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	follow = {"farming:bread"},
	animation = {
		speed_normal = 5,
		speed_run = 10,
		walk_start = 1,
		walk_end = 10,
		stand_start = 1,
		stand_end = 10,
		run_start = 1,
		run_end = 10,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_spawn("dmobs:hedgehog", {"default:dirt_with_grass","default:pine_needles"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("dmobs:hedgehog", "Hedgehog", "wool_brown.png", 1)


mobs:register_mob("dmobs:elephant", {
	type = "animal",
	passive = false,
	reach = 2,
	damage = 4,
	attack_type = "dogfight",
	hp_min = 120,
	hp_max = 220,
	armor = 130,
	collisionbox = {-0.9, -1.2, -0.9, 0.9, 0.9, 0.9},
	visual = "mesh",
	mesh = "elephant.b3d",
	textures = {
		{"dmobs_elephant.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2.5, y=2.5},
	makes_footstep_sound = true,
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = false,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	replace_rate = 10,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "ethereal:bamboo"},
	replace_with = "air",
	follow = {"farming:wheat"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	animation = {
		speed_normal = 5,
		speed_run = 10,
		walk_start = 3,
		walk_end = 19,
		stand_start = 20,
		stand_end = 30,
		run_start = 3,
		run_end = 19,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_spawn("dmobs:elephant", {"default:dirt_with_dry_grass","default:sand"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("dmobs:elephant", "Elephant", "default_dry_grass.png", 1)

mobs:register_mob("dmobs:whale", {
	type = "animal",
	passive = true,
	reach = 3,
	damage = 10,
	attack_type = "dogfight",
	hp_min = 552,
	hp_max = 582,
	armor = 230,
	collisionbox = {-0.9, -1.2, -0.9, 0.9, 0.9, 0.9},
	visual = "mesh",
	mesh = "whale.b3d",
	textures = {
		{"dmobs_whale.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2.5, y=2.5},
	makes_footstep_sound = true,
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = false,	
	stepheight = 1.5,
	fall_damage = 0,
	fall_speed = -6,
	fly = true,
	fly_in = "default:water_source",
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	follow = {"fishing:fish_cooked"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	animation = {
		speed_normal = 5,
		speed_run = 10,
		walk_start = 2,
		walk_end = 39,
		stand_start = 2,
		stand_end = 39,
		run_start = 2,
		run_end = 39,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_spawn("dmobs:whale", {"default:water_source"}, 2, 10, 15000, -2000, 1000)

mobs:register_egg("dmobs:whale", "Whale", "default_water_source.png", 1)

mobs:register_mob("dmobs:orc", {
	type = "monster",
	passive = false,
	attacks_monsters = true,
	reach = 1.5,
	damage = 3,
	attack_type = "dogfight",
	hp_min = 54,
	hp_max = 100,
	armor = 130,
	collisionbox = {-0.4, -1.3, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "orc.b3d",
	textures = {
		{"dmobs_orc.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 2,
		walk_end = 18,
		stand_start = 30,
		stand_end = 40,
		run_start = 2,
		run_end = 18,
		punch_start = 20,
		punch_end = 30,

	},
})

mobs:register_mob("dmobs:orc_redesign", {
	type = "monster",
	passive = false,
	reach = 1,
	damage = 8,
	attack_type = "dogfight",
	hp_min = 54,
	hp_max = 86,
	armor = 130,
	collisionbox = {-0.4, -0, -0.4, 0.4, 2, 0.4},
	visual = "mesh",
	mesh = "orc_redesign.b3d",
	textures = {
		{"dmobs_orc_redesign.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=1.5, y=1.5},
	makes_footstep_sound = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 12,
		speed_run = 20,
		walk_start = 20,
		walk_end = 40,
		stand_start = 60,
		stand_end = 80,
		run_start = 20,
		run_end = 40,
		punch_start = 1,
		punch_end = 15,

	},
})

if not dragons == true then
mobs:register_spawn("dmobs:orc", {"default:snow","default:snow_block", "default:desert_sand"}, 20, 10, 15000, 2, 31000)
else
mobs:register_spawn("dmobs:orc_redesign", {"default:snow","default:snow_block", "default:desert_sand"}, 20, 10, 350, 2, 31000)
end

mobs:register_egg("dmobs:orc_redesign", "Orc (redesign)", "default_desert_sand.png", 1)
mobs:register_egg("dmobs:orc", "Orc", "default_desert_sand.png", 1)

mobs:register_mob("dmobs:ogre", {
	type = "monster",
	passive = false,
	reach = 4,
	damage = 10,
	attack_type = "dogfight",
	hp_min = 120,
	hp_max = 150,
	armor = 130,
	collisionbox = {-0.6, -1.3, -0.6, 0.6, 1.5, 0.6},
	visual = "mesh",
	mesh = "ogre.b3d",
	textures = {
		{"dmobs_ogre.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=3.5, y=3.5},
	makes_footstep_sound = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	rotate = 180,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 3,
		walk_end = 38,
		stand_start = 40,
		stand_end = 70,
		run_start = 3,
		run_end = 38,
		punch_start = 70,
		punch_end = 100,

	},
})

if not dragons == true then
mobs:register_spawn("dmobs:ogre", {"default:snow","default:dirt_with_dry_grass", "default:desert_sand"}, 20, 10, 15000, 2, 31000)
else
mobs:register_spawn("dmobs:ogre", {"default:snow","default:dirt_with_dry_grass", "default:desert_sand"}, 20, 10, 350, 2, 31000)
end

mobs:register_egg("dmobs:ogre", "Ogre", "default_desert_sand.png", 1)



mobs:register_mob("dmobs:badger", {
	type = "animal",
	passive = false,
	reach = 1,
	damage = 3,
	attack_type = "dogfight",
	hp_min = 24,
	hp_max = 32,
	armor = 130,
	collisionbox = {-0.3, -0.15, -0.3, 0.3, 0.4, 0.3},
	visual = "mesh",
	mesh = "badger.b3d",
	textures = {
		{"dmobs_badger.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	walk_velocity = 0.7,
	run_velocity = 1,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	follow = {"mobs:meat_raw"},
	view_range = 14,
	animation = {
		speed_normal = 12,
		speed_run = 18,
		walk_start = 34,
		walk_end = 58,
		stand_start = 1,
		stand_end = 30,
		run_start = 34,
		run_end = 58,
		punch_start = 60,
		punch_end = 80,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_spawn("dmobs:badger", {"default:dirt_with_grass","default:dirt"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("dmobs:badger", "Badger", "default_obsidian.png", 1)

--dragon

if dragons == true then
dofile(minetest.get_modpath("dmobs").."/dragons.lua")
else
mobs:register_mob("dmobs:dragon", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 4,
   reach = 3,
   attack_type = "dogshoot",
   shoot_interval = 2.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
   arrow = "dmobs:fire",
   shoot_offset = 1,
   hp_min = 70,
   hp_max = 100,
   armor = 100,
	collisionbox = {-0.6, -1.2, -0.6, 0.6, 0.6, 0.6},
   visual = "mesh",
   mesh = "dragon.b3d",
   textures = {
      {"dmobs_dragon.png"},
      {"dmobs_dragon2.png"},
      {"dmobs_dragon3.png"},
      {"dmobs_dragon4.png"},
   },
   blood_texture = "mobs_blood.png",
   visual_size = {x=2, y=2},
   makes_footstep_sound = true,
	runaway = false,
	jump_chance = 30,
	walk_chance = 80,
	fall_speed = 0,
	pathfinding = true,
	fall_damage = 0,
   sounds = {
      shoot_attack = "mobs_fireball",
   },
   walk_velocity = 3,
   run_velocity = 5,
   jump = true,
   fly = true,
   drops = {
      {name = "mobs:lava_orb", chance = 1, min = 1, max = 1},
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
	knock_back = 2,
})

--Thanks to Tenplus1
mobs:register_arrow("dmobs:fire", {
   visual = "sprite",
   visual_size = {x = 0.5, y = 0.5},
   textures = {"dmobs_fire.png"},
   velocity = 8,
   tail = 1, -- enable tail
   tail_texture = "fire_basic_flame.png",

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


mobs:spawn_specific("dmobs:dragon", {"air"}, {"craft_clouds:clouds"}, 20, 10, 300, 15000, 2, -100, 11000)
   
mobs:register_egg("dmobs:dragon", "Dragon", "default_apple.png", 1)
end