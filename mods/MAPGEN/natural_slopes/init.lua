-- Global namespace for functions
natural_slopes = {}

--- Get node name for slopes from a subname.
-- For example 'dirt' will be named 'natural_slopes:slope_dirt'
function natural_slopes.get_straight_slope_name(subname)
	return minetest.get_current_modname() .. ':slope_' .. subname
end
function natural_slopes.get_inner_corner_slope_name(subname)
	return minetest.get_current_modname() .. ':slope_inner_' .. subname
end
function natural_slopes.get_outer_corner_slope_name(subname)
	return minetest.get_current_modname() .. ':slope_outer_' .. subname
end
function natural_slopes.get_pike_slope_name(subname)
	return minetest.get_current_modname() .. ':slope_pike_' .. subname
end

-- Set functions to get configuration and default values
function natural_slopes.setting_enable_surface_update()
	local value = minetest.setting_getbool('natural_slopes.enable_surface_update')
	if value == nil then return true end
	return value
end
function natural_slopes.setting_surface_update_interval()
	return tonumber(minetest.setting_get('natural_slopes.surface_update_interval')) or 5.0
end
function natural_slopes.setting_enable_shape_on_walk()
	if not _G.poschangelib then return false end
	local value = minetest.setting_getbool('natural_slopes.enable_shape_on_walk')
	if value == nil then return true end
	return value
end
function natural_slopes.setting_register_default_nodes()
	local value = minetest.setting_getbool('natural_slopes.register_default_slopes')
	if value == nil then value = true end
	if not _G.default then value = false end
	return value
end
function natural_slopes.setting_enable_shape_on_generation()
	local value = minetest.setting_getbool('natural_slopes.register_default_slopes')
	if value == nil then value = true end
	return value
end
function natural_slopes.setting_generation_factor()
	return tonumber(minetest.setting_get('natural_slopes.update_shape_generate_factor')) or 0.05
end
function natural_slopes.setting_generation_skip()
	return tonumber(minetest.setting_get('natural_slopes.update_shape_generate_skip')) or 0
end
function natural_slopes.setting_enable_shape_on_dig_place()
	local value = minetest.setting_getbool('natural_slopes.enable_shape_on_dig_place')
	if value == nil then value = true end
	return value
end
function natural_slopes.setting_smooth_rendering()
	local value = minetest.setting_getbool('natural_slopes.smooth_rendering')
	if value == nil then value = false end
	return value
end

dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/update_shape.lua")
-- Include registration methods
dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/register_slopes.lua")

-- Define new nodes
if natural_slopes.setting_register_default_nodes() then
	dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/nodes/default.lua")
end
