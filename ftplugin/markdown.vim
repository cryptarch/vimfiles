runtime helpers/FormatText.vim
runtime helpers/GrammarCheck.vim
runtime helpers/SmallTabs.vim

noremap #3 :w \|! markdown % > %.html<CR><CR>
noremap - :s/^/> /<CR>
nnoremap mH o====<ESC>
nnoremap mh o----<ESC>
nnoremap mp :s/^/### /g<CR>
vnoremap mp :s/^/### /g<CR>
nnoremap <C-B> ciw**<Esc>P
vnoremap <C-B> xi* <Esc>vPa*<Esc>gv
nnoremap { ?^[[:space:]]*$\n^[[:print:]]?e<CR>
nnoremap } /[[:print:]]$\n^[[:space:]]*$<CR>
inoremap <C-_> ―
