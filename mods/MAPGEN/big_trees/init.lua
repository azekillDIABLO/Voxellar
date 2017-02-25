-- Big Trees init.lua
-- Copyright Duane Robertson (duane@duanerobertson.com), 2017
-- Distributed under the LGPLv2.1 (https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)

big_trees_mod = {}
big_trees_mod.version = "1.0"
big_trees_mod.path = minetest.get_modpath(minetest.get_current_modname())
big_trees_mod.world = minetest.get_worldpath()


function big_trees_mod.clone_node(name)
	if not (name and type(name) == 'string') then
		return
	end

	local node = minetest.registered_nodes[name]
	local node2 = table.copy(node)
	return node2
end


dofile(big_trees_mod.path .. "/mapgen.lua")
dofile(big_trees_mod.path .. "/abms.lua")
