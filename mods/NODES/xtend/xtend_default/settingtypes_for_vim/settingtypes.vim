" Vim syntax file
" Language: Minetest settingtypes.txt syntax
" Maintainer: Dirk Sohler
" Latest Revision: 24. November 2016

if exists("b:current_syntax")
	finish
endif


" Match
syn match settings          "^[0-9a-zA-Z_.]*"
syn match sections          /^\[.*\]$/
syn match comments          "^#.*$"
syn match commonKeywords    "\(int\|string\|bool\|float\|enum\)"
syn match specialKeywords   "\(path\|key\|flags\|noise_params\)"
syn match numbers           " [0-9a-f.,E ]*$"
syn match descriptions      "(.*)"
syn match boolean_true      "\strue$"  "likely
syn match boolean_false     "\sfalse$" "likely, too ... :)

" Style
hi link sections         Label
hi link comments         Comment
hi link settings         Tag
hi link commonKeywords   Identifier
hi link specialKeywords  Identifier
hi link numbers          Number
hi link descriptions     Ignore
hi link boolean_true     Question
hi link boolean_false    Title

let b:current_syntax = "settingtypes"
