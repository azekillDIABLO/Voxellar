
	minetest.register_tool("xtraarmor:helmet_mese", {
		description = "mese Helmet",
		inventory_image = "xtraarmor_inv_helmet_mese.png",
		groups = {armor_head=13.4, physics_jump=0.10,physics_speed=0.10, armor_heal=9, armor_use=150},
		wear = 0,
	})
	minetest.register_tool("xtraarmor:chestplate_mese", {
		description = "mese Chestplate",
		inventory_image = "xtraarmor_inv_chestplate_mese.png",
		groups = {armor_torso=17.4,physics_jump=0.10,physics_speed=0.10, armor_heal=9, armor_use=150},
		wear = 0,
	})
	minetest.register_tool("xtraarmor:leggings_mese", {
		description = "mese Leggings",
		inventory_image = "xtraarmor_inv_leggings_mese.png",
		groups = {armor_legs=17.4,physics_jump=0.10,physics_speed=0.10, armor_heal=9, armor_use=150},
		wear = 0,
	})
	minetest.register_tool("xtraarmor:boots_mese", {
		description = "mese Boots",
		inventory_image = "xtraarmor_inv_boots_mese.png",
		groups = {armor_feet=13.4,physics_jump=0.10,physics_speed=0.10, armor_heal=9, armor_use=150},
		wear = 0,
	})
	minetest.register_tool("xtraarmor:shield_mese", {
		description = "mese shield",
		inventory_image = "xtraarmor_inv_shield_mese.png",
		groups = {armor_shield=13.4,physics_jump=0.10,physics_speed=0.10, armor_heal=9, armor_use=150},
		wear = 0,
	})

