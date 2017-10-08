local molds_output = _xtend.g('xindustrial_mese_molds_output')
local powder_output = _xtend.g('xindustrial_mese_powder_output')
local crystals_output = _xtend.g('xindustrial_molded_mese_crystal_output')
local loosed_cobble_output = _xtend.g('xindustrial_loosed_cobblestone_output')
local powder_output = _xtend.g('xindustrial_impured_mese_powder_output')
local crystals_cooktime = _xtend.g('xindustrial_molded_mese_crystal_cooktime')


-- Mese Crystal Mold

local moldMask = 'xindustrial_mese_crystal_mold_mask.png^[makealpha:0,0,0'

minetest.register_craftitem('xindustrial:mese_crystal_mold', {
    description = _xtend.t('Mese Crystal Mold'),
    inventory_image = 'default_steel_block.png^[combine:16x16:0,0='..moldMask
})

minetest.register_craft({
    output = 'xindustrial:mese_crystal_mold '..molds_output,
    recipe = {
        {'', 'default:steel_ingot', ''},
        {'default:steel_ingot', '', 'default:steel_ingot'},
        {'', 'default:steel_ingot', ''}
    }
})


-- Mese Powder

local powderMask = 'xindustrial_mese_powder_mask.png^[makealpha:0,0,0'
local powderBase = 'default_mese_block.png^[transform:FXR90'

minetest.register_craftitem('xindustrial:mese_powder', {
    description = _xtend.t('Mese Powder'),
    inventory_image = powderBase..'^[combine:16x16:0,0='..powderMask
})

minetest.register_craft({
    output = 'xindustrial:mese_powder '..powder_output,
    type = 'shapeless',
    recipe = {'default:mese_crystal_fragment'}
})


-- Cutting agent

local lcMask = 'xindustrial_loosed_cobble_mask.png^[makealpha:0,0,0'
local lcBase = 'default_cobble.png'

minetest.register_craftitem('xindustrial:loosed_cobblestone', {
    description = _xtend.t('Loosed Cobblestone'),
    inventory_image = lcBase..'^[combine:16x16:0,0='..lcMask
})

minetest.register_craft({ -- should be compatible with all mods :)
    output = 'xindustrial:loosed_cobblestone '..loosed_cobble_output,
    recipe = {
        {'default:cobble', '', 'default:cobble'},
        {'', '', ''},
        {'default:cobble', '', ''}
    }
})


-- Raw material for molding

local impuredPowder = '('..lcBase..'^[combine:16x16:0,0='..lcMask..')^('..powderBase..'^[combine:16x16:0,0='..powderMask..')^[makealpha:0,0,0'

minetest.register_craftitem('xindustrial:impured_mese_powder', {
    description = _xtend.t('Wet Impured Mese Powder'),
    inventory_image = impuredPowder
})

minetest.register_craft({
    output = 'xindustrial:impured_mese_powder '..powder_output,
    type = 'shapeless',
    recipe = {'xindustrial:loosed_cobblestone',
              'xindustrial:mese_powder',
              'bucket:bucket_water'},
    replacements = {{'bucket:bucket_water', 'bucket:bucket_empty'}}
})


-- Create molded Mese crystal

local wmBase = 'default_mese_crystal.png^[colorize:#00000055'

minetest.register_craftitem('xindustrial:wet_molded_mese_crystal', {
    description = _xtend.t('Wet Molded Mese Crystal'),
    inventory_image = '('..wmBase..')^[makealpha:0,0,0'
})

minetest.register_craft({
    output = 'xindustrial:wet_molded_mese_crystal 1',
    type = 'shapeless',
    recipe = {'xindustrial:impured_mese_powder',
              'xindustrial:mese_crystal_mold'}
})


-- Burning the molded Mese crystal

minetest.register_craftitem('xindustrial:molded_mese_crystal', {
    description = _xtend.t('Molded Mese Crystal'),
    inventory_image = 'default_mese_crystal.png^[cracko:1:0'
})

minetest.register_craft({
    type = 'cooking',
    recipe = 'xindustrial:wet_molded_mese_crystal',
    output = 'xindustrial:molded_mese_crystal '..crystals_output,
    cooktime = crystals_cooktime
})
