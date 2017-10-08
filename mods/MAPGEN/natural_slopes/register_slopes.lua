
-- Table of replacement from solid block to slopes.
-- Populated on slope node registration with add_replacement
local replacements = {}
local replacement_ids = {}
local function add_replacement(source_name, update_chance, fixed_replacements)
	local subname = string.sub(source_name, string.find(source_name, ':') + 1)
	local straight_name = nil
	local ic_name = nil
	local oc_name = nil
	local pike_name = nil
	if fixed_replacements then
		straight_name = fixed_replacements[1]
		ic_name = fixed_replacements[2]
		oc_name = fixed_replacements[3]
		pike_name = fixed_replacements[4]
	else
		straight_name = natural_slopes.get_straight_slope_name(subname)
		ic_name = natural_slopes.get_inner_corner_slope_name(subname)
		oc_name = natural_slopes.get_outer_corner_slope_name(subname)
		pike_name = natural_slopes.get_pike_slope_name(subname)
	end
	local source_id = minetest.get_content_id(source_name)
	local straight_id = minetest.get_content_id(straight_name)
	local ic_id = minetest.get_content_id(ic_name)
	local oc_id = minetest.get_content_id(oc_name)
	local pike_id = minetest.get_content_id(pike_name)
	-- Full to slopes
	local dest_data = {
		source = source_name,
		straight = straight_name,
		inner = ic_name,
		outer = oc_name,
		pike = pike_name,
		chance = update_chance
	}
	local dest_data_id = {
		source = source_id,
		straight = straight_id,
		inner = ic_id,
		outer = oc_id,
		pike = pike_id,
		chance = update_chance
	}
	-- Block
	replacements[source_name] = dest_data
	replacement_ids[source_id] = dest_data_id
	-- Straight
	replacements[straight_name] = dest_data
	replacement_ids[straight_id] = dest_data_id
	-- Inner
	replacements[ic_name] = dest_data
	replacement_ids[ic_id] = dest_data_id
	-- Outer
	replacements[oc_name] = dest_data
	replacement_ids[oc_id] = dest_data_id
	-- Pike
	replacements[pike_name] = dest_data
	replacement_ids[pike_id] = dest_data_id
end

--- Get replacement description of a node.
-- Contains replacement names in either source or (straight, inner, outer)
-- and chance.
function natural_slopes.get_replacement(source_node_name)
	return replacements[source_node_name]
end
--- Get replacement description of a node by content id for VoxelManip.
-- Contains replacement ids in either source or (straight, inner, outer)
-- and chance.
function natural_slopes.get_replacement_id(source_id)
	return replacement_ids[source_id]
end

--- Get the list of slope names for a given node.
-- @return [straight, inner, outer, pike] node names,
-- nil if no slopes are registered.
function natural_slopes.get_slope_names(node_name)
	if replacements[node_name] then
		local rep = replacements[node_name]
		return {rep.straight, rep.inner, rep.outer, rep.pike}
	else
		return nil
	end
end


--[[ Bounding boxes
--]]

local slope_straight_box = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		{-0.5, 0, 0, 0.5, 0.5, 0.5},
	},
}
local slope_inner_corner_box = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		{-0.5, 0, 0, 0.5, 0.5, 0.5},
		{-0.5, 0, -0.5, 0, 0.5, 0},
	},
}
local slope_outer_corner_box = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		{-0.5, 0, 0, 0, 0.5, 0.5},
	},
}
local slope_pike_box = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
}

local function tile_get(tiles, side)
	if natural_slopes.setting_smooth_rendering()
	and (side == 'front' or side == 'side' or side == 'back') then
		return {name = tiles.top, backface_culling = true}
	end
	local tile = nil
	if side == 'top' then tile = tiles.top end
	if side == 'bottom' then tile = (tiles.bottom or tiles.top) end
	if side == 'front' then tile = (tiles.front or tiles.top) end
	if side == 'side' then tile = (tiles.side or tiles.front or tiles.top) end
	if side == 'back' then tile = (tiles.back or tiles.side or tiles.front or tiles.top) end
	if type(tile) == 'table' then
		tile.backface_culling = true
	else
		tile = {name = tile, backface_culling = true}
	end
	return tile
end