minetest.register_craft({
	output = 'xtraarmor:helmet_mese',
	recipe = {
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'default:mese_crystal', '', 'default:mese_crystal'},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'xtraarmor:chestplate_mese',
	recipe = {
		{'default:mese_crystal', '', 'default:mese_crystal'},
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'xtraarmor:leggings_mese',
	recipe = {
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'default:mese_crystal', '', 'default:mese_crystal'},
		{'default:mese_crystal', '', 'default:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'xtraarmor:boots_mese',
	recipe = {
		{'', '', ''},
		{'default:mese_crystal', '', 'default:mese_crystal'},
		{'default:mese_crystal', '', 'default:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'xtraarmor:shield_mese',
	recipe = {
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'', 'default:mese_crystal', ''},
	}
})


	minetest.register_tool("xtraarmor:helmet_chainmail", {
		description = "chainmail Helmet",
		inventory_image = "xtraarmor_inv_helmet_chainmail.png",
		groups = {armor_head=8, armor_heal=0, armor_use=750},
		wear = 0,
	})
	minetest.register_tool("xtraarmor:chestplate_chainmail", {
		description = "chainmail Chestplate",
		inventory_image = "xtraarmor_inv_chestplate_chainmail.png",
		groups = {armor_torso=13, armor_heal=0, armor_use=750},
		wear = 0,
	})
	minetest.register_tool("xtraarmor:leggings_chainmail", {
		description = "chainmail Leggings",
		inventory_image = "xtraarmor_inv_leggings_chainmail.png",
		groups = {armor_legs=13, armor_heal=0, armor_use=750},
		wear = 0,
	})

	minetest.register_tool("xtraarmor:boots_chainmail", {
		description = "chainmail Boots",
		inventory_image = "xtraarmor_inv_boots_chainmail.png",
		groups = {armor_feet=8, armor_heal=0, armor_use=750},
		wear = 0,
	})

	minetest.register_tool("xtraarmor:shield_chainmail", {
		description = "chainmail shield",
		inventory_image = "xtraarmor_inv_shield_chainmail.png",
		groups = {armor_shield=8, armor_heal=0, armor_use=750},
		wear = 0,
	})

minetest.register_craft({
	output = 'xtraarmor:helmet_chainmail',
	recipe = {
		{'xpanes:bar_flat', 'xpanes:bar_flat', 'xpanes:bar_flat'},
		{'xpanes:bar_flat', '', 'xpanes:bar_flat'},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'xtraarmor:chestplate_chainmail',
	recipe = {
		{'xpanes:bar_flat', '', 'xpanes:bar_flat'},
		{'xpanes:bar_flat', 'xpanes:bar_flat', 'xpanes:bar_flat'},
		{'xpanes:bar_flat', 'xpanes:bar_flat', 'xpanes:bar_flat'},
	}
})

minetest.register_craft({
	output = 'xtraarmor:leggings_chainmail',
	recipe = {
		{'xpanes:bar_flat', 'xpanes:bar_flat', 'xpanes:bar_flat'},
		{'xpanes:bar_flat', '', 'xpanes:bar_flat'},
		{'xpanes:bar_flat', '', 'xpanes:bar_flat'},
	}
})

minetest.register_craft({
	output = 'xtraarmor:boots_chainmail',
	recipe = {
		{'', '', ''},
		{'xpanes:bar_flat', '', 'xpanes:bar_flat'},
		{'xpanes:bar_flat', '', 'xpanes:bar_flat'},
	}
})

minetest.register_craft({
	output = 'xtraarmor:shield_chainmail',
	recipe = {
		{'xpanes:bar_flat', 'xpanes:bar_flat', 'xpanes:bar_flat'},
		{'xpanes:bar_flat', 'xpanes:bar_flat', 'xpanes:bar_flat'},
		{'', 'xpanes:bar_flat', ''},
	}
})

	minetest.register_tool("xtraarmor:helmet_leather", {
		description = "leather cap",
		inventory_image = "xtraarmor_inv_helmet_leather.png",
		groups = {armor_head=7, armor_heal=2, armor_use=1000},
		wear = 0,
	})

	minetest.register_tool("xtraarmor:chestplate_leather", {
		description = "leather tunic",
		inventory_image = "xtraarmor_inv_chestplate_leather.png",
		groups = {armor_torso=12, armor_heal=2, armor_use=1000},
		wear = 0,
	})

	minetest.register_tool("xtraarmor:leggings_leather", {
		description = "leather trousers",
		inventory_image = "xtraarmor_inv_leggings_leather.png",
		groups = {armor_legs=7, armor_heal=2, armor_use=150},
		wear = 0,
	})
	minetest.register_tool("xtraarmor:boots_leather", {
		description = "leather Boots",
		inventory_image = "xtraarmor_inv_boots_leather.png",
		groups = {armor_feet=7, armor_heal=2,physics_speed=0.15, armor_use=1000},
		wear = 0,
	})
	minetest.register_tool("xtraarmor:shield_leather", {
		description = "leather shield",
		inventory_image = "xtraarmor_inv_shield_leather.png",
		groups = {armor_shield=7, armor_heal=2, armor_use=1000},
		wear = 0,
	})

minetest.register_craft({
	output = 'xtraarmor:helmet_leather',
	recipe = {
		{'mobs:leather', 'mobs:leather', 'mobs:leather'},
		{'mobs:leather', '', 'mobs:leather'},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'xtraarmor:chestplate_leather',
	recipe = {
		{'mobs:leather', '', 'mobs:leather'},
		{'mobs:leather', 'mobs:leather', 'mobs:leather'},
		{'mobs:leather', 'mobs:leather', 'mobs:leather'},
	}
})

minetest.register_craft({
	output = 'xtraarmor:leggings_leather',
	recipe = {
		{'mobs:leather', 'mobs:leather', 'mobs:leather'},
		{'mobs:leather', '', 'mobs:leather'},
		{'mobs:leather', '', 'mobs:leather'},
	}
})

minetest.register_craft({
	output = 'xtraarmor:boots_leather',
	recipe = {
		{'', '', ''},
		{'mobs:leather', '', 'mobs:leather'},
		{'mobs:leather', '', 'mobs:leather'},
	}
})

minetest.register_craft({
	output = 'xtraarmor:shield_leather',
	recipe = {
		{'mobs:leather', 'mobs:leather', 'mobs:leather'},
		{'mobs:leather', 'default:wood', 'mobs:leather'},
		{'', 'mobs:leather', ''},
	}
})

	minetest.register_tool("xtraarmor:helmet_copper", {
		description = "copper Helmet",
		inventory_image = "xtraarmor_inv_helmet_copper.png",
		groups = {armor_head=8, armor_heal=0, armor_use=750},
		wear = 0,
	})
	minetest.register_tool("xtraarmor:chestplate_copper", {
		description = "copper Chestplate",
		inventory_image = "xtraarmor_inv_chestplate_copper.png",
		groups = {armor_torso=13, armor_heal=0, armor_use=750},
		wear = 0,
	})
	minetest.register_tool("xtraarmor:leggings_copper", {
		description = "copper Leggings",
		inventory_image = "xtraarmor_inv_leggings_copper.png",
		groups = {armor_legs=13, armor_heal=0, armor_use=750},
		wear = 0,
	})

	minetest.register_tool("xtraarmor:boots_copper", {
		description = "copper Boots",
		inventory_image = "xtraarmor_inv_boots_copper.png",
		groups = {armor_feet=8, armor_heal=0, armor_use=750},
		wear = 0,
	})

	minetest.register_tool("xtraarmor:shield_copper", {
		description = "copper shield",
		inventory_image = "xtraarmor_inv_shield_copper.png",
		groups = {armor_shield=8, armor_heal=0, armor_use=750},
		wear = 0,
	})

minetest.register_craft({
	output = 'xtraarmor:helmet_copper',
	recipe = {
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
		{'default:copper_ingot', '', 'default:copper_ingot'},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'xtraarmor:chestplate_copper',
	recipe = {
		{'default:copper_ingot', '', 'default:copper_ingot'},
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
	}
})

minetest.register_craft({
	output = 'xtraarmor:leggings_copper',
	recipe = {
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
		{'default:copper_ingot', '', 'default:copper_ingot'},
		{'default:copper_ingot', '', 'default:copper_ingot'},
	}
})

minetest.register_craft({
	output = 'xtraarmor:boots_copper',
	recipe = {
		{'', '', ''},
		{'default:copper_ingot', '', 'default:copper_ingot'},
		{'default:copper_ingot', '', 'default:copper_ingot'},
	}
})

minetest.register_craft({
	output = 'xtraarmor:shield_copper',
	recipe = {
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
		{'', 'default:copper_ingot', ''},
	}
})

	minetest.register_tool("xtraarmor:helmet_studded", {
		description = "studded Helmet",
		inventory_image = "xtraarmor_inv_helmet_studded.png",
		groups = {armor_head=12.4, armor_heal=2, armor_use=400},
		wear = 0,
	})
	minetest.register_tool("xtraarmor:chestplate_studded", {
		description = "studded Chestplate",
		inventory_image = "xtraarmor_inv_chestplate_studded.png",
		groups = {armor_torso=16.4, armor_heal=2, armor_use=400},
		wear = 0,
	})
	minetest.register_tool("xtraarmor:leggings_studded", {
		description = "studded Leggings",
		inventory_image = "xtraarmor_inv_leggings_studded.png",
		groups = {armor_legs=16.4, armor_heal=2, armor_use=400},
		wear = 0,
	})

	minetest.register_tool("xtraarmor:boots_studded", {
		description = "studded Boots",
		inventory_image = "xtraarmor_inv_boots_studded.png",
		groups = {armor_feet=12.4, armor_heal=2, armor_use=400},
		wear = 0,
	})

	minetest.register_tool("xtraarmor:shield_studded", {
		description = "studded shield",
		inventory_image = "xtraarmor_inv_shield_studded.png",
		groups = {armor_shield=12.4, armor_heal=2, armor_use=400},
		wear = 0,
	})


minetest.register_craft({
	type = "shapeless",
	output = "xtraarmor:helmet_studded",
	recipe = {"xtraarmor:helmet_chainmail", "xtraarmor:helmet_leather"},
})
minetest.register_craft({
	type = "shapeless",
	output = "xtraarmor:chestplate_studded",
	recipe = {"xtraarmor:chestplate_chainmail", "xtraarmor:chestplate_leather"},
})
minetest.register_craft({
	type = "shapeless",
	output = "xtraarmor:leggings_studded",
	recipe = {"xtraarmor:leggings_chainmail", "xtraarmor:leggings_leather"},
})
minetest.register_craft({
	type = "shapeless",
	output = "xtraarmor:boots_studded",
	recipe = {"xtraarmor:boots_chainmail", "xtraarmor:boots_leather"},
})
minetest.register_craft({
	type = "shapeless",
	output = "xtraarmor:shield_studded",
	recipe = {"xtraarmor:shield_chainmail", "xtraarmor:shield_leather"},
})

