scriptencoding utf-8
runtime helpers/FormatText.vim
runtime helpers/GrammarCheck.vim
runtime helpers/SmallTabs.vim

" Don't look up any keywords.
noremap <buffer> K <NOP>

nnoremap <buffer> #3 :write \|! markdown % > %.html<CR><CR>
noremap <buffer> <localleader><localleader> :s/^/> /<CR>

" Headings
nnoremap <buffer> <localleader>H o====<ESC>
nnoremap <buffer> <localleader>h o----<ESC>
nnoremap <buffer> <localleader>p :s/^/### /g<CR>

" Format text
nnoremap <buffer> <localleader>b ciw**<Esc>P
vnoremap <buffer> <localleader>b xi* <Esc>vPa*<Esc>gv

" Navigation
nnoremap <buffer> { ?^[[:space:]]*$\n^[[:print:]]?e<CR>
nnoremap <buffer> } /[[:print:]]$\n^[[:space:]]*$<CR>

iabbrev <buffer> \--\ —

" Checklist mgmt
if exists('g:loaded_checklist')
    nnoremap <localleader><Space> :ChecklistToggleCheckbox<cr>
    vnoremap <localleader><Space> :ChecklistToggleCheckbox<cr>

    nnoremap <localleader>y :ChecklistEnableCheckbox<cr>
    vnoremap <localleader>y :ChecklistEnableCheckbox<cr>

    nnoremap <localleader>n :ChecklistDisableCheckbox<cr>
    vnoremap <localleader>n :ChecklistDisableCheckbox<cr>
endif


" Grab inline code
onoremap ` i`
