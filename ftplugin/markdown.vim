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
nnoremap <buffer> <C-B> ciw**<Esc>P
vnoremap <buffer> <C-B> xi* <Esc>vPa*<Esc>gv

" Navigation
nnoremap <buffer> { ?^[[:space:]]*$\n^[[:print:]]?e<CR>
nnoremap <buffer> } /[[:print:]]$\n^[[:space:]]*$<CR>
