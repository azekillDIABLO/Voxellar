-- Big_Trees abms.lua
-- Copyright Duane Robertson (duane@duanerobertson.com), 2017
-- Distributed under the LGPLv2.1 (https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)


-- Stop arson.
-- This puts the burdon on fires, which shouldn't be happening much.
minetest.register_abm({
	nodenames = {'fire:basic_flame'},
	neighbors = {"big_trees:tree"},
	interval = time_factor,
	chance = 50,
	action = function(pos, node)
		if not (pos and node) then
			return
		end

		minetest.set_node(pos, {name = 'big_trees:sap'})
	end
})


-- Allow the trees to grow back their heartwood.
-- Enable this if you've got burrowing mobs (or players?).
if false then
  local no_tree_grow = {'big_trees:bark', 'big_trees:leaves'}
  local wood_nodes = {{name = 'big_trees:diamondwood'}, {name = 'big_trees:ironwood'}, {name = 'big_trees:sap'}, {name = 'big_trees:tree'}}
  minetest.register_abm({
    neighbors = {'air'},
    interval = 10 * time_factor,
    chance = 450,
    catch_up = false,
    action = function(pos, node)
      if not (pos and node) then
        return
      end

      local new_pos = minetest.find_node_near(pos, 1, no_tree_grow)
      if new_pos then
        return
      end

      new_pos = minetest.find_node_near(pos, 1, "air")
      if not new_pos then
        return
      end

      if math.random(50) == 1 then
        minetest.set_node(new_pos, wood_nodes[1])
      elseif math.random(25) == 1 then
        minetest.set_node(new_pos, wood_nodes[2])
      elseif math.random(25) == 1 then
        minetest.set_node(new_pos, wood_nodes[3])
      else
        minetest.set_node(new_pos, wood_nodes[4])
      end
    end
  })
end
