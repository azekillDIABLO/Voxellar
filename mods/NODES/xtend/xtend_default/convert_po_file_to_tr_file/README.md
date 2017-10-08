This WIP conversion script converts a regular PO file used for system independent translations (usually compiled to a MO file and used with Gettext) into a Minetest-specific TR file.

The syntax is `./convert_po_file_to_tr_file.lua namespace source.po` and this will convert the `source.po` file into a `source.tr` file. The TR file will always be created in the directory the PO file is located.

If there already is a `source.tr` file this file will be overwritten without any further notice. All contents in that file will be lost forever, so better make a backup of all your data!

See [this Minetest forums post](https://forum.minetest.net/viewtopic.php?t=18349) for details.