--- {Private} Register a straight slope and link to the original node.
local function register_slope_straight(base_node_name, node_desc, update_chance)
	-- Register slope node
	local subname = string.sub(base_node_name, string.find(base_node_name, ':') + 1)
	if natural_slopes.setting_smooth_rendering() then
		node_desc.drawtype = 'mesh'
		node_desc.mesh = 'natural_slopes_straight.obj'
	else
		node_desc.drawtype = 'nodebox'
		node_desc.node_box = slope_straight_box
	end
	node_desc.selection_box = slope_straight_box
	node_desc.collision_box = slope_straight_box
	node_desc.paramtype = 'light'
	node_desc.paramtype2 = 'facedir'
	node_desc.is_ground_content = true
	if node_desc.tiles and node_desc.tiles.top then
		local tiles = {tile_get(node_desc.tiles, 'top')}
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'bottom')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'side')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'side')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'back')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'front')
		node_desc.tiles = tiles
	end
	if not node_desc.groups then node_desc.groups = {} end
	node_desc.groups.natural_slope = 1
	if not node_desc.drop then
		node_desc.drop = base_node_name
	end
	local slope_name = natural_slopes.get_straight_slope_name(subname)
	minetest.register_node(slope_name, node_desc)
	-- Register stomp
	if natural_slopes.setting_enable_shape_on_walk() then
		poschangelib.register_stomp(slope_name,
			natural_slopes.update_shape_on_walk,
			{name = slope_name .. '_upd_shape',
			chance = update_chance, priority = 500})
	end
	return slope_name
end

--- {Private} Register an inner corner and link to the original node.
local function register_slope_inner(base_node_name, node_desc, update_chance)
	local subname = string.sub(base_node_name, string.find(base_node_name, ':') + 1)
	if natural_slopes.setting_smooth_rendering() then
		node_desc.drawtype = 'mesh'
		node_desc.mesh = 'natural_slopes_inner.obj'
	else
		node_desc.drawtype = 'nodebox'
		node_desc.node_box = slope_inner_corner_box
	end
	node_desc.selection_box = slope_inner_corner_box
	node_desc.collision_box = slope_inner_corner_box
	node_desc.paramtype = 'light'
	node_desc.paramtype2 = 'facedir'
	node_desc.is_ground_content = true
	if node_desc.tiles and node_desc.tiles.top then
		local tiles = {tile_get(node_desc.tiles, 'top')}
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'bottom')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'front')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'back')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'back')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'front')
		node_desc.tiles = tiles
	end
	if not node_desc.groups then node_desc.groups = {} end
	node_desc.groups.natural_slope = 2
	if not node_desc.drop then
		node_desc.drop = base_node_name
	end
	local slope_name = natural_slopes.get_inner_corner_slope_name(subname)
	minetest.register_node(slope_name, node_desc)

	-- Register walk listener
	if natural_slopes.setting_enable_shape_on_walk() then
		poschangelib.register_stomp(slope_name,
			natural_slopes.update_shape_on_walk,
			{name = slope_name .. '_upd_shape',
			chance = update_chance, priority = 500})

	end
	return slope_name
end

--- {Private} Register an outer corner and link to the original node.
local function register_slope_outer(base_node_name, node_desc, update_chance)
	local subname = string.sub(base_node_name, string.find(base_node_name, ':') + 1)
	if natural_slopes.setting_smooth_rendering() then
		node_desc.drawtype = 'mesh'
		node_desc.mesh = 'natural_slopes_outer.obj'
	else
		node_desc.drawtype = 'nodebox'
		node_desc.node_box = slope_outer_corner_box
	end
	node_desc.selection_box = slope_outer_corner_box
	node_desc.collision_box = slope_outer_corner_box
	node_desc.paramtype = 'light'
	node_desc.paramtype2 = 'facedir'
	node_desc.is_ground_content = true
	if node_desc.tiles and node_desc.tiles.top then
		local tiles = {tile_get(node_desc.tiles, 'top')}
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'bottom')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'front')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'back')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'back')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'front')
		node_desc.tiles = tiles
	end
	if not node_desc.groups then node_desc.groups = {} end
	node_desc.groups.natural_slope = 3
	if not node_desc.drop then
		node_desc.drop = base_node_name
	end
	local slope_name = natural_slopes.get_outer_corner_slope_name(subname)
	minetest.register_node(slope_name, node_desc)

	-- Register walk listener
	if natural_slopes.setting_enable_shape_on_walk() then
		poschangelib.register_stomp(slope_name,
			natural_slopes.update_shape_on_walk,
			{name = slope_name .. '_upd_shape',
			chance = update_chance, priority = 500})
	end
	return slope_name
end

