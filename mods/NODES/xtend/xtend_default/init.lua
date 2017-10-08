--- Global table definitions.
--
-- All functions, variables, and tables are held in a single global table
-- prefixed `_xtend` for uniqueness.
_xtend = {}     -- global table creation
_xtend.v = {}   -- variables used by mods
_xtend.f = {}   -- quasiglobal functions
_xtend.p = {}   -- mod paths for global access
_xtend.s = {}   -- settings (defaults read from settingtypes.txt files)


-- Initiate an xTend based mod.
--
-- For loading and parsing the configuration, and setting other stuff, all
-- xTend based mods need to initiate themselves by running this function first
-- and providing the mod name.
--
-- @return void
_xtend.i = function ()
    local name = minetest.get_current_modname()
    local path = minetest.get_modpath(name)
    local filename = path..DIR_DELIM..'settingtypes.txt'
    local file = io.open(filename, 'rb')

    if file ~= nil then
        local lines = {}
        for line in file:lines() do
            if line:match("^([a-zA-Z])") then
                local name = line:gsub(' .+', '')
                local value = line:gsub('^[^ ]+ %b() %a+ ', '')
                if value == line then value = '' end
                _xtend.s[name] = value
            end
        end
    end

    _xtend.v[name] = {}
    _xtend.f[name] = {}
    _xtend.p[name] = path..DIR_DELIM
end
_xtend.i() -- init self


--- Get a configuration or default value.
--
-- Because Minetest does not provide a valid and sane way to get a value from
-- the configuration or – if not present – get a given default value instead,
-- this function exists. It searches the configuration for a value and if the
-- value does not exist it returns the default value defined in this modpack’s
-- `settingtypes.txt` file instead.
--
-- @param value             The descriptor of the value in question
-- @return string|int|bool  The configuration value or the default value
_xtend.g = function (value, force_default)
    if force_default ~= true then
        local v = minetest.setting_get(value)
        return (v == nil and _xtend.s[value] or v)
    else
        return _xtend.s[value]
    end
end


--- Colorize the given text
--
-- Colors the given text in the set color and resets the color to the set reset
-- color and returns the result if colorization is enabled. If not enabled this
-- function simply returns the given text without any changes.
--
-- Attention mod authors: Use with care! Do not overdo it! :)
--
-- @param text    The text that has to be colorized if enabled
-- @return string The colored (or not colored) text
_xtend.c = function (text)
    if _xtend.g('xtend_default_enable_colorization') == 'true' then
        local color = '#'.._xtend.g('xtend_default_colorization_color')
        local reset = '#'.._xtend.g('xtend_default_reset_color')
        local color_escape = minetest.get_color_escape_sequence(color)
        local reset_escape = minetest.get_color_escape_sequence(reset)
        return color_escape..text..reset_escape
    else
        return text
    end
end


--- Return a translated string.
--
-- Since there currently is no valid convenient way to translate mods (nor
-- is gettext used to translate mod strings) this function only returns
-- the given string. It will be updated/altered as soon as the is a way
-- to translate mods without 3d party mods/libraries.
--
-- @param string   The string that is to be translated
-- @return result  A two values return. 1) the translated string, 2) the
--                 untranslated original string.
_xtend.t = function (string)
    local original = string
    local translated = string -- Will be actually translated if MT allows it
    return translated,original
end


-- Output a debug message.
--
-- Checks if debugging messages are enabled and if so reads and parses the
-- given debug message format and prints a debug message wherever the function
-- is called.
--
-- @param information The information to be shown
-- @return void
_xtend.d = function (information)
    if _xtend.g('xtend_default_debug') == 'false' then return end
    local current_mod = minetest.get_current_modname()
    local string = _xtend.g('xtend_default_debug_format'):gsub('+.', {
        ['+i'] = information,
        ['+m'] = current_mod,
        ['+M'] = string.upper(current_mod),
        ['+n'] = '\n',
        ['+t'] = os.date('%H:%M:%S')
    })
    print(string)
end
