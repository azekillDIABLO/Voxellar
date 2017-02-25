function getlist()
	print("rand_play sound list:")
	for temp,list in pairs(listing) do
		randplayx[y]=string.gsub(list,".ogg","")
		print(randplayx[y])
		total=temp
		y=y+1
	end
end

function songloop()
		randomfile=math.random(total)
		if randomfile==tester then randomfile=randomfile+1 end
		if randomfile>total then randomfile=1 end
		tester=randomfile
		-- print("now playing - "..randplayx[randomfile])
		minetest.log("info","[rand_play] Now playing: "..randplayx[randomfile])
		local handle = minetest.sound_play(randplayx[randomfile], {gain = playvol})
		minetest.after(longest, function()
			minetest.sound_stop(handle)
			end)
		minetest.after((longest+10), function()
			songloop()
			end)
end
