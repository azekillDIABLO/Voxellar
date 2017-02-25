echo listing = { > list.lua
FOR /F %%I IN ('dir /b sounds\') DO echo "%%I", | FIND ".ogg" >> list.lua
echo      } >> list.lua