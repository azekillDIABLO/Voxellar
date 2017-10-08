_xtend.i()


dofile(_xtend.p.xvessels..'registering_function.lua')
local register_path = _xtend.p.xvessels..'register'..DIR_DELIM


-- Register
dofile(register_path..'default.lua')
dofile(register_path..'drinks.lua')
