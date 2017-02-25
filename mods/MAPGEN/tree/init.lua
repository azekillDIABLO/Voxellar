local random = math.random

tree = {}

-- Example how to convert mts schematics to lua tables
--~ function tree:build_tree()
	--~ local building = minetest.get_modpath("palmtree").."/schematics/palmtree.mts"
	--~ local str = minetest.serialize_schematic(building, "lua", {lua_use_comments = false, lua_num_indent_spaces = 0}).." return(schematic)"

	--~ local schematic = loadstring(str)()

	--~ print(dump(schematic))
--~ end

--~ tree:build_tree()

-- Leafdecay 

function tree.search_leaves_for_decay(pos, radius, leaf_node)
	local leaves_near = minetest.find_nodes_in_area(vector.subtract(pos, radius + 1),
			vector.add(pos, radius + 1), leaf_node)
	print(dump(leaves_near))
	for i = 1, #leaves_near do
		local node = minetest.get_node(leaves_near[i])
		if node.param2 == 0 then
			minetest.get_node_timer(leaves_near[i]):start(math.random(5))
		end
	end
end

function tree.decay_leaves(pos, radius, trunk_node, leaf_node)
	if minetest.find_node_near(pos, radius, trunk_node) then
		return
	end
	local itemstacks = minetest.get_node_drops(leaf_node)
	for _, itemname in ipairs(itemstacks) do
		if itemname ~= leaf_node or
				minetest.get_item_group(leaf_node, "leafdecay_drop") ~= 0 then
			local p_drop = {
				x = pos.x - 0.5 + math.random(),
				y = pos.y - 0.5 + math.random(),
				z = pos.z - 0.5 + math.random(),
			}
			minetest.add_item(p_drop, itemname)
		end
	end
	-- Remove node
	minetest.remove_node(pos)
	minetest.check_for_falling(pos)
end


function tree.can_grow(pos)
	local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	local name_under = node_under.name
	local is_soil = minetest.get_item_group(name_under, "soil")
	if is_soil == 0 then
		return false
	end
	local light_level = minetest.get_node_light(pos)
	if not light_level or light_level < 13 then
		return false
	end
	return true
end


--
-- Sapling 'on place' function to check protection of node and resulting tree volume
--
function tree.sapling_on_place(itemstack, placer, pointed_thing,
		sapling_name, minp_relative, maxp_relative, interval)
	-- Position of sapling
	local pos = pointed_thing.under
	local node = minetest.get_node_or_nil(pos)
	local pdef = node and minetest.registered_nodes[node.name]

	if pdef and pdef.on_rightclick and not placer:get_player_control().sneak then
		return pdef.on_rightclick(pos, node, placer, itemstack, pointed_thing)
	end

	if not pdef or not pdef.buildable_to then
		pos = pointed_thing.above
		node = minetest.get_node_or_nil(pos)
		pdef = node and minetest.registered_nodes[node.name]
		if not pdef or not pdef.buildable_to then
			return itemstack
		end
	end

	local player_name = placer:get_player_name()
	-- Check sapling position for protection
	if minetest.is_protected(pos, player_name) then
		minetest.record_protection_violation(pos, player_name)
		return itemstack
	end
	-- Check tree volume for protection
	if not default.intersects_protection(
			vector.add(pos, minp_relative),
			vector.add(pos, maxp_relative),
			player_name,
			interval) then
		minetest.set_node(pos, {name = sapling_name})
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
	else
		minetest.record_protection_violation(pos, player_name)
		-- Print extra information to explain
		minetest.chat_send_player(player_name, "Tree will intersect protection")
	end

	return itemstack
end

-- Prevent decay of placed leaves

tree.after_place_leaves = function(pos, placer, itemstack, pointed_thing)
	if placer and not placer:get_player_control().sneak then
		local node = minetest.get_node(pos)
		node.param2 = 1
		minetest.set_node(pos, node)
	end
end

-- Support use of group:sapling
minetest.register_craft({
	type = "fuel",
	recipe = "group:sapling",
	burntime = 10,
})

