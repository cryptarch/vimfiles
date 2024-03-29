" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'orclord'

hi fgBone                                           ctermfg=250                                 guifg=#bcbcbc
hi fgOvercast                                       ctermfg=244                                 guifg=#808080
hi fgBoldOvercast       cterm=bold                  ctermfg=244     gui=bold                    guifg=#808080
hi fgStorm                                          ctermfg=245
hi fgBoldStorm          cterm=bold                  ctermfg=237     gui=bold
hi fgBruise                                         ctermfg=127
hi fgBoldBruise         cterm=bold                  ctermfg=127     gui=bold
hi fgSlime                                          ctermfg=65
hi fgBoldSlime          cterm=bold                  ctermfg=65      gui=bold
hi fgRust               cterm=NONE  ctermbg=Black   ctermfg=52      gui=NONE    guibg=#000000   guifg=#600000 
hi bgRust                           ctermbg=52      ctermfg=Black               guibg=#5f0000   guifg=#000000
hi hellrunes                        ctermbg=233     ctermfg=52                  guibg=#121212   guifg=#600000
hi bgSlime                          ctermbg=22      ctermfg=Black               guibg=#005f00   guifg=#000000
hi fgBlood                                          ctermfg=88                                  guifg=#800000
hi bgBlood                          ctermbg=88      ctermfg=Black               guibg=#870000   guifg=#000000
hi bgInfection                      ctermbg=88      ctermfg=White               guibg=#870000   guifg=#ffffff
hi fgRed                cterm=NONE  ctermbg=Black   ctermfg=Red     gui=NONE    guibg=#000000   guifg=#ff0000
hi fgForest                                         ctermfg=28                                  guifg=#008000
hi fgBoldForest         cterm=bold                  ctermfg=28      gui=bold                    guifg=#008000
hi fgAftermath                                      ctermfg=130                                 guifg=#a06000
hi fgBoldAftermath      cterm=bold                  ctermfg=130     gui=bold                    guifg=#a06000
hi fgBurn                                           ctermfg=166                                 guifg=#d06000
hi fgBoldBurn           cterm=bold                  ctermfg=166     gui=bold                    guifg=#d06000
hi fgWaste                                          ctermfg=94                                  guifg=#906000
hi fgStagnantPond                                   ctermfg=30                                  guifg=#008080
hi fgBoldStagnantPond   cterm=bold                  ctermfg=30      gui=bold                    guifg=#008080
hi fgFecund                                         ctermfg=125                                 guifg=#a00060
hi fgBoldFecund         cterm=bold                  ctermfg=125     gui=bold                    guifg=#a00060
hi bgGloom                          ctermbg=234                                 guibg=#101010
hi bgForest                         ctermbg=28                                  guibg=#008000
hi bgStagnantPond                   ctermbg=30                                  guibg=#008080
hi bgAftermath                      ctermbg=130     ctermfg=Black               guibg=#a06000   guifg=#000000
hi bgBurn                           ctermbg=166     ctermfg=White               guibg=#d06000   guifg=#ffffff
hi bgOvercast                       ctermbg=244     ctermfg=Black               guibg=#808080   guifg=#000000

hi! link Comment                fgBlood
hi! link Constant               fgBoldBurn
hi! link Special                fgBruise
hi! link Identifier             fgBoldForest
hi! link PreProc                fgForest
hi! link Statement              fgBurn
hi! link Repeat                 fgBurn
hi! link Type                   fgWaste
hi! link Function               fgStagnantPond
hi! link Block                  fgStagnantPond
hi! link Operator               fgFecund
hi! link Error                  bgInfection
hi! link Todo                   bgBlood
hi! link Folded                 hellrunes
hi! link VertSplit              fgRust
hi! link StatusLine             fgRed
hi! link StatusLineNC           fgRust
hi! link NonText                fgRust
hi! link Search                 bgSlime
hi! link ColorColumn            bgGloom

hi! link cTerminator            fgAftermath
hi! link cIncluded              fgBoldBruise
hi! link Bracket                fgBruise
hi! link Argument               fgForest

hi! link FoldColumn             fgRed
hi! link DiffAdd                bgSlime
hi! link DiffDelete             bgRust
hi! link DiffChange             bgAftermath
hi! link DiffText               bgBurn
hi! link SpecialKey             Ignore

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String	                fgBoldOvercast
hi link Character	            fgBoldBurn
hi link Number	                fgSlime
hi link Boolean	                fgBoldStagnantPond
hi link Float		            Number
hi link Conditional	            Repeat
hi link Label		            Statement
hi link Keyword	                Statement
hi link Exception	            Statement
hi link Include	                PreProc
hi link Define	                PreProc
hi link Macro		            PreProc
hi link PreCondit	            PreProc
hi link StorageClass	        Type
hi link Structure	            Type
hi link Typedef	                Type
hi link Tag		                Special
hi link SpecialChar	            Special
hi link Delimiter	            Special
hi link SpecialComment          Special
hi link Debug		            Special
hi link Hyperlink               Identifier

hi link shFunction              Function
hi link shBlock                 Block
hi link cFunction               Function
hi link cBlock                  Block

" Spelling highlights.
hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal
hi SpellBad ctermfg=Red
hi SpellCap cterm=underline

" ins-completion popupmenu
hi! link Pmenu                  bgOvercast
hi! link PmenuSel               bgBurn

" GitGutter highlights.
hi! link GitGutterAdd           fgStagnantPond
hi! link GitGutterChange        fgWaste
hi! link GitGutterDelete        fgRust
hi! link GitGutterChangeDelete  fgBurn

" Markdown
hi! link Title                  fgBoldFecund

" Worklog
hi! link MiscBlock              fgStorm
