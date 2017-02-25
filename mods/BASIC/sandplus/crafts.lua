--+--Crafting Recipes--+--

minetest.register_craft({
	output = 'sandplus:desert_sandstone',
	recipe = {
		{'default:desert_sand', 'default:desert_sand'},
		{'default:desert_sand', 'default:desert_sand'},
	}
})

minetest.register_craft({
	output = 'default:desert_sand 4',
	recipe = {
		{'sandplus:desert_sandstone'},
	}
})

minetest.register_craft({
	output = 'sandplus:desert_sandstonebrick 4',
	recipe = {
		{'sandplus:desert_sandstone', 'sandplus:desert_sandstone'},
		{'sandplus:desert_sandstone', 'sandplus:desert_sandstone'},
	}
})

minetest.register_craft({
	output = 'sandplus:desert_sandstone_block 9',
	recipe = {
		{'sandplus:desert_sandstone', 'sandplus:desert_sandstone', 'sandplus:desert_sandstone'},
		{'sandplus:desert_sandstone', 'sandplus:desert_sandstone', 'sandplus:desert_sandstone'},
		{'sandplus:desert_sandstone', 'sandplus:desert_sandstone', 'sandplus:desert_sandstone'},
	}
})

minetest.register_craft({
	output = 'sandplus:silver_sandstone',
	recipe = {
		{'default:silver_sand', 'default:silver_sand'},
		{'default:silver_sand', 'default:silver_sand'},
	}
})

minetest.register_craft({
	output = 'default:silver_sand 4',
	recipe = {
		{'sandplus:silver_sandstone'},
	}
})

minetest.register_craft({
	output = 'sandplus:silver_sandstonebrick 4',
	recipe = {
		{'sandplus:silver_sandstone', 'sandplus:silver_sandstone'},
		{'sandplus:silver_sandstone', 'sandplus:silver_sandstone'},
	}
})

minetest.register_craft({
	output = 'sandplus:silver_sandstone_block 9',
	recipe = {
		{'sandplus:silver_sandstone', 'sandplus:silver_sandstone', 'sandplus:silver_sandstone'},
		{'sandplus:silver_sandstone', 'sandplus:silver_sandstone', 'sandplus:silver_sandstone'},
		{'sandplus:silver_sandstone', 'sandplus:silver_sandstone', 'sandplus:silver_sandstone'},
	}
})

--Remove [Any Sand] --> [Sandstone] Recipe

minetest.register_craft({
	output = 'default:sandstone 0',
	recipe = {
		{'group:sand', 'group:sand'},
		{'group:sand', 'group:sand'},
	}
})

--Add New Sandstone Recipe

minetest.register_craft({
	output = 'default:sandstone 4',
	recipe = {
		{'default:sand', 'default:sand'},
		{'default:sand', 'default:sand'},
	}
})

--Technic Recipes

if minetest.get_modpath("technic") then	
	--Add Grinder Recipes
	local recipes = {
		{"sandplus:desert_sandstone",   "default:desert_sand 2"},
		{"sandplus:silver_sandstone",    "default:silver_sand 2"}
	}
	for _, data in pairs(recipes) do
		technic.register_grinder_recipe({input = {data[1]}, output = data[2]})
	end
	
	--Remove [Def/Sil/Des Sandstone] --> [Corresponding Sand] Recipes
	minetest.register_craft({
		output = 'default:sand 0',
		recipe = {
			{'default:sandstone'},
		}
	})
	
	minetest.register_craft({
		output = 'default:desert_sand 0',
		recipe = {
			{'sandplus:desert_sandstone'},
		}
	})
	
	minetest.register_craft({
		output = 'default:silver_sand 0',
		recipe = {
			{'sandplus:silver_sandstone'},
		}
	})
	
	--Add Compressor Recipes
	local recipes = {
		{"default:desert_sand 2",   "sandplus:desert_sandstone"},
		{"default:silver_sand 2",    "sandplus:silver_sandstone"},
	}
	
	for _, data in pairs(recipes) do
        minetest.after(0.02, technic.register_compressor_recipe, {input = {data[1]}, output = data[2]} )
    end

	
	--Remove [Def/Sil/Des Sand] --> [Corresponding Sandstone] Recipes
	minetest.register_craft({
		output = 'default:sandstone 0',
		recipe = {
			{'default:sand', 'default:sand'},
			{'default:sand', 'default:sand'},
		}
	})
	
	minetest.register_craft({
		output = 'sandplus:silver_sandstone 0',
		recipe = {
			{'default:silver_sand', 'default:silver_sand'},
			{'default:silver_sand', 'default:silver_sand'},
		}
	})

	minetest.register_craft({
		output = 'sandplus:desert_sandstone 0',
		recipe = {
			{'default:desert_sand', 'default:desert_sand'},
			{'default:desert_sand', 'default:desert_sand'},
		}
	})
	
end
