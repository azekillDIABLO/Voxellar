local _nodes = 0
local _categories = 0
local _base_nodes = 0
local _objects = 0


for category,nodes in pairs(_xtend.v.xfurniture.nodes_per_category) do
    _categories = _categories + 1
    for _,node in pairs(nodes) do _nodes = _nodes + 1 end
end

for x,y in pairs(_xtend.v.xfurniture.nodes) do _base_nodes = _base_nodes + 1 end
for x,y in pairs(_xtend.v.xfurniture.recipe_patterns) do _objects=_objects+1 end


_xtend.d(_xtend.t('Created +o objects each from +b base nodes'):gsub('+.', {
    ['+o'] = _objects,
    ['+b'] = _base_nodes
}))

_xtend.d(_xtend.t('+n furniture nodes in +c categories'):gsub('+.', {
    ['+c'] = _categories,
    ['+n'] = _nodes
}))

_xtend.d(_xtend.t('Mod fully loaded'))
