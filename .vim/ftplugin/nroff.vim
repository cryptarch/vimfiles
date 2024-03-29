" Mark text as bold
nnoremap <buffer> <silent> <localleader>b :set opfunc=Embolden<CR>g@
vnoremap <buffer> <silent> <localleader>b :<C-U>call Embolden(visualmode(), 1)<CR>
function! Embolden(type, ...)
    let l:sel_save = &selection
    let &selection = 'inclusive'
    if a:0  " Invoked from Visual mode, use gv to recapture selection.
        silent exe "normal! gv\<esc>`>a\\fR\<esc>`<i\\fB\<esc>"
    elseif a:type ==# 'line'
        silent exe "normal! '[V']\<esc>`>a\\fR\<esc>`<i\\fB\<esc>"
    else
        silent exe "normal! `[v`]\<esc>`>a\\fR\<esc>`<i\\fB\<esc>"
    endif
    let &selection = l:sel_save
endfunction

" Mark text as italics
nnoremap <buffer> <silent> <localleader>i :set opfunc=Italicise<CR>g@
vnoremap <buffer> <silent> <localleader>i :<C-U>call Italicise(visualmode(), 1)<CR>
function! Italicise(type, ...)
    let l:sel_save = &selection
    let &selection = 'inclusive'
    if a:0  " Invoked from Visual mode, use gv to recapture selection.
        silent exe "normal! gv\<esc>`>a\\fR\<esc>`<i\\fI\<esc>"
    elseif a:type ==# 'line'
        silent exe "normal! '[V']\<esc>`>a\\fR\<esc>`<i\\fI\<esc>"
    else
        silent exe "normal! `[v`]\<esc>`>a\\fR\<esc>`<i\\fI\<esc>"
    endif
    let &selection = l:sel_save
endfunction
