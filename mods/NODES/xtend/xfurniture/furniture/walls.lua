local _register = _xtend.f.xfurniture.register
local _p2r = _xtend.f.xfurniture.pattern_to_recipe


local _combine = function(first, second)
    local result = {}
    for key,value in pairs(first) do table.insert(result, value) end
    for key,value in pairs(second) do table.insert(result, value) end
    return result
end


local wb = { -- Wall Base
    {-0.5, -0.5, -0.3125, 0.5, -0.375, 0.3125}, -- base1
    {-0.5, -0.4375, -0.25, 0.5, -0.3125, 0.25},-- base2
    {-0.5, -0.375, -0.1875, 0.5, 0.3125, 0.1875} -- wall
}

local we = { -- Wall Extension
    {-0.5, -0.6875, -0.1875, 0.5, 0.3125, 0.1875} -- wall
}

local wt = { -- Wall Top
    {-0.5, -0.6875, -0.125, 0.5, -0.5625, 0.125}, -- top1
    {-0.5, -0.625, -0.0625, 0.5, -0.5, 0.0625} -- top2
}

local web = { -- Wall End Base
    {-0.5, -0.5, -0.3125, 0.3125, -0.375, 0.3125}, -- base1
    {-0.5, -0.4375, -0.25, 0.25, -0.3125, 0.25}, -- base2
    {-0.5, -0.375, -0.1875, 0.1875, 0.3125, 0.1875} -- wall
}

local wee = { -- Wall End Extension
    {-0.5, -0.6875, -0.1875, 0.1875, 0.3125, 0.1875} -- wall
}

local wet = { -- Wall End Top
    {-0.5, -0.6875, -0.125, 0.125, -0.5625, 0.125}, -- top1
    {-0.5, -0.625, -0.0625, 0.0625, -0.5, 0.0625} -- top2
}

local wcb = { -- Wall Corner Base
    {-0.3125, -0.5, -0.3125, 0.5, -0.375, 0.3125}, -- base1a
    {-0.3125, -0.5, -0.5, 0.3125, -0.375, -0.25}, -- base1b
    {-0.25, -0.4375, -0.25, 0.5, -0.3125, 0.25}, -- base2a
    {-0.25, -0.5, -0.5, 0.25, -0.3125, -0.1875}, -- base2b
    {-0.1875, -0.375, -0.1875, 0.5, 0.3125, 0.1875}, -- wall1
    {-0.1875, -0.5, -0.5, 0.1875, 0.3125, -0.125} -- wall2
}

local wce = { -- Wall Corner Extension
    {-0.1875, -0.6875, -0.1875, 0.5, 0.3125, 0.1875}, -- wall1
    {-0.1875, -0.6875, -0.5, 0.1875, 0.3125, -0.125} -- wall2
}

local wct = { -- Wall Corner Top
    {-0.125, -0.6875, -0.125, 0.5, -0.5625, 0.125}, -- top1a
    {-0.125, -0.6875, -0.5, 0.125, -0.5625, 0}, -- top1b
    {-0.0625, -0.625, -0.0625, 0.5, -0.5, 0.0625}, -- top2a
    {-0.0625, -0.625, -0.5, 0.0625, -0.5, 0} -- top2b
}

local wtjb = { -- Wall T-Junction Base
    {-0.5, -0.5, -0.3125, 0.5, -0.375, 0.3125}, -- base1a
    {-0.3125, -0.5, -0.5, 0.3125, -0.375, -0.25}, -- base1b
    {-0.5, -0.4375, -0.25, 0.5, -0.3125, 0.25}, -- base2a
    {-0.25, -0.5, -0.5, 0.25, -0.3125, -0.1875}, -- base2b
    {-0.5, -0.375, -0.1875, 0.5, 0.3125, 0.1875}, -- wall1
    {-0.1875, -0.5, -0.5, 0.1875, 0.3125, -0.125} -- wall2
}

local wtje = { -- Wall T-Junction Extension
    {-0.5, -0.6875, -0.1875, 0.5, 0.3125, 0.1875}, -- wall1
    {-0.1875, -0.6875, -0.5, 0.1875, 0.3125, -0.125} -- wall2
}

