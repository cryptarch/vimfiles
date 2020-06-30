setlocal textwidth=0
setlocal wrapmargin=0
setlocal wrap
setlocal nolist
setlocal linebreak
setlocal formatoptions=n
vnoremap <buffer> <localleader>f {gq}
nnoremap <buffer> <localleader>f gqip

nnoremap <buffer> j              gj
nnoremap <buffer> k              gk

" Git-Gutter plugin causes #columns to reset, breaking soft-wrapping
GitGutterDisable
