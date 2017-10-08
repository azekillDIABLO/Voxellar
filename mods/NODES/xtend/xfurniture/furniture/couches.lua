local _register = _xtend.f.xfurniture.register
local _p2r = _xtend.f.xfurniture.pattern_to_recipe


for node in pairs(_xtend.v.xfurniture.nodes) do
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Couch U Frame'),
        {
            {-0.5, -0.375, -0.625, 0.5, -0.3125, -0.375}, -- U_base
            {-0.625, -0.375, -0.5, -0.375, -0.3125, 0.5}, -- U_left
            {0.375, -0.375, -0.5, 0.625, -0.3125, 0.5}, -- U_right
            {-0.625, -0.5, 0.375, -0.375, -0.375, 0.5}, -- U_left_top_f
            {0.375, -0.5, 0.375, 0.625, -0.375, 0.5}, -- U_right_top_f
            {-0.625, -0.5, -0.625, -0.375, -0.3125, -0.375}, -- U_left_bottom_f
            {0.375, -0.5, -0.625, 0.625, -0.3125, -0.375}, -- U_right_bottom_f
            {-0.375, -0.25, -0.375, 0.375, -0.1875, 0.4375} -- placement_helper
        },
        _p2r(node, 'couch_frame_u')
    })
    _register({
        _xtend.t('Couch Bars Frame'),
        {
            {-0.5, -0.375, 0.375, 0.5, -0.3125, 0.625}, -- top
            {-0.5, -0.375, -0.625, 0.5, -0.3125, -0.375}, -- bottom
            {-0.5, -0.5, -0.625, -0.375, -0.375, -0.375}, -- bottom_left_foot
            {0.375, -0.5, -0.625, 0.5, -0.375, -0.375}, -- bottom_right_foot
            {-0.5, -0.5, 0.375, -0.375, -0.375, 0.625}, -- top_left_foot
            {0.375, -0.5, 0.375, 0.5, -0.375, 0.625}, -- top_right_foot
            {-0.4375, -0.25, -0.375, 0.4375, -0.1875, 0.375} -- placement_helper
        },
        _p2r(node, 'couch_frame_bars')
    })
    _register({
        _xtend.t('Couch Corner Frame'),
        {
            {-0.5, -0.375, 0.375, 0.5, -0.3125, 0.625}, -- top
            {0.375, -0.375, -0.5, 0.625, -0.3125, 0.5}, -- right
            {-0.5, -0.5, 0.375, -0.375, -0.375, 0.625}, -- top_left_foot
            {0.375, -0.5, 0.375, 0.625, -0.3125, 0.625}, -- top_right_foot
            {-0.5, -0.5, -0.5, -0.375, -0.3125, -0.375}, -- bottom_left_foot
            {0.375, -0.5, -0.5, 0.625, -0.375, -0.375}, -- bottom_right_foot
            {-0.4375, -0.25, -0.4375, 0.375, -0.1875, 0.375} -- placement_helper
        },
        _p2r(node, 'couch_frame_corner')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Couch Left End Seat'),
        {
            {-0.6875, -1.3125, -0.6875, 0.5, -1, 0.6875}, -- seat
            {-0.6875, -1, -0.5625, -0.4375, -0.75, 0.6875}, -- armrest
            {-0.5625, -1, 0.3125, 0.5, -0.5, 0.6875} -- backrest
        },
        _p2r(node, 'couch_seat_end_left')
    })
    _register({
        _xtend.t('Couch Right End Seat'),
        {
            {-0.5, -1.3125, -0.6875, 0.6875, -1, 0.6875}, -- seat
            {0.4375, -1, -0.5625, 0.6875, -0.75, 0.6875}, -- armrest
            {-0.5, -1, 0.3125, 0.5625, -0.5, 0.6875} -- backrest
        },
        _p2r(node, 'couch_seat_end_right')
    })
    _register({
        _xtend.t('Couch Center Seat'),
        {
            {-0.5, -1.3125, -0.6875, 0.5, -1, 0.6875}, -- seat
            {-0.5, -1, 0.3125, 0.5, -0.5, 0.6875} -- backrest
        },
        _p2r(node, 'couch_seat_center')
    })
    _register({
        _xtend.t('Couch Corner Seat (Regular)'),
        {
            {-0.5, -1.3125, -0.5, 0.6875, -1, 0.6875}, -- seat
			{-0.5, -1, 0.3125, 0.5, -0.5, 0.6875}, -- backrest_1
			{0.3125, -1.3125, -0.5, 0.6875, -0.5, 0.6875} -- backrest_2
        },
        _p2r(node, 'couch_seat_corner_regular')
    })
    _register({
        _xtend.t('Couch Corner Seat (Inverted)'),
        {
            {-0.6875, -1.3125, -0.6875, 0.6875, -1, 0.6875}, -- seat
			{0.3125, -1, 0.3125, 0.6875, -0.5, 0.6875} -- backrest_pillar
        },
        _p2r(node, 'couch_seat_corner_inverted')
    })
    ----------------------------------------------------------------------------
end