local wtjt = { -- Wall T-Junction Top
    {-0.5, -0.6875, -0.125, 0.5, -0.5625, 0.125}, -- top1a
    {-0.125, -0.6875, -0.5, 0.125, -0.5625, 0}, -- top1b
    {-0.5, -0.625, -0.0625, 0.5, -0.5, 0.0625}, -- top2a
    {-0.0625, -0.625, -0.5, 0.0625, -0.5, 0} -- top2b
}

local thf = { -- Torch Holder Front
    {-0.0625, -0.3125, -0.625, 0.0625, -0.1875, -0.125}, -- holder_arm
    {-0.125, -0.3125, -0.75, 0.125, -0.1875, -0.5} -- holder
}

local thb = { -- Torch Holder Back
    {-0.0625, -0.3125, 0.125, 0.0625, -0.1875, 0.625}, -- holder_arm
    {-0.125, -0.3125, 0.5, 0.125, -0.1875, 0.75} -- holder
}

local thl = { -- Torch Holder Left
    {-0.625, -0.3125, -0.0625, -0.125, -0.1875, 0.0625}, -- holder_arm
    {-0.75, -0.3125, -0.125, -0.5, -0.1875, 0.125} -- holder
}

local thr = { -- Torch Holder Right
    {0.125, -0.3125, -0.0625, 0.625, -0.1875, 0.0625}, -- holder_arm
    {0.5, -0.3125, -0.125, 0.75, -0.1875, 0.125} -- holder
}

