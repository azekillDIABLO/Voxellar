_xtend.i()


-- Load options
_xtend.v.xfurniture = {
    crafting_addition = {
        id = 'xfurniture:crafting_addition',
        amount = 2
    },
    replace = {
        -- To be replaced with other default materials
        {'default:cloud', 'default:glass'},
        {'default:coral_brown', 'default:clay_lump'},
        {'default:coral_orange', 'default:apple'},
        {'default:dirt_with_dry_grass', 'default:dry_grass_1'},
        {'default:dirt_with_grass', 'default:grass_1'},
        {'default:dirt_with_grass_footsteps', 'default:papyrus'},
        {'default:dirt_with_rainforest_litter', 'default:junglegrass'},
        {'default:dirt_with_snow', 'default:snow'},
        {'default:furnace_active', 'default:torch'},
        {'default:stone_with_coal', 'default:coal_lump'},
        {'default:stone_with_copper', 'default:copper_lump'},
        {'default:stone_with_diamond', 'default:diamond'},
        {'default:stone_with_gold', 'default:gold_lump'},
        {'default:stone_with_iron', 'default:iron_lump'},
        {'default:stone_with_tin',  'default:tin_lump'},
        {'default:stone_with_mese', 'default:mese_crystal_fragment'},
        -- To be replaced with defualt materials or mod specific things
        {'farming:soil', 'default:sapling'},
        {'farming:soil_wet', 'default:junglesapling'},
        {'moreores:mineral_mithril', 'moreores:mithril_lump'},
        {'moreores:mineral_silver', 'moreores:silver_lump'}
    }
}


-- To be filled programmatically
_xtend.v.xfurniture.blacklist = {}
_xtend.v.xfurniture.additional_nodes = {}


-- Prepare functionality
dofile(_xtend.p.xfurniture..'system'..DIR_DELIM..'get_blacklist.lua')
dofile(_xtend.p.xfurniture..'system'..DIR_DELIM..'get_nodes.lua')
dofile(_xtend.p.xfurniture..'system'..DIR_DELIM..'crafting_addition.lua')
dofile(_xtend.p.xfurniture..'system'..DIR_DELIM..'pattern_to_recipe.lua')
dofile(_xtend.p.xfurniture..'system'..DIR_DELIM..'register_furniture.lua')


-- Register furniture objects
dofile(_xtend.p.xfurniture..'furniture'..DIR_DELIM..'recipe_patterns.lua')
dofile(_xtend.p.xfurniture..'system'..DIR_DELIM..'get_objects_to_create.lua')


_xtend.v.xfurniture.nodes_per_category = _xtend.f.xfurniture.get_nodes_per_category()


-- Overide uncraftable items
dofile(_xtend.p.xfurniture..'system'..DIR_DELIM..'override_uncraftables.lua')


-- print initinformation if debug messages are enabled
if _xtend.g('xtend_default_debug') then
    dofile(_xtend.p.xfurniture..'system'..DIR_DELIM..'init_information.lua')
end
