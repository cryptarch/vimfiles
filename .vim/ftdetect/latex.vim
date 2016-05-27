augroup latex
    autocmd!
    autocmd BufRead,BufNewFile *.bib set filetype=bib
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd BufRead,BufNewFile *.cls set filetype=tex
augroup END
