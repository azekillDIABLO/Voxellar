-- Category names
_xtend.v.xfurniture.category_names = {
    category_1 = _xtend.t('xFurniture Indicator'),
    category_2 = _xtend.t('Benches & Couches'),
    category_3 = _xtend.t('Interior'),
    category_4 = _xtend.t('Window Stuff'),
    category_5 = _xtend.t('Stairs and Slabs'),
    category_6 = _xtend.t('Walls'),
    category_7 = _xtend.t('Unused'),
    category_8 = _xtend.t('Unused'),
    category_9 = _xtend.t('Temporary Solutions')
}


-- RECIPE PATTERN
--
-- Since there are not many good recipes one can create using only <=8 of the
-- same node and one additional item xFurniture uses a pattern based recipe
-- where there is no connection between the shape of the recipe and the object
-- that is crafted using the recipe.
--
-- The pattern has 9 whitespace-separated digits representing the crafting
-- recipe (1-3: first row, 4-6: second row, 7-9: third row).
--
-- Since Minetest purposely illogically ignores empty slots around shaped
-- recipes the first digit is always the crafting addition.
--
-- For distinguishing between the individual sections a third crafting addition
-- is used at a defined position.
--
-- This allows 7 different sections with 128 different objects within each of
-- the sections (1-7 nodes plus the two crafting additions).
_xtend.v.xfurniture.recipe_patterns = {

    -- Benches & Couches (2)          o     1  2  4  8  16 32 64
    couch_frame_bars              =  'a  a  x  _  _  _  _  _  _', 
    couch_frame_corner_inverted   =  'a  a  _  x  _  _  _  _  _', 
    couch_frame_corner_regular    =  'a  a  x  x  _  _  _  _  _', 
    couch_frame_u                 =  'a  a  _  _  x  _  _  _  _', 
    couch_seat_center             =  'a  a  x  _  x  _  _  _  _', 
    couch_seat_corner             =  'a  a  _  x  x  _  _  _  _', 
    couch_seat_end_end            =  'a  a  x  x  x  _  _  _  _', 
    couch_seat_end_left           =  'a  a  _  _  _  x  _  _  _', 
    simple_bench_inner_part       =  'a  a  x  _  _  x  _  _  _', 
    simple_bench_inner_part       =  'a  a  _  x  _  x  _  _  _', 
    simple_bench_inner_pole_part  =  'a  a  x  x  _  x  _  _  _', 
    simple_bench_left_part        =  'a  a  _  _  x  x  _  _  _', 
    simple_bench_right_part       =  'a  a  x  _  x  x  _  _  _', 

    -- Interior (3)                        o  1     2  4  8  12 32 64
    simple_chair                       =  'a  x  a  _  _  _  _  _  _',
    simple_chair_seat_cover            =  'a  _  a  x  _  _  _  _  _',
    simple_table                       =  'a  x  a  x  _  _  _  _  _',
    small_table                        =  'a  _  a  _  x  _  _  _  _',
    large_table_corner                 =  'a  x  a  _  x  _  _  _  _',
    large_table_edge                   =  'a  _  a  x  x  _  _  _  _',
    large_table_inner_part             =  'a  x  a  x  x  _  _  _  _',
    office_table                       =  'a  _  a  _  _  x  _  _  _',
    office_table_side_extension_left   =  'a  x  a  _  _  x  _  _  _',
    office_table_side_extension_right  =  'a  _  a  x  _  x  _  _  _',

    -- Window stuff (4)             o  1  2     4  8  16 32 64
    window_screen_bars          =  'a  x  _  a  _  _  _  _  _',
    window_screen_frame_part    =  'a  _  x  a  _  _  _  _  _',
    window_screen_frame_corner  =  'a  x  x  a  _  _  _  _  _',
    window_sill_sill_part       =  'a  _  _  a  x  _  _  _  _',
    window_sill_end_part_right  =  'a  x  _  a  x  _  _  _  _',
    window_sill_end_part_left   =  'a  _  x  a  x  _  _  _  _',

    -- Stairs and slabs (5)              o  1  2  4     8  16 32 64
    stair_two_steps                  =  'a  x  _  _  a  _  _  _  _',
    stair_two_steps_inset_corner     =  'a  _  x  _  a  _  _  _  _',
    stair_two_steps_outset_corner    =  'a  x  x  _  a  _  _  _  _',
    stair_three_steps                =  'a  _  _  x  a  _  _  _  _',
    stair_three_steps_inset_corner   =  'a  x  _  x  a  _  _  _  _',
    stair_three_steps_outset_corner  =  'a  _  x  x  a  _  _  _  _',
    slab_half_node                   =  'a  x  x  x  a  _  _  _  _',
    slab_half_node_lowered           =  'a  _  _  _  a  x  _  _  _',

    -- Walls (6)                         o  1  2  4  8     16 32 64
    wall_wb                          =  'a  x  _  _  _  a  _  _  _',
    wall_we                          =  'a  _  x  _  _  a  _  _  _',
    wall_wt                          =  'a  x  x  _  _  a  _  _  _',
    wall_web                         =  'a  _  _  x  _  a  _  _  _',
    wall_wee                         =  'a  x  _  x  _  a  _  _  _',
    wall_wet                         =  'a  _  x  x  _  a  _  _  _',
    wall_wcb                         =  'a  x  x  x  _  a  _  _  _',
    wall_wce                         =  'a  _  _  _  x  a  _  _  _',
    wall_wct                         =  'a  x  _  _  x  a  _  _  _',
    wall_wtjb                        =  'a  _  x  _  x  a  _  _  _',
    wall_wtje                        =  'a  x  x  _  x  a  _  _  _',
    wall_wtjt                        =  'a  _  _  x  x  a  _  _  _',
    pole_pb                          =  'a  x  _  x  x  a  _  _  _',
    pole_pe                          =  'a  _  x  x  x  a  _  _  _',
    pole_pt                          =  'a  x  x  x  x  a  _  _  _',
    pole_wb_pb                       =  'a  _  _  _  _  a  x  _  _',
    pole_we_pe                       =  'a  x  _  _  _  a  x  _  _',
    pole_wt_pt                       =  'a  _  x  _  _  a  x  _  _',
    pole_wcb_pb                      =  'a  x  x  _  _  a  x  _  _',
    pole_wce_pe                      =  'a  _  _  x  _  a  x  _  _',
    pole_wct_pt                      =  'a  x  _  x  _  a  x  _  _',
    pole_wtjb_pb                     =  'a  _  x  x  _  a  x  _  _',
    pole_wtje_pe                     =  'a  x  x  x  _  a  x  _  _',
    pole_wtjt_pt                     =  'a  _  _  _  x  a  x  _  _',
    pole_web_pb                      =  'a  x  _  _  x  a  x  _  _',
    pole_wee_pe                      =  'a  _  x  _  x  a  x  _  _',
    pole_wet_pt                      =  'a  x  x  _  x  a  x  _  _',
    torch_holder_wb_thf              =  'a  _  _  x  x  a  x  _  _',
    torch_holder_wb_thf_thb          =  'a  x  _  x  x  a  x  _  _',
    torch_holder_we_thf              =  'a  _  x  x  x  a  x  _  _',
    torch_holder_we_thf_thb          =  'a  x  x  x  x  a  x  _  _',
    torch_holder_wcb_thl             =  'a  _  _  _  _  a  _  x  _',
    torch_holder_wcb_pb_thl_thb      =  'a  x  _  _  _  a  _  x  _',
    torch_holder_wce_pe_thl          =  'a  _  x  _  _  a  _  x  _',
    torch_holder_wce_pe_thl_thb      =  'a  x  x  _  _  a  _  x  _',
    torch_holder_pb_thf              =  'a  _  _  x  _  a  _  x  _',
    torch_holder_pb_thf_thb          =  'a  x  _  x  _  a  _  x  _',
    torch_holder_pb_thf_thl          =  'a  _  x  x  _  a  _  x  _',
    torch_holder_pb_thf_thl_thr      =  'a  x  x  x  _  a  _  x  _',
    torch_holder_pb_thf_thb_thl_thr  =  'a  _  _  _  x  a  _  x  _',
    torch_holder_pb_thf              =  'a  x  _  _  x  a  _  x  _',
    torch_holder_pb_thf_thb          =  'a  _  x  _  x  a  _  x  _',
    torch_holder_pb_thf_thl          =  'a  x  x  _  x  a  _  x  _',
    torch_holder_pb_thf_thl_thr      =  'a  _  _  x  x  a  _  x  _',
    torch_holder_pb_thf_thb_thl_thr  =  'a  x  _  x  x  a  _  x  _',
    torch_holder_web_pb_thr          =  'a  _  x  x  x  a  _  x  _',
    torch_holder_web_pb_thf          =  'a  x  x  x  x  a  _  x  _',
    torch_holder_web_pb_thb          =  'a  _  _  _  _  a  x  x  _',
    torch_holder_web_pb_thf_thb      =  'a  x  _  _  _  a  x  x  _',
    torch_holder_web_pb_thf_thr      =  'a  _  x  _  _  a  x  x  _',
    torch_holder_web_pb_thb_thr      =  'a  x  x  _  _  a  x  x  _',
    torch_holder_wee_pe_thr          =  'a  _  _  x  _  a  x  x  _',
    torch_holder_wee_pe_thf          =  'a  x  _  x  _  a  x  x  _',
    torch_holder_wee_pe_thb          =  'a  _  x  x  _  a  x  x  _',
    torch_holder_wee_pe_thf_thb      =  'a  x  x  x  _  a  x  x  _',
    torch_holder_wee_pe_thf_thr      =  'a  _  _  _  x  a  x  x  _',
    torch_holder_wee_pe_thb_thr      =  'a  x  _  _  x  a  x  x  _',

    -- Temporary solutions (9)
    --
    -- ud_ = Upside-down variant
    --                                      o  1  2  4  8  16 32 64
    ud_stair_two_steps                  =  'a  x  _  _  _  _  _  _  a',
    ud_stair_three_steps                =  'a  _  x  _  _  _  _  _  a',
    ud_stair_two_steps_inset_corner     =  'a  x  x  _  _  _  _  _  a',
    ud_stair_two_steps_outset_corner    =  'a  _  _  x  _  _  _  _  a',
    ud_stair_three_steps_inset_corner   =  'a  x  _  x  _  _  _  _  a',
    ud_stair_three_steps_outset_corner  =  'a  _  x  x  _  _  _  _  a',

}
