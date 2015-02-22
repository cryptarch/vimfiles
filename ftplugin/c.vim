runtime helpers/CComments.vim

if filereadable("Makefile")
    nnoremap #3 :w \|! make -j4<CR>
endif
