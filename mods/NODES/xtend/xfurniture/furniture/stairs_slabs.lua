local _register = _xtend.f.xfurniture.register
local _p2r = _xtend.f.xfurniture.pattern_to_recipe


for node in pairs(_xtend.v.xfurniture.nodes) do
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Stair (Two Steps)'),
        {
            {-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- bottom
            {-0.5, 0, 0, 0.5, 0.5, 0.5} -- top
        },
        _p2r(node, 'stair_two_steps')
    })
    _register({
        _xtend.t('Stair (Two Steps, Inset Corner)'),
        {
            {-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- bottom
            {-0.5, 0, 0, 0.5, 0.5, 0.5}, -- top
            {0, -0.5, -0.5, 0.5, 0.5, 0}, -- inset
        },
        _p2r(node, 'stair_two_steps_inset_corner')
    })
    _register({
        _xtend.t('Stair (Two Steps, Outset Corner)'),
        {
            {-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- bottom
            {0, 0, 0, 0.5, 0.5, 0.5}, -- top
        },
        _p2r(node, 'stair_two_steps_outset_corner')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Stair (Three Steps)'),
        {
            {-0.5, -0.5, -0.5, 0.5, -0.125, 0.5}, -- bottom
            {-0.5, -0.125, 0.125, 0.5, 0.5, 0.5}, -- top
            {-0.5, -0.125, -0.1875, 0.5, 0.1875, 0.125}, -- middle
        },
        _p2r(node, 'stair_three_steps')
    })
    _register({
        _xtend.t('Stair (Three Steps, Inset Corner)'),
        {
            {-0.5, -0.5, -0.5, 0.5, -0.125, 0.5}, -- bottom
            {-0.5, -0.125, 0.125, 0.5, 0.5, 0.5}, -- top
            {-0.5, -0.125, -0.1875, 0.5, 0.1875, 0.125}, -- middle
            {-0.1875, -0.125, -0.5, 0.5, 0.1875, -0.1875}, -- middle_inset
            {0.125, -0.5, -0.5, 0.5, 0.5, 0.125}, -- top_inset
        },
        _p2r(node, 'stair_three_steps_inset_corner')
    })
    _register({
        _xtend.t('Stair (Three Steps, Outset Corner)'),
        {
            {-0.5, -0.5, -0.5, 0.5, -0.125, 0.5}, -- bottom
            {0.125, -0.125, 0.125, 0.5, 0.5, 0.5}, -- top
            {-0.1875, -0.125, -0.1875, 0.5, 0.1875, 0.5}, -- middle
        },
        _p2r(node, 'stair_three_steps_inset_outset_corner')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Slab (Half Node)'),
        {
            {-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- slab
        },
        _p2r(node, 'slab_half_node')
    })
    _register({
        _xtend.t('Slab (Half Node, Lowered)'),
        {
            {-0.5, -1, -0.5, 0.5, -0.5, 0.5}, -- lowered_slab            
        },
        _p2r(node, 'slab_half_node_lowered')
    })
    ----------------------------------------------------------------------------
end
