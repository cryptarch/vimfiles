runtime helpers/CComments.vim

if filereadable('Makefile')
    nnoremap <buffer> #3 :write \|! make -j4<CR>
endif
