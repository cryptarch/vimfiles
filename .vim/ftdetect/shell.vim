" For `set -o vi' mode in bash.
augroup bash
    autocmd!
    autocmd BufRead,BufNewFile bash-fc-* set filetype=sh
    autocmd BufRead,BufNewFile *bash_aliases set filetype=sh
    autocmd BufRead,BufNewFile *bashrc set filetype=sh
augroup END
