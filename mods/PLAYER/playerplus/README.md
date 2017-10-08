PlayerPlus mod for minetest

This mod lets the player move faster when walking on ice, slows down the player
when walking on snow, makes touching a cactus hurt and suffocates player when
their head is inside a solid node... enjoy!

https://forum.minetest.net/viewtopic.php?t=10090&p=153667

- 0.1 - Initial release
- 0.2 - 3d_armor mod compatibility
- 0.3 - Optimized code
- 0.4 - Added suffocation when inside nodes
- 0.5 - Slow down when walking in water
- 0.6 - Code tidy and tweak, increased damage by cactus and suffocation
- 0.7 - Added global 'playerplus' table to hold node names gathered around player
- 0.8 - Player knock-back added
- 0.9 - 'on_walk_over' function support added for nodes

API:

Every second the mod checks which node the player is standing on, which node is
at foot and head level and stores inside a global table to be used by mods:

- playerplus[name].nod_stand
- playerplus[name].nod_foot
- playerplus[name].nod_head


Player Knock-back:

This feature is enabled by default and can be turned off by adding this line to
your minetest.conf file:

player_knockback = false


Knock-back is determined by tool strength or a specific 'knockback' value which
can be added to the tool damage_groups itself.  A player with the privelage
'no_knockback' will not be affected when it's enabled.


Node 'on_walk_over' function:

When added to a node definition the function will be called whenever a player
walks on top of the node e.g.

	on_walk_over = function(pos, node, player)
		print ("---", node.name, player:get_player_name() )
	end
