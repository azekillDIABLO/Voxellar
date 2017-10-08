local entry_counter = 0
local blacklist_string = _xtend.g('xfurniture_blacklist')

for regex in blacklist_string:gmatch('[^ # ]+') do
    entry_counter = entry_counter + 1
    table.insert(_xtend.v.xfurniture.blacklist, regex)
end

if blacklist_string ~= '' and entry_counter == 0 then
    entry_counter = 1
    table.insert(_xtend.v.xfurniture.blacklist, blacklist_string)
end

if entry_counter > 0 then
    _xtend.d(_xtend.t('Blacklist entries: +e'):gsub('+e',entry_counter))
end
