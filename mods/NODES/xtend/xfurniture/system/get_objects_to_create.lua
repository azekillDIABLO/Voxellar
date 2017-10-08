local option = 'xfurniture_objects_to_register'
local objects_flag = _xtend.g(option):match("^[(%w+,_+)]*")
local all_objects = _xtend.g(option, true):match("[(%w+,_+)]*$")
local objects = ''
local infotext = ''

if objects_flag == 'all' then
    objects = all_objects
    infotext = _xtend.t('all registered objects')
else
    objects = objects_flag
    infotext = objects_flag
end

for objectclass in objects:gmatch('([^,]+)') do
    dofile(_xtend.p.xfurniture..'furniture'..DIR_DELIM..objectclass..'.lua')
end

_xtend.d(_xtend.t('Objects to create: +o'):gsub('+o', infotext))
