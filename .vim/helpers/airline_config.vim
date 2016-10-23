let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_theme='jet'

"recalculate statusline warnings when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
autocmd bufwritepost * unlet! b:statusline_shell_error

function! ShellErr()
    if !exists("b:statusline_shell_error")
        let b:shell_error_number = v:shell_error
        if b:shell_error_number == 0
            let b:statusline_shell_error = ''
        else
            let b:statusline_shell_error = 'S[' . b:shell_error_number . ']'
        endif
    endif
    return b:statusline_shell_error
endfunction

" The following code came from
" https://got-ravings.blogspot.com.au/2008/10/vim-pr0n-statusline-whitespace-flags.html
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        let b:trail_search = search('\s\+$', 'nw')
        if b:trail_search == 0
            let b:statusline_trailing_space_warning = ''
        else
            let b:statusline_trailing_space_warning = 'T[' . b:trail_search . ']'
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

let g:airline_section_warning = '%{ShellErr()}%{StatuslineTrailingSpaceWarning()}'
