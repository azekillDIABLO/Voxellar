
--Malachite Ore Spawning--

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "malachite:malachite",
	wherein        = "default:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -32,
	flags          = "absheight",
})

	
--All Malachite Nodes--

minetest.register_node("malachite:malachite", {
	description = "Malachite (Copper Ore)",
	tiles = {"default_stone.png^malachite.png"},
	is_ground_content = true,
		drop = {
		max_items = 3,
		items = {
			{
				items = {'malachite:malachite_crystal'},
				rarity = 1,
			},
			{
				items = {'malachite:malachite_crystal'},
				rarity = 3,
			},
			{
				items = {'malachite:malachite_crystal'},
				rarity = 3,
			},

		}
	},
	groups = {cracky=2},
})
	
minetest.register_craftitem("malachite:malachite_crystal", {
	description = "Malachite Crystal",
	inventory_image = "malachite.png",
})
	
minetest.register_node("malachite:malachite_block", {
	description = "Malachite Block",
	tiles = {"decorations_malachite.png"},
	is_ground_content = true,
	drop = "malachite:malachite_crystal 4",
	groups = {cracky=2},
})
	
minetest.register_node("malachite:malachite_pyramid", {
	description = "Malachite Pyramid",
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
				{-0.4, -0.3, -0.4, 0.4, -0.1, 0.4},
				{-0.3, -0.1, -0.3, 0.3, 0.1, 0.3},
				{-0.2, 0.1, -0.2, 0.2, 0.3, 0.2},
				{-0.1, 0.3, -0.1, 0.1, 0.5, 0.1},
			},
		},
	tiles = {"decorations_malachite.png"},
	is_ground_content = true,
	groups = {cracky = 2},
})

minetest.register_node("malachite:malachite_table", {
        description = "Malachite Table",
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.245, -0.5, 0.5, 0.5, 0.5},
				{-0.4375, -0.5, -0.4375, -0.25, 0.25, -0.25},
				{-0.4375, -0.5, 0.25, -0.25, 0.25, 0.4375},
				{0.25, -0.5, -0.4375, 0.4375, 0.25, -0.25},
				{0.25, -0.5, 0.25, 0.4375, 0.25, 0.4375},
			},
		},
	selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
	tiles = {"decorations_malachite.png",    
	         "default_wood.png^decorations_malachite_table_bottom.png",
	         "default_wood.png^decorations_malachite_table_side.png"},
	groups = {cracky=2},
})

minetest.register_node("malachite:malachite_cylinder", {
	description = "Malachite Cylinder",
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.2, 0.5, 0.5, 0.2},
				{-0.4, -0.5, -0.3, 0.4, 0.5, 0.3},
				{-0.3, -0.5, -0.4, 0.3, 0.5, 0.4},
				{-0.2, -0.5, -0.5, 0.2, 0.5, 0.5},
			},
		},
	selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.2, 0.5, 0.5, 0.2},
				{-0.4, -0.5, -0.3, 0.4, 0.5, 0.3},
				{-0.3, -0.5, -0.4, 0.3, 0.5, 0.4},
				{-0.2, -0.5, -0.5, 0.2, 0.5, 0.5},
			},
		},
	tiles = {"decorations_malachite.png"},
	is_ground_content = true,
	groups = {cracky=2},
})
				
minetest.register_node("malachite:malachite_vase", {
	description = "Malachite Vase",
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0, -0.5, -0.4, 0.5, 0.5},
				{-0.5, 0, 0.4, 0.5, 0.5, 0.5},
				{-0.5, 0, -0.5, 0.5, 0.5, -0.4},
				{0.4, 0, -0.5, 0.5, 0.5, 0.5},
				{-0.4, -0.1, -0.4, 0.4, 0, 0.4},
				{-0.2, -0.4, -0.2, 0.2, -0.1, 0.2},
				{-0.4, -0.5, -0.4, 0.4, -0.4, 0.4},
			},
		},
	tiles = {"decorations_malachite.png"},
	is_ground_content = true,
	groups = {cracky=2},
})

minetest.register_node("malachite:malachite_casket", {
	description = "Casket",
	drawtype = "nodebox",
	sunlight_propagates = true,
	tiles = {"decorations_casket_top.png", 
	         "decorations_casket_top.png", 
		 "decorations_casket_side.png",
		 "decorations_casket_side.png", 
		 "decorations_casket_side.png", 
		 "decorations_casket_front.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
			type = "fixed",
			fixed = {
				{-0.4, -0.5, -0.3, 0.4, 0, 0.3},
				{-0.3, 0, -0.2, 0.3, 0.1, 0.2},
			},
		},
	selection_box = {
			type = "fixed",
			fixed = {
				{-0.4, -0.5, -0.3, 0.4, 0, 0.3},
				{-0.3, 0, -0.2, 0.3, 0.1, 0.2},
			},
		},
	groups = {cracky=2},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,8]"..
				"list[current_name;main;1,0.5;6,3;]"..
				"list[current_player;main;0,4;8,4;]")
		meta:set_string("infotext", "Casket")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
})

