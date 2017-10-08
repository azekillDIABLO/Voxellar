local _register = _xtend.f.xfurniture.register
local _p2r = _xtend.f.xfurniture.pattern_to_recipe

-- One step is 0.0625 because 1/16 = 0.0625
local _indent_setting = _xtend.g('xfurniture_window_stuff_indent')
local _indent = tonumber(_indent_setting:match("^(%w+)")) * 0.0625


-- Apply indentiation to a nodebox definition
--
-- The indentahas to be added to the third and the 6th value on each line of
-- the single nodebox definitions to move the part back by the wanted amount of
-- fractions. This function does exactly that.
--
-- @param nodebox_table   The nodebox table you want to process
-- @param float|int       The desired indent value
-- @return nodebox_table  The processed nodebox table
--
-- @see <http://dev.minetest.net/Node_boxes> for how a nodox table has to
--      be created (`{box1, box2, ...}`)
local _apply_indent = function(nodebox_table, indent)
    local new_nodebox_table = {}

    for _,b in pairs(nodebox_table) do
        local new_box = {b[1], b[2], b[3] + indent, b[4], b[5], b[6] + indent}
        table.insert(new_nodebox_table, new_box)
    end

    return new_nodebox_table
end


for node in pairs(_xtend.v.xfurniture.nodes) do
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Window Screen Bars'),
        _apply_indent({
            {-0.5, 0.4375, 0.375, 0.5, 0.5, 0.4375}, -- line_1
            {-0.5, 0.3125, 0.375, 0.5, 0.375, 0.4375}, -- line_2
            {-0.5, 0.1875, 0.375, 0.5, 0.25, 0.4375}, -- line_3
            {-0.5, 0.0625, 0.375, 0.5, 0.125, 0.4375}, -- line_4
            {-0.5, -0.0625, 0.375, 0.5, 0, 0.4375}, -- line_5
            {-0.5, -0.1875, 0.375, 0.5, -0.125, 0.4375}, -- line_6
            {-0.5, -0.3125, 0.375, 0.5, -0.25, 0.4375}, -- line_7
            {-0.5, -0.4375, 0.375, 0.5, -0.375, 0.4375} -- line_8
        }, _indent),
        _p2r(node, 'window_screen_bars')
    })
    _register({
        _xtend.t('Window Screen Frame Part'),
        _apply_indent({
            {-0.5, -0.5, 0.3125, 0.5, -0.3125, 0.5} -- frame_part
        }, _indent),
        _p2r(node, 'window_screen_frame_part')
    })
    _register({
        _xtend.t('Window Screen Frame Corner'),
        _apply_indent({
            {-0.5, -0.5, 0.3125, -0.3125, -0.3125, 0.5}, -- frame_corner
        }, _indent),
        _p2r(node, 'window_screen_frame_corner')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Window Sill Sill Part'),
        _apply_indent({
            {-0.5, 0.375, 0.1875, 0.5, 0.5, 0.5} -- sill_part
        }, _indent),
        _p2r(node, 'window_sill_sill_part')
    })
    _register({
        _xtend.t('Window Sill End Part Right'),
        _apply_indent({
            {-0.5, 0.375, 0.1875, -0.25, 0.5, 0.5}, -- end_part_right_top
            {-0.375, 0.25, 0.1875, -0.25, 0.4375, 0.5} -- end_part_right_end
        }, _indent),
        _p2r(node, 'window_sill_end_part_right')
    })
    _register({
        _xtend.t('Window Sill End Part Left'),
        _apply_indent({
            {0.25, 0.375, 0.1875, 0.5, 0.5, 0.5}, -- end_part_left_top
            {0.25, 0.25, 0.1875, 0.375, 0.4375, 0.5} -- end_part_left_end
        }, _indent),
        _p2r(node, 'window_sill_end_part_left')
    })
    ----------------------------------------------------------------------------
end
