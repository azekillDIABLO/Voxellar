local _register = _xtend.f.xfurniture.register
local _p2r = _xtend.f.xfurniture.pattern_to_recipe


for node in pairs(_xtend.v.xfurniture.nodes) do
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Simple Chair'),
        {
            {-0.375, -0.125, -0.375, 0.375, 0, 0.375}, -- seat
            {-0.375, -0.5, 0.25, -0.25, 0.6875, 0.375}, -- leg1_back
            {0.25, -0.5, 0.25, 0.375, 0.6875, 0.375}, -- leg2_back
            {-0.375, -0.5, -0.375, -0.25, -0.0625, -0.25}, -- leg3_front
            {0.25, -0.5, -0.375, 0.375, -0.0625, -0.25}, -- leg4_front
            {-0.3125, 0.25, 0.25, 0.3125, 0.625, 0.375} -- back_rest
        },
        _p2r(node, 'simple_chair', 'Chairs')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Simple Chair Seat Cover'),
        {
            {-0.3125, -1.0625, -0.3125, 0.3125, -0.9375, 0.25} -- cushion
        },
        _p2r(node, 'simple_chair_seat_cover', 'Chairs')
    })
    ----------------------------------------------------------------------------
end
