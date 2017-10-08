**xFurniture adds a lot of objects that can be used for interior and exterior decoration.**

Some of the objects are decorative only, like chairs, tables, desks, etc. Some objects are a little bit more useful like window screens, stairs of various types or walls.

The main difference between xFurniture and the many other mods that add decorative items is that xFurniture provides all of the items made of ALL solid nodes of all supported mods in extremely cheap recipes while most other mods provide you with some individually designed objects.

# Crafting and the Crafting Addition
Since xFurniture provides 50+ different objects made of hundreds of different nodes it is pretty much impossible to keep the recipes simple and logical without breaking existing recipes. Thus the *Crafting Addition* exists.

Two of them will be used in all of the xFurniture recipes. They get returned when crafting and have no wear. You craft them putting one `default:cobblestone` and two `default:dirt` in a shapeless recipe into the crafting grid.

When left clicking while the Crafting Addition is selected a formspec showing the xFurniture objects opens. The formspec uses default:wood as example material. When clicking the object's buttons a 3x3 fiels showing the recipe appears.

# Reaching max node limit
Since xFurniture adds a lot of nodes for each of the solid supported nodes there might be a lot (A LOT!) of nodes being registered depending on your mods and xFurniture configuration regarding usage of mods and registered objects.

This could cause reaching Minetests internal limit for registering nodes (this is a somewhat arbitrary value of 32768 node IDs in total). Reaching the limit causes Minetest to crash when the 32768+1st node will be registered. This could be an xTend object or any other node being registered by any other node.

There is an [intensive and ongoing discussion](https://github.com/minetest/minetest/issues/6101) on how-to-or-not raising the limit but currently the only solution for not crashing Minetest by running out of available internal node IDs is configuring xFurniture to create less objects by either using less of the supported mods or register less object categories. Both can be set in the advanced configuration of xFurniture.
