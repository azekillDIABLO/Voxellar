_xtend.f.xfurniture.pattern_to_recipe = function(node, id)
    local _pattern_string = _xtend.v.xfurniture.recipe_patterns[id];
    local _pattern_table = {}
    local _recipe = {{},{},{}}

    if _pattern_string == nil then
        return {{{node,'ca','ca'},{'ca','ca','ca'},{'ca','ca','ca'}}, id}
    end

    for field in string.gmatch(_pattern_string, '%S') do
        local thing
        if field == '_' then thing = '' end
        if field == 'a' then thing = 'ca' end
        if field == 'x' then thing = node end
        table.insert(_pattern_table, thing)
    end

    _recipe[1][1] = _pattern_table[1]
    _recipe[1][2] = _pattern_table[2]
    _recipe[1][3] = _pattern_table[3]
    _recipe[2][1] = _pattern_table[4]
    _recipe[2][2] = _pattern_table[5]
    _recipe[2][3] = _pattern_table[6]
    _recipe[3][1] = _pattern_table[7]
    _recipe[3][2] = _pattern_table[8]
    _recipe[3][3] = _pattern_table[9]

    return {_recipe, id}
end
