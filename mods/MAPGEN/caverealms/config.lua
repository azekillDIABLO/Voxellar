
local CONFIG_FILE_PREFIX = "caverealms."

caverealms.config = {}

-- This function based on kaeza/minetest-irc/config.lua and used under the
-- terms of BSD 2-clause license.
local function setting(stype, name, default)
	local value
	if stype == "bool" then
		value = minetest.setting_getbool(CONFIG_FILE_PREFIX..name)
	elseif stype == "string" then
		value = minetest.setting_get(CONFIG_FILE_PREFIX..name)
	elseif stype == "number" then
		value = tonumber(minetest.setting_get(CONFIG_FILE_PREFIX..name))
	end
	if value == nil then
		value = default
	end
	caverealms.config[name] = value
end

--generation settings
setting("number", "ymin", -33000) --bottom realm limit
setting("number", "ymax", -10) --top realm limit
setting("number", "tcave", 0.1) --cave threshold

--should player spawn in caves?
setting("bool", "cavespawn", false)

--falling icicles
setting("bool", "falling_icicles", true) --enable/disable falling icicles
setting("number", "fallcha", 0.35) --chance of icicles falling when dug

--decoration chances
setting("number", "stagcha", 0.02) --chance of stalagmites
setting("number", "stalcha", 0.03) --chance of stalactites
setting("number", "h_lag", 15) --max height for stalagmites
setting("number", "h_lac", 20) --...stalactites
setting("number", "crystal", 0.07) --chance of glow crystal formations
setting("number", "h_cry", 9) --max height of glow crystals
setting("number", "h_clac", 13) --max height of glow crystal stalactites
setting("number", "gemcha", 0.03) --chance of small glow gems
setting("number", "mushcha", 0.04) --chance of mushrooms
setting("number", "myccha", 0.03) --chance of mycena mushrooms
setting("number", "wormcha", 0.02) --chance of glow worms
setting("number", "giantcha", 0.01) --chance of giant mushrooms
setting("number", "icicha", 0.035) --chance of icicles
setting("number", "flacha", 0.04) --chance of constant flames
setting("number", "founcha", 0.003) --chance of fountains
setting("number", "fortcha", 0.001) --chance of fortresses

--realm limits for Dungeon Masters' Lair
setting("number", "dm_top", -120) --upper limit 
setting("number", "dm_bot", -31000) --lower limit 
--should fortresses and fountains spawn?
setting("bool", "fortresses", true)
setting("bool", "fountains", true)
--Deep cave settings
setting("number", "deep_cave", -10) -- upper limit

--minimum number of items in chests found in fortresses
setting("number", "min_items", 11)
--maximum number of items in chests found in fortresses
setting("number", "max_items", 25)