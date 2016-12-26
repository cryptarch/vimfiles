noremap <buffer> <localleader><localleader> mc:s/^\([[:space:]]*\)/\1"/<CR>:nohlsearch<CR>`cl:delmarks c<CR>
noremap <buffer> <localleader>. hmc:s/^\([[:space:]]*\)\"\([[:space:]]*\)/\1\2/<CR>`c:delmarks c<CR>

set keywordprg=