local pb = { -- Pole Base
    {-0.25, -0.5, -0.25, 0.25, 0.3125, 0.25}, -- pillar
    {-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- base2
    {-0.375, -0.5, -0.375, 0.375, -0.375, 0.375} -- base1
}

local pe = { -- Pole Extension
    {-0.25, -0.6875, -0.25, 0.25, 0.3125, 0.25} -- pole
}

local pt = { -- Pole Top
    {-0.1875, -0.6875, -0.1875, 0.1875, -0.5625, 0.1875}, -- top1
    {-0.125, -0.5625, -0.125, 0.125, -0.5, 0.125} -- top2
}


for node in pairs(_xtend.v.xfurniture.nodes) do
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Wall Base'),
        wb,
        _p2r(node, 'wall_wb')
    })
    _register({
        _xtend.t('Wall Extension'),
        we,
        _p2r(node, 'wall_we')
    })
    _register({
        _xtend.t('Wall Top'),
        wt,
        _p2r(node, 'wall_wt')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Wall End Base'),
        web,
        _p2r(node, 'wall_web')
    })
    _register({
        _xtend.t('Wall End Extension'),
        wee,
        _p2r(node, 'wall_wee')
    })
    _register({
        _xtend.t('Wall End Top'),
        wet,
        _p2r(node, 'wall_wet')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Wall Corner Base'),
        wcb,
        _p2r(node, 'wall_wcb')
    })
    _register({
        _xtend.t('Wall Corner Extension'),
        wce,
        _p2r(node, 'wall_wce')
    })
    _register({
        _xtend.t('Wall Corner Top'),
        wct,
        _p2r(node, 'wall_wct')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Wall T-Junction Base'),
        wtjb,
        _p2r(node, 'wall_wtjb')
    })
    _register({
        _xtend.t('Wall T-Junction Extension'),
        wtje,
        _p2r(node, 'wall_wtje')
    })
    _register({
        _xtend.t('Wall T-Junction Top'),
        wtjt,
        _p2r(node, 'wall_wtjt')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Pole (Standalone Base)'),
        pb,
        _p2r(node, 'pole_pb')
    })
    _register({
        _xtend.t('Pole (Standalone Extension)'),
        pe,
        _p2r(node, 'pole_pe')
    })
    _register({
        _xtend.t('Pole (Standalone Top)'),
        pt,
        _p2r(node, 'pole_pt')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Pole (Wall Base)'),
        _combine(wb, pb),
        _p2r(node, 'pole_wb_pb')
    })
    _register({
        _xtend.t('Pole (Wall Extension)'),
        _combine(we, pe),
        _p2r(node, 'pole_we_pe')
    })
    _register({
        _xtend.t('Pole (Wall Top)'),
        _combine(wt, pt),
        _p2r(node, 'pole_wt_pt')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Pole (Wall Corner Base)'),
        _combine(wcb, pb),
        _p2r(node, 'pole_wcb_pb')
    })
    _register({
        _xtend.t('Pole (Wall Corner Extension)'),
        _combine(wce, pe),
        _p2r(node, 'pole_wce_pe')
    })
    _register({
        _xtend.t('Pole (Wall Corner Top)'),
        _combine(wct, pt),
        _p2r(node, 'pole_wct_pt')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Pole (T-Junction Base)'),
        _combine(wtjb, pb),
        _p2r(node, 'pole_wtjb_pb')
    })
    _register({
        _xtend.t('Pole (T-Junction Extension)'),
        _combine(wtje, pe),
        _p2r(node, 'pole_wtje_pe')
    })
    _register({
        _xtend.t('Pole (T-Junction Top)'),
        _combine(wtjt, pt),
        _p2r(node, 'pole_wtjt_pt')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Pole (End Wall Base)'),
        _combine(web, pb),
        _p2r(node, 'pole_web_pb')
    })
    _register({
        _xtend.t('Pole (End Wall Extension)'),
        _combine(wee, pe),
        _p2r(node, 'pole_wee_pe')
    })
    _register({
        _xtend.t('Pole (End Wall Top)'),
        _combine(wet, pt),
        _p2r(node, 'pole_wet_pt')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Torch Holder (Wall Base, Single)'),
        _combine(wb, thf),
        _p2r(node, 'torch_holder_wb_thf')
    })
    _register({
        _xtend.t('Torch Holder (Wall Base, Dual)'),
        _combine(wb, _combine(thf, thb)),
        _p2r(node, 'torch_holder_wb_thf_thb')
    })
    _register({
        _xtend.t('Torch Holder (Wall Extension, Single)'),
        _combine(we, thf),
        _p2r(node, 'torch_holder_we_thf')
    })
    _register({
        _xtend.t('Torch Holder (Wall Extension, Dual)'),
        _combine(we, _combine(thf, thb)),
        _p2r(node, 'torch_holder_we_thf_thb')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Torch Holder (Pillared Wall Corner Base, Single)'),
        _combine(wcb, thl),
        _p2r(node, 'torch_holder_wcb_thl')
    })
    _register({
        _xtend.t('Torch Holder (Pillared Wall Corner Base, Dual)'),
        _combine(_combine(wcb, pb), _combine(thl, thb)),
        _p2r(node, 'torch_holder_wcb_pb_thl_thb')
    })
    _register({
        _xtend.t('Torch Holder (Pillared Wall Corner Extension, Single)'),
        _combine(_combine(wce, pe), thl),
        _p2r(node, 'torch_holder_wce_pe_thl')
    })
    _register({
        _xtend.t('Torch Holder (Pillared Wall Corner Extension, Dual)'),
        _combine(_combine(wce, pe), _combine(thl, thb)),
        _p2r(node, 'torch_holder_wce_pe_thl_thb')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Torch Holder (Standalone Pillar Base, Single)'),
        _combine(pb, thf),
        _p2r(node, 'torch_holder_pb_thf')
    })
    _register({
        _xtend.t('Torch Holder (Standalone Pillar Base, Dual Opposite)'),
        _combine(pb, _combine(thf, thb)),
        _p2r(node, 'torch_holder_pb_thf_thb')
    })
    _register({
        _xtend.t('Torch Holder (Standalone Pillar Base, Dual Corner)'),
        _combine(pb, _combine(thf, thl)),
        _p2r(node, 'torch_holder_pb_thf_thl')
    })
    _register({
        _xtend.t('Torch Holder (Standalone Pillar Base, Three Sides)'),
        _combine(pb, _combine(thf, _combine(thl, thr))),
        _p2r(node, 'torch_holder_pb_thf_thl_thr')
    })
    _register({
        _xtend.t('Torch Holder (Standalone Pillar Base, Four Sides)'),
        _combine(pb, _combine(_combine(thf, thb), _combine(thl, thr))),
        _p2r(node, 'torch_holder_pb_thf_thb_thl_thr')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Torch Holder (Standalone Pillar Extension, Single)'),
        _combine(pe, thf),
        _p2r(node, 'torch_holder_pb_thf')
    })
    _register({
        _xtend.t('Torch Holder (Standalone Pillar Extension, Dual Opposite)'),
        _combine(pe, _combine(thf, thb)),
        _p2r(node, 'torch_holder_pb_thf_thb')
    })
    _register({
        _xtend.t('Torch Holder (Standalone Pillar Extension, Dual Corner)'),
        _combine(pe, _combine(thf, thl)),
        _p2r(node, 'torch_holder_pb_thf_thl')
    })
    _register({
        _xtend.t('Torch Holder (Standalone Pillar Extension, Three Sides)'),
        _combine(pe, _combine(thf, _combine(thl, thr))),
        _p2r(node, 'torch_holder_pb_thf_thl_thr')
    })
    _register({
        _xtend.t('Torch Holder (Standalone Pillar Extension, Four Sides)'),
        _combine(pe, _combine(_combine(thf, thb), _combine(thl, thr))),
        _p2r(node, 'torch_holder_pb_thf_thb_thl_thr')
    })
    ----------------------------------------------------------------------------
    -- Orientation of wall ends is from left to right. So on placing the wall
    -- the right side is actually the front of the wall. All directions are
    -- named like if one stands in a position facing the described "front"
    -- while technically it's not the front and thus other torch holders as
    -- described by the name are used to create the described object.
    _register({
        _xtend.t('Torch Holder (Pillared End Wall Base, Front)'),
        _combine(_combine(web, pb), thr),
        _p2r(node, 'torch_holder_web_pb_thr')
    })
    _register({
        _xtend.t('Torch Holder (Pillared End Wall Base, Left)'),
        _combine(_combine(web, pb), thf),
        _p2r(node, 'torch_holder_web_pb_thf')
    })
    _register({
        _xtend.t('Torch Holder (Pillared End Wall Base, Right)'),
        _combine(_combine(web, pb), thb),
        _p2r(node, 'torch_holder_web_pb_thb')
    })
    _register({
        _xtend.t('Torch Holder (Pillared End Wall Base, Dual Opposite)'),
        _combine(_combine(web, pb), _combine(thf, thb)),
        _p2r(node, 'torch_holder_web_pb_thf_thb')
    })
    _register({
        _xtend.t('Torch Holder (Pillared End Wall Base, Dual Left)'),
        _combine(_combine(web, pb), _combine(thf, thr)),
        _p2r(node, 'torch_holder_web_pb_thf_thr')
    })
    _register({
        _xtend.t('Torch Holder (Pillared End Wall Base, Dual Right)'),
        _combine(_combine(web, pb), _combine(thb, thr)),
        _p2r(node, 'torch_holder_web_pb_thb_thr')
    })
    ----------------------------------------------------------------------------
    _register({
        _xtend.t('Torch Holder (Pillared End Wall Extension, Front)'),
        _combine(_combine(wee, pe), thr),
        _p2r(node, 'torch_holder_wee_pe_thr')
    })
    _register({
        _xtend.t('Torch Holder (Pillared End Wall Extension, Left)'),
        _combine(_combine(wee, pe), thf),
        _p2r(node, 'torch_holder_wee_pe_thf')
    })
    _register({
        _xtend.t('Torch Holder (Pillared End Wall Extension, Right)'),
        _combine(_combine(wee, pe), thb),
        _p2r(node, 'torch_holder_wee_pe_thb')
    })
    _register({
        _xtend.t('Torch Holder (Pillared End Wall Extension, Dual Opposite)'),
        _combine(_combine(wee, pe), _combine(thf, thb)),
        _p2r(node, 'torch_holder_wee_pe_thf_thb')
    })
    _register({
        _xtend.t('Torch Holder (Pillared End Wall Extension, Dual Left)'),
        _combine(_combine(wee, pe), _combine(thf, thr)),
        _p2r(node, 'torch_holder_wee_pe_thf_thr')
    })
    _register({
        _xtend.t('Torch Holder (Pillared End Wall Extension, Dual Right)'),
        _combine(_combine(wee, pe), _combine(thb, thr)),
        _p2r(node, 'torch_holder_wee_pe_thb_thr')
    })
    ----------------------------------------------------------------------------
end
