local hud_blodd = {}

minetest.register_on_player_hpchange(function(player, hp_change)
	if hp_change<0 then
		local id = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.5, y = 0.5},
			scale = {
				x = -100,
				y = -100
			},
			text = "blood_splash.png"
		})

		minetest.after(1.52, function(name, id)
		local player = minetest.get_player_by_name(name)
			if player then
				player:hud_remove(id)
			else
				-- player has left the game
			end
		end, player:get_player_name(), id)
	end
end)