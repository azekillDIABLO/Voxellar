#!/bin/bash
echo "listing={" > list.lua
ls sounds/ | awk '{ print"\"",$1,"\"," }' >> list.lua
echo "        }" >> list.lua
