" When an operator is pending and we want to affect
" everything between two delimiters, we should usually
" do an inner movement.
"
" Don't try to omap <|> since they are needed for indenting.
" Don't try to omap $ since it is needed to match the end of a line.
" Don't try to omap, say, { to i{, since { is already required for another type of motion.

" Simplify working with clipboard and primary selection
if has('x11')
    nnoremap + :let @+=@0<CR>
    nnoremap <silent> <C-c> :set opfunc=YankCB<CR>g@
    vnoremap <silent> <C-c> :<C-U>call YankCB(visualmode(), 1)<CR>
    function! YankCB(type, ...)
        let l:sel_save = &selection
        let &selection = 'inclusive'
        if a:0  " Invoked from Visual mode, use gv command.
            silent exe "normal! gv\"+y"
        elseif a:type ==# 'line'
            silent exe "normal! '[V']\"+y"
        else
            silent exe "normal! `[v`]\"+y"
        endif
        let &selection = l:sel_save
    endfunction

    nnoremap * :let @*=@0<CR>
    nnoremap <silent> <leader>c :set opfunc=YankPS<CR>g@
    vnoremap <silent> <leader>c :<C-U>call YankPS(visualmode(), 1)<CR>
    function! YankPS(type, ...)
        let l:sel_save = &selection
        let &selection = 'inclusive'
        if a:0  " Invoked from Visual mode, use gv command.
            silent exe "normal! gv\"*y"
        elseif a:type ==# 'line'
            silent exe "normal! '[V']\"*y"
        else
            silent exe "normal! `[v`]\"*y"
        endif
        let &selection = l:sel_save
    endfunction
endif

"nnoremap gt :s/\v<(.)(\w*)/\u\1\L\2/g<CR>
nnoremap gt :set opfunc=CapitaliseInitials<CR>g@
vnoremap gt :<C-U>call CapitaliseInitials(visualmode(), 1)<CR>
function! CapitaliseInitials(type, ...)
    let l:sel_save = &selection
    let &selection = 'inclusive'
    let reg_save=@@
    if a:0  " Invoked from Visual mode, use gv command.
        silent exe "normal! gv" . ':s/\%V\v<([a-z])(\w*)/\u\1\L\2/ge'. "\<CR>"
    elseif a:type ==# 'line'
        silent exe "normal! '[V']" . ':s/\%V\v<([a-z])(\w*)/\u\1\L\2/ge' . "\<CR>"
    else
        silent exe "normal! `[v`]" . ':s/\%V\v<([a-z])(\w*)/\u\1\L\2/ge' . "\<CR>"
    endif
    let &selection = l:sel_save
    let @@=reg_save
endfunction

" Execute text captured by motion as an external filter (i.e. shell command)
nnoremap X :set opfunc=ExecuteThatThing<CR>g@
vnoremap X :<C-U>call ExecuteThatThing(visualmode(), 1)<CR>
function! ExecuteThatThing(type, ...)
    let l:sel_save = &selection
    let &selection = 'inclusive'
    let l:reg_save = @@
    if a:0  " Invoked from Visual mode, use gv command.
        silent exe "normal! gvy"
    elseif a:type ==# 'line'
        silent exe "normal! '[V']y"
    else
        silent exe "normal! `[v`]y"
    endif
    silent exec "r ! " . escape(@", "%!#")
    let &selection = l:sel_save
    let @@=l:reg_save
endfunction
