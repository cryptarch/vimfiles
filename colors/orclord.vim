" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Tim Rice <t.rice@ms.unimelb.edu.au>
" Last Change:	2012 Apr 17

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "orclord"
hi Normal     ctermfg=Gray
hi Comment    ctermfg=88
hi Constant cterm=bold ctermfg=245
hi Special ctermfg=DarkMagenta
hi Identifier cterm=bold            ctermfg=28
hi PreProc       ctermfg=28
hi Statement     cterm=bold   ctermfg=166
hi Repeat       ctermfg=166
hi Type           ctermfg=94
hi Function  cterm=bold ctermfg=30
hi Operator                ctermfg=Red
hi Ignore                ctermfg=234
hi Error    ctermbg=88 ctermfg=White
hi Todo    ctermbg=88 ctermfg=Black
hi Folded   ctermbg=52 ctermfg=Black
hi VertSplit cterm=NONE ctermbg=Black ctermfg=52 
hi StatusLine cterm=NONE ctermbg=Black ctermfg=Red
hi StatusLineNC cterm=NONE ctermbg=Black ctermfg=52
hi NonText     ctermfg=52

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String	Constant
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
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
