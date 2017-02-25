-- Get path
path = minetest.get_modpath("gamemod")

-- Load files
dofile(path .. "/clock.lua")
dofile(path .. "/rot_texture.lua")
dofile(path .. "/tnt_extras.lua")
dofile(path .. "/torches.lua")
dofile(path .. "/worldedge.lua")
dofile(path .. "/chakram.lua")
dofile(path .. "/blood.lua")

-- Say OK
print("Gamemod |"..path.."| Has been loaded...")