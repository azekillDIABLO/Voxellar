--Customized Survival Form for Inventory++
local trashInv = minetest.create_detached_inventory(
                    "trash",
                    {
                       on_put = function(inv, toList, toIndex, stack, player)
                          inv:set_stack(toList, toIndex, ItemStack(nil))
                       end
                    })
trashInv:set_size("main", 1)

default.gui_survival_form = "size[8,8.75]"..
			default.gui_bg..
			default.gui_bg_img..
			default.gui_slots..
			"list[detached:trash;main;0,1;1,1;]"..
   "image[0.1,1.1;0.8,0.8;creative_trash_icon.png]"..
			"list[current_player;main;0,3.5;8,1;]"..
			"list[current_player;main;0,4.75;8,3;8]"..
			"list[current_player;craft;2.5,0;3,3;]"..
			"list[current_player;craftpreview;7,1;1,1;]"..
    "image[5.85,1;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
			"listring[current_player;main]"..
			"listring[current_player;craft]"..
			default.get_hotbar_bg(0,3.5)