minetest.register_node("malachite:malachite_chest", {
	description = "Malachite Chest",
	sunlight_propagates = true,
	tiles = {"decorations_malachite_chest_top.png", 
	         "decorations_malachite_chest_top.png", 
		     "decorations_malachite_chest_side.png",
		     "decorations_malachite_chest_side.png", 
		     "decorations_malachite_chest_side.png", 
		     "decorations_malachite_chest_front.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Malachite Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
})	
	
minetest.register_node("malachite:toilet", {
    description = "Toilet",
    tiles = {"decorations_malachite.png"},
    drawtype = "nodebox",
    sunlight_propagates = true,
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            { -0.20, -0.50, -0.20,  0.20, -0.45,  0.50, },
            { -0.10, -0.45, -0.10,  0.10,  0.00,  0.50, },
            { -0.30, -0.20, -0.30,  0.30,  0.00,  0.35, },
            { -0.25,  0.00, -0.25,  0.25,  0.05,  0.25, },
            { -0.30,  0.00,  0.30,  0.30,  0.40,  0.50, },
            { -0.05,  0.40,  0.35,  0.05,  0.45,  0.45, },
        },
    },
    drop = "malachite:toilet",
    groups = {cracky=2},
    on_punch = function (pos, node, puncher)
        node.name = "malachite:toilet_open"
        minetest.set_node(pos, node)
    end,
})

minetest.register_node("malachite:toilet_open", {
    tiles = {"decorations_malachite.png"},
    drawtype = "nodebox",
	sunlight_propagates = true,
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            { -0.20, -0.50, -0.20,  0.20, -0.45,  0.50, },
            { -0.10, -0.45, -0.10,  0.10, -0.20,  0.50, },
            { -0.10, -0.20,  0.30,  0.10,  0.00,  0.50, },
            { -0.30, -0.20,  0.10,  0.30,  0.00,  0.35, },
            { -0.30, -0.20, -0.30, -0.10, -0.15,  0.10, },
            { -0.10, -0.20, -0.30,  0.10, -0.15, -0.10, },
            {  0.10, -0.20, -0.30,  0.30, -0.15,  0.10, },
            { -0.30, -0.15, -0.30, -0.20,  0.00,  0.10, },
            { -0.20, -0.15, -0.30,  0.20,  0.00, -0.20, },
            {  0.20, -0.15, -0.30,  0.30,  0.00,  0.10, },
            { -0.25,  0.00,  0.20,  0.25,  0.50,  0.25, },
            { -0.30,  0.00,  0.30,  0.30,  0.40,  0.50, },
        },
    },
    drop = "malachite:toilet",
    groups = {cracky = 3,},
    on_punch = function (pos, node, puncher)
        node.name = "malachite:toilet"
        minetest.set_node(pos, node)
        minetest.sound_play({name="malachite_toilet_flush", pos=pos,})
    end,
})

--Crafting--
	
minetest.register_craft({
	type = "cooking",
	output = "default:copper_ingot 2",
	recipe = "malachite:malachite_crystal",
})

minetest.register_craft({
	output = "malachite:malachite_casket",
	recipe = {
		{"malachite:malachite_crystal","malachite:malachite_crystal","malachite:malachite_crystal"},
		{"malachite:malachite_crystal","malachite:malachite_crystal","malachite:malachite_crystal"},
	}
})

minetest.register_craft({
	output = "malachite:malachite_chest",
	recipe = {
		{"malachite:malachite_crystal","malachite:malachite_crystal","malachite:malachite_crystal"},
		{"malachite:malachite_crystal","","malachite:malachite_crystal"},
		{"malachite:malachite_crystal","malachite:malachite_crystal","mmalachite:malachite_crystal"},
	}
})

minetest.register_craft({
	output = "malachite:malachite_block",
	recipe = {
		{"malachite:malachite_crystal","malachite:malachite_crystal"},
		{"malachite:malachite_crystal","malachite:malachite_crystal"},
	}
})

minetest.register_craft({
	output = "malachite:malachite_pyramid",
	recipe = {
		{"","malachite:malachite_crystal",""},
		{"malachite:malachite_crystal","malachite:malachite_crystal","malachite:malachite_crystal"},
	}
})

minetest.register_craft({
	output = "malachite:malachite_cylinder",
	recipe = {
		{"","malachite:malachite_crystal",""},
		{"malachite:malachite_crystal","malachite:malachite_crystal","malachite:malachite_crystal"},
		{"","malachite:malachite_crystal",""},
	}
})

minetest.register_craft({
	output = "malachite:malachite_vase",
	recipe = {
		{"malachite:malachite_crystal","","malachite:malachite_crystal"},
		{"","malachite:malachite_crystal",""},
		{"","malachite:malachite_crystal",""},
	}
})

minetest.register_craft({
	output = "malachite:malachite_table",
	recipe = {
		{"malachite:malachite_crystal","malachite:malachite_crystal","malachite:malachite_crystal"},
		{"default:stick","","default:stick"},
	}
})

minetest.register_craft({
	output = "malachite:toilet",
	recipe = {
		{"","","malachite:malachite_crystal"},
		{"malachite:malachite_crystal","malachite:malachite_crystal","malachite:malachite_crystal"},
		{"malachite:malachite_crystal","malachite:malachite_crystal",""},
	}
})