local table_contains = function(table, element)
    for i,v in pairs(table) do
        if v == element then return true end
    end

    return false
end


local to_be_ignored = function(name)
    for _,regex in pairs(_xtend.v.xfurniture.blacklist) do
        if name:match(regex) ~= nil then return true end
    end
    return false
end


local get_nodes = function()
    local nodes = {}

    for name,def in pairs(minetest.registered_nodes) do
        if def.drawtype == 'normal' and to_be_ignored(name) == false then
            nodes[name] = def
        end
    end

    for name in _xtend.g('xfurniture_additional_nodes'):gmatch('%S+') do
        if minetest.registered_nodes[name] ~= nil then
            nodes[name] = minetest.registered_nodes[name]
        end
    end

    return nodes
end

_xtend.v.xfurniture.nodes = get_nodes()


-- Get nodes per category
--
-- @return table A table containing all xFurniture objects (nodes) ordered by
--               their category (ID without prefix and material information).
_xtend.f.xfurniture.get_nodes_per_category = function ()
    local res = {}

    for id,def in pairs(minetest.registered_nodes) do
        if def.groups['_xfurniture_category'] then
            local category = 'category_'..def.groups['_xfurniture_category']
            if not res[category] then res[category] = {} end
            res[category][id] = def
        end
    end

    return res
end



