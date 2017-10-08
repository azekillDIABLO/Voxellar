This mod is a helper mod/library/tool for all of the xTend mods. It provides some helper functions and creates the global `_xtend` table. As a player you don't need to care about what this mod does.

# Technical documentation
As a mod developer you might want to create a mod depending on `xtend_default` and add the following to our `init.lua` fil;e to see the structure of the global `_xtend` table.

    _xtend.i()
    print(dump(_xtend))

Usually you should only write in `_xtend.f.mymodname` and `_xtend.v.mymodname` and use the provided functions.

## Global `_xtend` table
The global `_xtend` table is used for "pseudoglobal" variables and allows inter-mod communication and easy modification of the stuff that is used by the xTend mods.

See the sections as open namespace. You can store your stuff wherever you want and you can read whatever you want but you should limit yourself to only read from and write to your own mod's namespace.

### Sections of the table
#### _xtend.v
This section contains all variables that are used as by the individual mods. Each mod has it's own section `_xtend.v.modname`. The mods can add variables or more sections as they need. It is advised that no large tables are stored there for not bloating the global table too much.

#### _xtend.f
Same as `_xtend.v` but for functions that can be used by other mods. Here mods also get their own section. It is advised not to use this section for helper functions and stuff but only for "API-like" functions for not unnecessarily bloating the table.

#### _xtend.p
Provides the mod paths for the individual mods. Mod paths can be referenced even on runtime (not possible under normal circumstances) and there is no need to call `minetest.get_modpath()` all the time during load time.

#### _xtend.s
Stores the `settingtypes.txt` default values. They will be used by `_xtend.g()` for loading the default value if there is no value set via Minetest's advanced configuration. Don't forget to properly prefix your custom configuration options.

### Globally provided functions
#### _xtend.g('option')
Returns either the default value for `option` or the configured value. The default values are taken from the `_xtend.v` table.

#### _xtend.t('String')
When supported one day in the future this will return two values: 1) The given string translated to the desired language within the textdomain of the mod (or the string itself if there is no translation available). 2) The given string as it is for whatever reason it will be used.

Currently there is no built-in translation system for mods available so this function only returns the given string twice.

#### _xtend.d('Message')
When enabled in the advanced settings for this mod this function returns a debug string (can be configured in the advanced settings, too) wherever the function is called.

#### _xtend.i()
Initiates a mod. That means that this function creates all the necessary "sections" in the global `_xtend` table and populates them with the mod's path, the configuration options, etc.

This function call is best placed in the first line of the individual mod's `init.lua` file.
