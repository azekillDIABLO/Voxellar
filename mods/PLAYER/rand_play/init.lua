randplayx={}
y=1
tester=nil
total=nil
randomfile=nil
math.randomseed(math.random())

dofile(minetest.get_modpath(minetest.get_current_modname()).."/config.lua")

dofile(minetest.get_modpath(minetest.get_current_modname()).."/functions.lua")

dofile(minetest.get_modpath(minetest.get_current_modname()).."/list.lua")

getlist()

minetest.after(delay, function()
	songloop()
end)

print("Mod rand_play loaded")
