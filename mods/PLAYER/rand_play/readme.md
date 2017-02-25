# rand_play
Random background music player

Add music to the sounds directory. Minetest only accepts ogg format at this time.
Do not use extra dots/periods in files names. It will not read them correctly.
Add music file names to list.lua according to the format in the examples list.

It will only randomly select those files accordingly. See sample files for example naming.

options in config.lua are commented to explain the use.
Definitely set them up first before using.

The batch and shell scripts included can be used to automatically create the list from the files in the sounds folder.
Or you can add and remove manually. Will only play those on the list.

NOTE: Be careful how much you put into the sounds folder, minetest will load them all. A large set of sounds will cause
very long loading times for the client.