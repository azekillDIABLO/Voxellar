local _register = _xtend.f.xfurniture.register
local _p2r = _xtend.f.xfurniture.pattern_to_recipe


for node in pairs(_xtend.v.xfurniture.nodes) do
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Simple Bench Left Part'),
        {
            {-0.625, -0.125, -0.25, 0.5, 0, 0}, -- seat_part_1
            {-0.625, -0.125, 0.0625, 0.5, 0, 0.3125}, -- seat_part_2
            {-0.625, 0.0625, 0.3125, 0.5, 0.25, 0.4375}, -- back_part_1
            {-0.625, 0.3125, 0.3125, 0.5, 0.5, 0.4375}, -- back_part_2
            {-0.3125, -0.5, 0.375, -0.125, 0.4375, 0.5625}, -- pole_back
            {-0.3125, -0.25, -0.0625, -0.125, -0.0625, 0.4375}, -- connector
            {-0.3125, -0.5, -0.1875, -0.125, -0.125, 0} -- pole_front
        },
        _p2r(node, 'simple_bench_left_part')
    })
    _register({
        _xtend.t('Simple Bench Right Part'),
        {
            {-0.5, -0.125, -0.25, 0.625, 0, 0}, -- seat_part_1
            {-0.5, -0.125, 0.0625, 0.625, 0, 0.3125}, -- seat_part_2
            {-0.5, 0.0625, 0.3125, 0.625, 0.25, 0.4375}, -- back_part_1
            {-0.5, 0.3125, 0.3125, 0.625, 0.5, 0.4375}, -- back_part_2
            {0.125, -0.5, 0.375, 0.3125, 0.4375, 0.5625}, -- pole_back
            {0.125, -0.25, -0.0625, 0.3125, -0.0625, 0.4375}, -- connector
            {0.125, -0.5, -0.1875, 0.3125, -0.125, 0} -- pole_front
        },
        _p2r(node, 'simple_bench_right_part')
    })
    _register({
        _xtend.t('Simple Bench Inner Part'),
        {
            {-0.5, -0.125, -0.25, 0.5, 0, 0}, -- seat_part_1
            {-0.5, -0.125, 0.0625, 0.5, 0, 0.3125}, -- seat_part_2
            {-0.5, 0.0625, 0.3125, 0.5, 0.25, 0.4375}, -- back_part_1
            {-0.5, 0.3125, 0.3125, 0.5, 0.5, 0.4375} -- back_part_2
        },
        _p2r(node, 'simple_bench_inner_part')
    })
    _register({
        _xtend.t('Simple Bench Inner Pole Part'),
        {
            {-0.5, -0.125, -0.25, 0.5, 0, 0}, -- seat_part_1
            {-0.5, -0.125, 0.0625, 0.5, 0, 0.3125}, -- seat_part_2
            {-0.5, 0.0625, 0.3125, 0.5, 0.25, 0.4375}, -- back_part_1
            {-0.5, 0.3125, 0.3125, 0.5, 0.5, 0.4375}, -- back_part_2
            {-0.125, -0.5, 0.375, 0.125, 0.4375, 0.5625}, -- pole_back
            {-0.125, -0.25, -0.0625, 0.125, -0.0625, 0.4375}, -- connector
            {-0.125, -0.5, -0.1875, 0.125, -0.125, 0} -- pole_front
        },
        _p2r(node, 'simple_bench_inner_pole_part')
    })
    ----------------------------------------------------------------------------
end
