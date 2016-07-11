setlocal comments-=:// comments+=f://
noremap <buffer> <localleader><localleader> mc:s/^\([[:space:]]*\)/\1\/\//<CR>:nohlsearch<CR>`cll:delmarks c<CR>
noremap <buffer> <localleader>. hhmc:s/^\([[:space:]]*\)\/\/\([[:space:]]*\)/\1\2/<CR>`c:delmarks c<CR>
vnoremap <buffer> <localleader>; c//<esc>P`[v`]c**<esc>P`[