--- {Private} Register a pike and link to the original node.
local function register_slope_pike(base_node_name, node_desc, update_chance)
	local subname = string.sub(base_node_name, string.find(base_node_name, ':') + 1)
	if natural_slopes.setting_smooth_rendering() then
		node_desc.drawtype = 'mesh'
		node_desc.mesh = 'natural_slopes_pike.obj'
	else
		node_desc.drawtype = 'nodebox'
		node_desc.node_box = slope_pike_box
	end
	node_desc.selection_box = slope_pike_box
	node_desc.collision_box = slope_pike_box
	node_desc.paramtype = 'light'
	node_desc.is_ground_content = true
	if node_desc.tiles and node_desc.tiles.top then
		local tiles = {tile_get(node_desc.tiles, 'top')}
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'bottom')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'front')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'front')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'front')
		tiles[#tiles+1] = tile_get(node_desc.tiles, 'front')
		node_desc.tiles = tiles
	end
	if not node_desc.groups then node_desc.groups = {} end
	node_desc.groups.natural_slope = 4
	if not node_desc.drop then
		node_desc.drop = base_node_name
	end
	local slope_name = natural_slopes.get_pike_slope_name(subname)
	minetest.register_node(slope_name, node_desc)
	-- Register walk listener
	if natural_slopes.setting_enable_shape_on_walk() then
		poschangelib.register_stomp(slope_name,
			natural_slopes.update_shape_on_walk,
			{name = slope_name .. '_upd_shape',
			chance = update_chance, priority = 500})
	end
	return slope_name
end

local function table_copy(table)
	local orig_type = type(table)
	local copy = {}
	if orig_type ~= 'table' then return table end
	for orig_key, orig_value in next, table, nil do
		copy[orig_key] = table_copy(orig_value)
	end
	return copy
end

--- Register slopes from a full block node.
-- @param base_node_name: The full block node name.
-- @param node_desc: base for slope node descriptions.
-- @param update_chance: inverted chance for the node to be updated.
-- @return Table of slope names: [straight, inner, outer, pike] or nil on error.
function natural_slopes.register_slope(base_node_name, node_desc, update_chance)
	if not update_chance then
		minetest.log('error', 'Natural slopes: chance is not set for node ' .. base_node_name)
		return
	end
	-- Use a copy because tables are passed by reference. Otherwise the node
	-- description is shared and updated even after minetest.register_node
	local names = {}
	local local_desc = table_copy(node_desc)
	table.insert(names, register_slope_straight(base_node_name, local_desc, update_chance))
	local_desc = table_copy(node_desc)
	table.insert(names, register_slope_inner(base_node_name, local_desc, update_chance))
	local_desc = table_copy(node_desc)
	table.insert(names, register_slope_outer(base_node_name, local_desc, update_chance))
	local_desc = table_copy(node_desc)
	table.insert(names, register_slope_pike(base_node_name, local_desc, update_chance))
	add_replacement(base_node_name, update_chance)
	-- Enable on walk update
	if natural_slopes.setting_enable_shape_on_walk() then
		poschangelib.register_stomp(base_node_name,
			natural_slopes.update_shape_on_walk,
			{name = base_node_name .. '_upd_shape',
			chance = update_chance, priority = 500})
	end
	return names
end

--- Add a slopping behaviour to existing nodes.
function natural_slopes.set_slopes(base_node_name, straight_name, inner_name, outer_name, pike_name, update_chance)
	-- Defensive checks
	if not minetest.registered_nodes[base_node_name] then
		if not base_node_name then
			minetest.log('error', 'natural_slopes.set_slopes failed: base node_name is nil.')
		else
			minetest.log('error', 'natural_slopes.set_slopes failed: ' .. base_node_name .. ' is not registered.')
		end
		return
	end
	if not minetest.registered_nodes[straight_name]
	or not minetest.registered_nodes[inner_name]
	or not minetest.registered_nodes[outer_name]
	or not minetest.registered_nodes[pike_name] then
		minetest.log('error', 'natural_slopes.set_slopes failed: one of the slopes for ' .. base_node_name .. ' is not registered.')
		return
	end
	if not update_chance then
		minetest.log('error', 'Natural slopes: chance is not set for node ' .. base_node_name)
		return
	end
	-- Set shape update data
	local slope_names = {straight_name, inner_name, outer_name, pike_name}
	add_replacement(base_node_name, update_chance, slope_names)
	-- Set walk listener for the 5 nodes
	if natural_slopes.setting_enable_shape_on_walk() then
		local stomp_desc = {name = base_node_name .. '_upd_shape',
			chance = update_chance, priority = 500}
		poschangelib.register_stomp(base_node_name, natural_slopes.update_shape_on_walk, stomp_desc)
		for i, name in pairs(slope_names) do
			poschangelib.register_stomp(name, natural_slopes.update_shape_on_walk, stomp_desc)
		end
	end
end

