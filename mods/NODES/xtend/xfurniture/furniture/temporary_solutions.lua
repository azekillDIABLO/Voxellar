local _register = _xtend.f.xfurniture.register
local _p2r = _xtend.f.xfurniture.pattern_to_recipe


for node in pairs(_xtend.v.xfurniture.nodes) do
    ----------------------------------------------------------------------------
    -- Upside-down stairs
    --
    -- Dedicated upside-down variants to preserve texture orientation. When
    -- rotating regular stairs so they be upside-down the texture will also be
    -- upside-down causing ugly looking texture non-connectivity issues. See
    -- Minetest issue here: https://github.com/minetest/minetest/issues/5222
    --
    -- Since this bug won’t be fixed anytime soon this workaround node exists.
    -- Once this will be fixed the upside-down versions will be removed.
    _register({
        _xtend.t('Two Steps Upside-down Stair'),
        {
            {-0.5, -0.5, 0, 0.5, 0, 0.5}, -- bottom
            {-0.5, 0, -0.5, 0.5, 0.5, 0.5} -- top
        },
        _p2r(node, 'ud_stair_two_steps')
    })
    _register({
        _xtend.t('Two Steps Upside-down Stair (Inset Corner)'),
        {
            {-0.5, -0.5, 0, 0.5, 0, 0.5}, -- bottom
            {-0.5, 0, -0.5, 0.5, 0.5, 0.5}, -- top
            {0, -0.5, -0.5, 0.5, 0.5, 0.5} -- inset
        },
        _p2r(node, 'ud_stair_two_steps_inset_corner')
    })
    _register({
        _xtend.t('Two Steps Upside-down Stair (Outset Corner)'),
        {
            {0, -0.5, 0, 0.5, 0, 0.5}, -- bottom
            {-0.5, 0, -0.5, 0.5, 0.5, 0.5} -- top
        },
        _p2r(node, 'ud_stair_two_steps_outset_corner')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Three Steps Upside-down Stair'),
        {
            {-0.5, -0.5, 0.125, 0.5, 0.125, 0.5}, -- bottom
            {-0.5, 0.125, -0.5, 0.5, 0.5, 0.5}, -- top
            {-0.5, -0.1875, -0.1875, 0.5, 0.125, 0.125} -- middle
        },
        _p2r(node, 'ud_stair_three_steps')
    })
    _register({
        _xtend.t('Three Steps Upside-down Stair (Inset Corner)'),
        {
            {-0.5, -0.5, 0.125, 0.5, 0.125, 0.5}, -- bottom
            {-0.5, 0.125, -0.5, 0.5, 0.5, 0.5}, -- top
            {-0.5, -0.1875, -0.1875, 0.5, 0.125, 0.125}, -- middle
            {-0.1875, -0.1875, -0.5, 0.5, 0.125, -0.1875}, -- inset_middle
            {0.125, -0.5, -0.5, 0.5, -0.1875, 0.125} -- inset_bottom
        },
        _p2r(node, 'ud_stair_three_steps_inset_corner')
    })
    _register({
        _xtend.t('Three Steps Upside-down Stair (Outset Corner)'),
        {
            {0.125, -0.5, 0.125, 0.5, 0.125, 0.5}, -- bottom
            {-0.5, 0.125, -0.5, 0.5, 0.5, 0.5}, -- top
            {-0.1875, -0.1875, -0.1875, 0.5, 0.125, 0.5} -- middle
        },
        _p2r(node, 'ud_stair_three_steps_outset_corner')
    })
    ----------------------------------------------------------------------------
end
