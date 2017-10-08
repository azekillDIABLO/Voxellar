if not minetest.get_modpath('drinks') then return end

local _register = _xtend.f.xvessels.register

for _,drink in pairs(drinks.drink_table) do
    local id = drink[1]
    local name = drink[2]
    local color = drink[3]
    _register('xvessels:bowl_drinks_'..id, {
        name = _xtend.t('+j Juice Bowl'):gsub('+j', name),
        top_material = 'default:aspen_wood',
        foot_material = {'default:wood', 'default:wood'},
        light_source = false,
        groups = { choppy = 1, oddly_breakable_by_hand = 1 },
        sounds = default.node_sound_wood_defaults(),
        liquid_texture = 'default_water.png^[colorize:'..color..'BD',
        items = {
            craft = 'drinks:jbu_'..id,
            get = {
                {'bucket:bucket_empty', 'drinks:jbu_'..id},
                {'vessels:drinking_glass', 'drinks:jcu_'..id},
                {'vessels:glass_bottle', 'drinks:jbo_'..id},
                {'vessels:steel_bottle', 'drinks:jsb_'..id}
            }
        }
    })
end
