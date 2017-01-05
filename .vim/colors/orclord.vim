" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "orclord"

hi Normal ctermfg=250
hi fgOvercast ctermfg=244
hi fgBoldOvercast cterm=bold ctermfg=244
hi fgStorm ctermfg=245
hi fgBoldStorm cterm=bold ctermfg=237
hi fgBruise ctermfg=127
hi fgBoldBruise cterm=bold ctermfg=127
hi fgSlime ctermfg=65
hi fgBoldSlime cterm=bold ctermfg=65
hi fgRust cterm=NONE ctermfg=52 guifg=#5f0000 ctermbg=Black
hi bgRust ctermbg=52 ctermfg=Black
hi hellrunes ctermbg=233 ctermfg=52
hi bgSlime ctermbg=22 ctermfg=Black
hi fgBlood ctermfg=88 guifg=#870000
hi bgBlood ctermbg=88 ctermfg=Black
hi bgInfection ctermbg=88 ctermfg=White
hi fgRed ctermfg=Red cterm=NONE ctermbg=Black
hi fgForest ctermfg=28
hi fgBoldForest cterm=bold ctermfg=28
hi fgAftermath ctermfg=130
hi fgBoldAftermath cterm=bold ctermfg=130
hi fgBurn ctermfg=166
hi fgBoldBurn cterm=bold ctermfg=166
hi fgWaste ctermfg=94
hi fgStagnantPond ctermfg=30
hi fgBoldStagnantPond cterm=bold ctermfg=30
hi fgFecund ctermfg=125
hi bgGloom ctermbg=234

hi! link Comment fgBlood
hi! link Constant fgBoldBurn
hi! link Special fgBruise
hi! link Identifier fgBoldForest
hi! link PreProc fgForest
hi! link Statement fgBoldBurn
hi! link Repeat fgBurn
hi! link Type fgWaste
hi! link Function fgStagnantPond
hi! link Block fgStagnantPond
hi! link Operator fgFecund
hi! link Ignore fgStorm
hi! link Error bgInfection
hi! link Todo bgBlood
hi! link Folded hellrunes
hi! link VertSplit fgRust
hi! link StatusLine fgRed
hi! link StatusLineNC fgRust
hi! link NonText fgRust
hi! link Search bgSlime
hi! link ColorColumn bgGloom

hi! link cTerminator fgAftermath
hi! link cIncluded fgBoldBruise
hi! link Bracket fgBruise
hi! link Argument fgForest

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String	fgBoldOvercast
hi link Character	fgBoldBurn
hi link Number	fgBoldSlime
hi link Boolean	fgBoldStagnantPond
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
hi link Hyperlink   Identifier

hi link shFunction  Function
hi link shBlock  Block
hi link cFunction   Function
hi link cBlock  Block

" Spelling highlights.
hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal
hi SpellBad ctermfg=Red
hi SpellCap cterm=underline

" GitGutter highlights.
hi! link GitGutterAdd fgStagnantPond
hi! link GitGutterChange fgWaste
hi! link GitGutterDelete fgRust
hi! link GitGutterChangeDelete fgBurn
