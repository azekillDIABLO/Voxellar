---( Tools )---

---( First come the Books )---

tool_type = {
    "Pickaxe",
    "Axe",
    "Shovel",
    "Sword"
}
book_level = {
    {"Lesser", 100000, 50},
    {"", 18000, 75},
    {"Greater", 4000, 99}
}

local function scan(inv)
  for s=1,32 do
    local stack = inv:get_stack("main", s)
    local theName = stack:get_name()
    for i=1,4 do
      if theName == 'conjuration:' .. tool_type[i]:lower() then
        return 0
      end
    end
  end
  return 1
end

for i=1,4 do
  for _, rowc in ipairs(book_level) do

    local level = rowc[1]
    local level_wear = rowc[2]
    local color_int = rowc[3]
    local inventory_image = "(default_book.png^[colorize:#008080" .. color_int .. ")^(default_bookshelf_slot.png^[colorize:#0040FF" .. color_int .. ")"
    local level_name = ""

    if level == "Lesser" or level == "Greater" then
      level_name = level .. " "
    end
    minetest.register_tool("conjuration:book_" .. tool_type[i]:lower() .. level:lower(), {
      description = level_name .. "Book of Conjure " .. tool_type[i],
      inventory_image = inventory_image,
      tool_capabilities = {
        full_punch_interval = 1.1,
      },
      sound = {breaks = "default_cool_lava"},
      on_use = function(itemstack, player)
        wear = itemstack:get_wear()
        itemstack:set_wear(wear + level_wear)
        local inv = player:get_inventory()
        local full_slots = 1
        local item_in_use = 0
        local error_control = 0
          for s=1,8 do

            local tool_present = scan(inv)
            if inv:get_stack("main", s):is_empty() == true and tool_present == 1 then
              inv:set_stack("main", s, "conjuration:" .. tool_type[i]:lower())
              conjuration.special_effects(player)
              error_control = 1
            else if error_control == 0 then
              error_control = 1
              minetest.sound_play("default_place_node_metal", player)
            end
          end
          end
        return itemstack
      end
    })
  end
end

conjuration.special_effects = function(player)
  minetest.sound_play("default_cool_lava", player)
  local blue_screen = player:hud_add({
				hud_elem_type = "image",
				position = {x=0.5, y=0.5},
				scale = {x=200, y=200},
				text = "default_snow.png^[colorize:#0040FF99",
				offset = {x=0, y=0},
      })
  minetest.after(0.1, function()
    player:hud_remove(blue_screen)
  end)
  minetest.after(0.4, function()
    minetest.sound_play("default_place_node_metal", player)
  end)
end

---( Tools (Yea, actual tools.) )---

---( Pickaxe )---

minetest.register_tool("conjuration:pickaxe", {
	description = "Bound Pickaxe",
	inventory_image = "(default_tool_diamondpick.png^[brighten)^[colorize:#0040ff99",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=6, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_cool_lava"},
  groups = {not_in_creative_inventory = 1},
  on_drop = function(itemstack, dropper, pos)
  		return
  end,
})

---( Shovel )---

minetest.register_tool("conjuration:shovel", {
	description = "Bound Shovel",
	inventory_image = "(default_tool_diamondshovel.png^[brighten)^[colorize:#0040ff99",
	wield_image = "((default_tool_diamondshovel.png^[brighten)^[colorize:#0040ff99)^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=6, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_cool_lava"},
  groups = {not_in_creative_inventory = 1},
  on_drop = function(itemstack, dropper, pos)
		return
  end,
})

---( Axe )---

minetest.register_tool("conjuration:axe", {
	description = "Bound Axe",
	inventory_image = "(default_tool_diamondaxe.png^[brighten)^[colorize:#0040ff99",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=6, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_cool_lava"},
  groups = {not_in_creative_inventory = 1},
  on_drop = function(itemstack, dropper, pos)
		return
  end,
})

---( Sword )---

minetest.register_tool("conjuration:sword", {
	description = "Bound Sword",
	inventory_image = "(default_tool_diamondsword.png^[brighten)^[colorize:#0040ff99",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=6, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_cool_lava"},
  groups = {not_in_creative_inventory = 1},
  on_drop = function(itemstack, dropper, pos)
		return
  end,
})
