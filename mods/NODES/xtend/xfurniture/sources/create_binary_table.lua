#!/usr/bin/env luajit


-- Convert a decimal number to a binary number.
--
-- @param decimal The decimal number you want to convert
-- @return string Binary string of the given decimal number
local convert_to_binary = function(decimal)
    local binary = {}
    while decimal > 0 do
        local rest = math.fmod(decimal, 2)
        binary[#binary + 1] = rest
        decimal = (decimal - rest) / 2
    end
    return table.concat(binary)
end


-- Output the recipe pattern.
--
-- The pattern lines contain the pattern and all the necessary parts to copy
-- and paste the result into the Lua file so you only need to add the IDs in
-- the order you want.
--
-- @param binary  The binary representation of the recipe pattern
-- @param section The section you want to create the patterns for
-- @return void
local output = function(binary, section, current)
    local replaced = ('a'..binary..string.rep('_', 7 - #binary)):gsub('.', {
        ['0'] = '_',
        ['1'] = 'x'
    })
    local first_part = string.sub(replaced, 1, section-1)
    local second_part = string.sub(replaced, section, -1)
    local pattern = (first_part..'a'..second_part):gsub('.','%1  ')
    local suffix = arg[3] == 'true' and '  -- '..current or ''
    print('    =  \''..pattern:gsub('^%s*(.-)%s*$', '%1')..'\','..suffix)
end


-- Print the recipe patterns header
--
-- Prints the section header containing the decimal representations of the
-- reciepe pattern fields and prefixes it with the section number.
--
-- @param section The section you want to print the header for
-- @return void
local print_header = function(section)
    local fields = {'1  ','2  ','4  ','8  ','16 ','32 ','64'}
    table.insert(fields, section-1, '   ')
    print('-- ('..section..')  o  '..table.concat(fields))
end


if arg[1] == nil or arg[2] == nil then
    print('\nArguments missing call like the following example.')
    print('\n'..arg[0]..' A B C\n')
    print('    |  Needed   Value      Description')
    print(' ---+-----------------------------------------------------')
    print('  A |  YES      2 to 9     Sets the section to create for')
    print('  B |  YES      0 to 127   Defines the amount of patterns')
    print('  C |  no       true       Use pattern counter\n')
    print('Parameter C is a literal "true" (sans quotes) and when set it adds')
    print('a pattern counter printing the current number of the individual')
    print('lines at line end (as a Lua comment).\n')
    return
end


local section = tonumber(arg[1])
local total = tonumber(arg[2])
local current = 0


if total > 127 then print('127 is the maximum') return end
if section < 2 then print('Lowest section indicator is 2') return end
if section > 9 then print('Highest section indicator is 9') return end


print_header(section)


while current<total do
    current = current + 1
    output(convert_to_binary(current), section, current)
end
