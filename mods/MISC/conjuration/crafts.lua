
---( Crafts )---

minetest.register_craft({
	output = "conjuration:soul_shards",
	recipe = {
		{"", "default:coal_lump", ""},
		{"default:mese_crystal", "default:diamond", "default:mese_crystal"},
		{"", "default:coal_lump", ""}
	}
})

---( Books )---

minetest.register_craft({
  output = "conjuration:book_pickaxelesser",
  recipe = {
    {"", "default:pick_wood", ""},
    {"", "default:book", ""},
    {"", "conjuration:soul_crystal", ""}
  }
})

minetest.register_craft({
  output = "conjuration:book_pickaxe",
  recipe = {
    {"", "default:pick_wood", ""},
    {"", "default:book", ""},
    {"conjuration:soul_crystal", "", "conjuration:soul_crystal"}
  }
})

minetest.register_craft({
  output = "conjuration:book_pickaxegreater",
  recipe = {
    {"", "default:pick_wood", ""},
    {"", "default:book", ""},
    {"conjuration:soul_crystal", "conjuration:soul_crystal", "conjuration:soul_crystal"}
  }
})

minetest.register_craft({
  output = "conjuration:book_shovellesser",
  recipe = {
    {"", "default:shovel_wood", ""},
    {"", "default:book", ""},
    {"", "conjuration:soul_crystal", ""}
  }
})

minetest.register_craft({
  output = "conjuration:book_shovel",
  recipe = {
    {"", "default:shovel_wood", ""},
    {"", "default:book", ""},
    {"conjuration:soul_crystal", "", "conjuration:soul_crystal"}
  }
})

minetest.register_craft({
  output = "conjuration:book_shovelgreater",
  recipe = {
    {"", "default:shovel_wood", ""},
    {"", "default:book", ""},
    {"conjuration:soul_crystal", "conjuration:soul_crystal", "conjuration:soul_crystal"}
  }
})

minetest.register_craft({
  output = "conjuration:book_axelesser",
  recipe = {
    {"", "default:axe_wood", ""},
    {"", "default:book", ""},
    {"", "conjuration:soul_crystal", ""}
  }
})

minetest.register_craft({
  output = "conjuration:book_axe",
  recipe = {
    {"", "default:axe_wood", ""},
    {"", "default:book", ""},
    {"conjuration:soul_crystal", "", "conjuration:soul_crystal"}
  }
})

minetest.register_craft({
  output = "conjuration:book_axegreater",
  recipe = {
    {"", "default:axe_wood", ""},
    {"", "default:book", ""},
    {"conjuration:soul_crystal", "conjuration:soul_crystal", "conjuration:soul_crystal"}
  }
})

minetest.register_craft({
  output = "conjuration:book_swordlesser",
  recipe = {
    {"", "default:sword_wood", ""},
    {"", "default:book", ""},
    {"", "conjuration:soul_crystal", ""}
  }
})

minetest.register_craft({
  output = "conjuration:book_sword",
  recipe = {
    {"", "default:sword_wood", ""},
    {"", "default:book", ""},
    {"conjuration:soul_crystal", "", "conjuration:soul_crystal"}
  }
})

minetest.register_craft({
  output = "conjuration:book_swordgreater",
  recipe = {
    {"", "default:sword_wood", ""},
    {"", "default:book", ""},
    {"conjuration:soul_crystal", "conjuration:soul_crystal", "conjuration:soul_crystal"}
  }
})
---( Cooking )---

minetest.register_craft({
	type = "cooking",
	output = "conjuration:soul_crystal",
	recipe = "conjuration:soul_shards",
})
