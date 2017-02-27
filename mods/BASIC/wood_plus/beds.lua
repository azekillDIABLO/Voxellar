beds.register_bed("wood_plus:acacia_bed", {
	description = "Simple Acacia Bed",
	inventory_image = "wood_plus_acacia_bed.png",
	wield_image = "wood_plus_acacia_bed.png",
	tiles = {
		bottom = {
			"beds_bed_top_bottom.png^[transformR90",
			"default_acacia_wood.png",
			"wood_plus_acacia_bed_side_bottom_r.png",
			"wood_plus_acacia_bed_side_bottom_r.png^[transformfx",
			"beds_transparent.png",
			"wood_plus_acacia_bed_side_bottom.png"
		},
		top = {
			"beds_bed_top_top.png^[transformR90",
			"default_acacia_wood.png",
			"wood_plus_acacia_bed_side_top_r.png",
			"wood_plus_acacia_bed_side_top_r.png^[transformfx",
			"wood_plus_acacia_bed_side_top.png",
			"beds_transparent.png",
		}
	},
	nodebox = {
		bottom = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
		top = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"wool:red", "wool:red", "wool:white"},
		{"default:acacia_wood", "default:acacia_wood", "default:acacia_wood"}
	},
})

beds.register_bed("wood_plus:fancy_acacia_bed", {
	description = "Fancy Acacia Bed",
	inventory_image = "wood_plus_fancy_acacia_bed.png",
	wield_image = "wood_plus_fancy_acacia_bed.png",
	tiles = {
		bottom = {
			"wood_plus_acacia_bed_top1.png",
			"default_acacia_wood.png",
			"wood_plus_acacia_bed_side1.png",
			"wood_plus_acacia_bed_side1.png^[transformFX",
			"default_acacia_wood.png",
			"wood_plus_acacia_bed_foot.png",
		},
		top = {
			"wood_plus_acacia_bed_top2.png",
			"default_acacia_wood.png",
			"wood_plus_acacia_bed_side2.png",
			"wood_plus_acacia_bed_side2.png^[transformFX",
			"wood_plus_acacia_bed_head.png",
			"default_acacia_wood.png",
		}
	},
	nodebox = {
		bottom = {
			{-0.5, -0.5, -0.5, -0.375, -0.065, -0.4375},
			{0.375, -0.5, -0.5, 0.5, -0.065, -0.4375},
			{-0.5, -0.375, -0.5, 0.5, -0.125, -0.4375},
			{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
			{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
			{-0.4375, -0.3125, -0.4375, 0.4375, -0.0625, 0.5},
		},
		top = {
			{-0.5, -0.5, 0.4375, -0.375, 0.1875, 0.5},
			{0.375, -0.5, 0.4375, 0.5, 0.1875, 0.5},
			{-0.5, 0, 0.4375, 0.5, 0.125, 0.5},
			{-0.5, -0.375, 0.4375, 0.5, -0.125, 0.5},
			{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
			{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
			{-0.4375, -0.3125, -0.5, 0.4375, -0.0625, 0.4375},
		}
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"", "", "wood_plus:acacia_stick"},
		{"wool:red", "wool:red", "wool:white"},
		{"default:acacia_wood", "default:acacia_wood", "default:acacia_wood"},
	},
})

beds.register_bed("wood_plus:aspen_bed", {
	description = "Simple Aspen Bed",
	inventory_image = "wood_plus_aspen_bed.png",
	wield_image = "wood_plus_aspen_bed.png",
	tiles = {
		bottom = {
			"beds_bed_top_bottom.png^[transformR90",
			"default_aspen_wood.png",
			"wood_plus_aspen_bed_side_bottom_r.png",
			"wood_plus_aspen_bed_side_bottom_r.png^[transformfx",
			"beds_transparent.png",
			"wood_plus_aspen_bed_side_bottom.png"
		},
		top = {
			"beds_bed_top_top.png^[transformR90",
			"default_aspen_wood.png",
			"wood_plus_aspen_bed_side_top_r.png",
			"wood_plus_aspen_bed_side_top_r.png^[transformfx",
			"wood_plus_aspen_bed_side_top.png",
			"beds_transparent.png",
		}
	},
	nodebox = {
		bottom = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
		top = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"wool:red", "wool:red", "wool:white"},
		{"default:aspen_wood", "default:aspen_wood", "default:aspen_wood"}
	},
})

beds.register_bed("wood_plus:fancy_aspen_bed", {
	description = "Fancy Aspen Bed",
	inventory_image = "wood_plus_fancy_aspen_bed.png",
	wield_image = "wood_plus_fancy_aspen_bed.png",
	tiles = {
		bottom = {
			"wood_plus_aspen_bed_top1.png",
			"default_aspen_wood.png",
			"wood_plus_aspen_bed_side1.png",
			"wood_plus_aspen_bed_side1.png^[transformFX",
			"default_aspen_wood.png",
			"wood_plus_aspen_bed_foot.png",
		},
		top = {
			"wood_plus_aspen_bed_top2.png",
			"default_aspen_wood.png",
			"wood_plus_aspen_bed_side2.png",
			"wood_plus_aspen_bed_side2.png^[transformFX",
			"wood_plus_aspen_bed_head.png",
			"default_aspen_wood.png",
		}
	},
	nodebox = {
		bottom = {
			{-0.5, -0.5, -0.5, -0.375, -0.065, -0.4375},
			{0.375, -0.5, -0.5, 0.5, -0.065, -0.4375},
			{-0.5, -0.375, -0.5, 0.5, -0.125, -0.4375},
			{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
			{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
			{-0.4375, -0.3125, -0.4375, 0.4375, -0.0625, 0.5},
		},
		top = {
			{-0.5, -0.5, 0.4375, -0.375, 0.1875, 0.5},
			{0.375, -0.5, 0.4375, 0.5, 0.1875, 0.5},
			{-0.5, 0, 0.4375, 0.5, 0.125, 0.5},
			{-0.5, -0.375, 0.4375, 0.5, -0.125, 0.5},
			{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
			{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
			{-0.4375, -0.3125, -0.5, 0.4375, -0.0625, 0.4375},
		}
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"", "", "wood_plus:aspen_stick"},
		{"wool:red", "wool:red", "wool:white"},
		{"default:aspen_wood", "default:aspen_wood", "default:aspen_wood"},
	},
})

beds.register_bed("wood_plus:jungle_bed", {
	description = "Simple Jungle Bed",
	inventory_image = "wood_plus_jungle_bed.png",
	wield_image = "wood_plus_jungle_bed.png",
	tiles = {
		bottom = {
			"beds_bed_top_bottom.png^[transformR90",
			"default_junglewood.png",
			"wood_plus_jungle_bed_side_bottom_r.png",
			"wood_plus_jungle_bed_side_bottom_r.png^[transformfx",
			"beds_transparent.png",
			"wood_plus_jungle_bed_side_bottom.png"
		},
		top = {
			"beds_bed_top_top.png^[transformR90",
			"default_junglewood.png",
			"wood_plus_jungle_bed_side_top_r.png",
			"wood_plus_jungle_bed_side_top_r.png^[transformfx",
			"wood_plus_jungle_bed_side_top.png",
			"beds_transparent.png",
		}
	},
	nodebox = {
		bottom = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
		top = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"wool:red", "wool:red", "wool:white"},
		{"default:junglewood", "default:junglewood", "default:junglewood"}
	},
})

beds.register_bed("wood_plus:fancy_jungle_bed", {
	description = "Fancy Jungle Bed",
	inventory_image = "wood_plus_fancy_jungle_bed.png",
	wield_image = "wood_plus_fancy_jungle_bed.png",
	tiles = {
		bottom = {
			"wood_plus_jungle_bed_top1.png",
			"default_junglewood.png",
			"wood_plus_jungle_bed_side1.png",
			"wood_plus_jungle_bed_side1.png^[transformFX",
			"default_junglewood.png",
			"wood_plus_jungle_bed_foot.png",
		},
		top = {
			"wood_plus_jungle_bed_top2.png",
			"default_junglewood.png",
			"wood_plus_jungle_bed_side2.png",
			"wood_plus_jungle_bed_side2.png^[transformFX",
			"wood_plus_jungle_bed_head.png",
			"default_junglewood.png",
		}
	},
	nodebox = {
		bottom = {
			{-0.5, -0.5, -0.5, -0.375, -0.065, -0.4375},
			{0.375, -0.5, -0.5, 0.5, -0.065, -0.4375},
			{-0.5, -0.375, -0.5, 0.5, -0.125, -0.4375},
			{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
			{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
			{-0.4375, -0.3125, -0.4375, 0.4375, -0.0625, 0.5},
		},
		top = {
			{-0.5, -0.5, 0.4375, -0.375, 0.1875, 0.5},
			{0.375, -0.5, 0.4375, 0.5, 0.1875, 0.5},
			{-0.5, 0, 0.4375, 0.5, 0.125, 0.5},
			{-0.5, -0.375, 0.4375, 0.5, -0.125, 0.5},
			{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
			{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
			{-0.4375, -0.3125, -0.5, 0.4375, -0.0625, 0.4375},
		}
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"", "", "wood_plus:jungle_stick"},
		{"wool:red", "wool:red", "wool:white"},
		{"default:junglewood", "default:junglewood", "default:junglewood"},
	},
})

beds.register_bed("wood_plus:pine_bed", {
	description = "Simple Pine Bed",
	inventory_image = "wood_plus_pine_bed.png",
	wield_image = "wood_plus_pine_bed.png",
	tiles = {
		bottom = {
			"beds_bed_top_bottom.png^[transformR90",
			"default_pine_wood.png",
			"wood_plus_pine_bed_side_bottom_r.png",
			"wood_plus_pine_bed_side_bottom_r.png^[transformfx",
			"beds_transparent.png",
			"wood_plus_pine_bed_side_bottom.png"
		},
		top = {
			"beds_bed_top_top.png^[transformR90",
			"default_pine_wood.png",
			"wood_plus_pine_bed_side_top_r.png",
			"wood_plus_pine_bed_side_top_r.png^[transformfx",
			"wood_plus_pine_bed_side_top.png",
			"beds_transparent.png",
		}
	},
	nodebox = {
		bottom = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
		top = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"wool:red", "wool:red", "wool:white"},
		{"default:pine_wood", "default:pine_wood", "default:pine_wood"}
	},
})

beds.register_bed("wood_plus:fancy_pine_bed", {
	description = "Fancy Pine Bed",
	inventory_image = "wood_plus_fancy_pine_bed.png",
	wield_image = "wood_plus_fancy_pine_bed.png",
	tiles = {
		bottom = {
			"wood_plus_pine_bed_top1.png",
			"default_pine_wood.png",
			"wood_plus_pine_bed_side1.png",
			"wood_plus_pine_bed_side1.png^[transformFX",
			"default_pine_wood.png",
			"wood_plus_pine_bed_foot.png",
		},
		top = {
			"wood_plus_pine_bed_top2.png",
			"default_pine_wood.png",
			"wood_plus_pine_bed_side2.png",
			"wood_plus_pine_bed_side2.png^[transformFX",
			"wood_plus_pine_bed_head.png",
			"default_pine_wood.png",
		}
	},
	nodebox = {
		bottom = {
			{-0.5, -0.5, -0.5, -0.375, -0.065, -0.4375},
			{0.375, -0.5, -0.5, 0.5, -0.065, -0.4375},
			{-0.5, -0.375, -0.5, 0.5, -0.125, -0.4375},
			{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
			{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
			{-0.4375, -0.3125, -0.4375, 0.4375, -0.0625, 0.5},
		},
		top = {
			{-0.5, -0.5, 0.4375, -0.375, 0.1875, 0.5},
			{0.375, -0.5, 0.4375, 0.5, 0.1875, 0.5},
			{-0.5, 0, 0.4375, 0.5, 0.125, 0.5},
			{-0.5, -0.375, 0.4375, 0.5, -0.125, 0.5},
			{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
			{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
			{-0.4375, -0.3125, -0.5, 0.4375, -0.0625, 0.4375},
		}
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"", "", "wood_plus:pine_stick"},
		{"wool:red", "wool:red", "wool:white"},
		{"default:pine_wood", "default:pine_wood", "default:pine_wood"},
	},
})
