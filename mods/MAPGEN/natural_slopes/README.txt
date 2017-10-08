Natural slopes

Version 0.9
Licence LGPLv2 or, at your discretion, any later version.
With thanks to all modders, mainly from the stairs mod for study.
Models licensed under CC-0.

Dependencies: none
Optional dependencies:
  default: to enable slopes for Minetest Game
  poschangelib: to enable shape update on walk

This mod add the ability for given nodes to turn into slopes and back to full block
shape by itself according to the surroundings and the material hardness. It creates
natural landscape and smoothes movements.

Slopes can be generated in various ways. Those events can be turned on or off in
settings. The shape is updated on generation, with time, by stepping on edges or
when digging and placing nodes.

It can be used either with Minetest Game or as a library for other games.

As Minetest main unit is the block, having half-sized blocks can break a lot of things.
Thus half-blocks like slopes are still considered as a single block. A single slope
can turn back to a full node and vice-versa and half-blocks are not considered
buildable upon (they will transform back into full block).


How to define new slopes
------------------------

Call natural_slopes.register_slope to declare new slope nodes and bind shape update
events on the original node and the newly created slopes.

register_slope:
- base_node_name: The name of the original node
- node_desc: The basic description of the node. Some properties will be overwriten
    for the new nodes.
- update_chance: inverted chance to the node to update it's shape when an update event
    occurs on it.

It returns the list of slope names in that order: straight, inner corner, outer
corner, pike.

node_desc can accept a dedicated tiles definition which holds top, bottom, front, back
and side instead of the default list.

Top refers to the top faces, where the player walks.
Bottom to the opposite faces. When not set it is the same as top.
Front refers to the vertical faces between the horizontal ones. When not set it is the
same as top. Those are always visible except the lower ones.
Side refers to the vertical faces at the boundaries on the sides of the node. When not
set it is the same as front. Those are often hidden by neighbour blocks.
Back refers to the vertical face at the back of the node. When not set is it the same
as side. Those are hidden most of the time.



How to register only the behaviour
----------------------------------

If all the slope nodes are already registered, you must use an other function to link
them. Use natural_slopes.set_slopes.

set_slopes:
- base_node_name: The full node name
- straight_name: The straight slope node name
- inner_name: The inner corner node name
- outer_name: The outer corner node name
- pike_name: The pike node name



Getting informations about slopes
---------------------------------

Get the full replacement data for any node with natural_slopes.get_replacement.

get_replacement:
- source_node_name:

It returns replacement data.

replacement data:
- source: the full node name
- straight: the straight slope node name
- inner: the inner corner node name
- outer: the outer corner node name
- pike: the pike node name
- chance: inverted chance of update

Use natural_slopes.get_replacement_id to get ids instead of names (for VoxelManip).
It takes the id as argument instead of name.


Get a flat table of slope names with natural_slopes.get_slope_names

get_slope_names:
- node_name: The full node name

It returns {straight, inner, outer, pike} names.


Check slope type with the group natural_slope. The level indicates the type.

group:natural_slope
- 1: straight slope
- 2: inner corner
- 3: outer corner
- 4: pike

It is the same order as get_slope_names, set_slopes arguments and register_slope.
