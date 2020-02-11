" When an operator is pending and we want to affect
" everything between two delimiters, we should usually
" do an inner movement.
"
" Don't try to omap < or > since they are needed for indenting.
" Don't try to omap $ since it is needed to match the end of a line.
" Don't try to omap, say, { to i{, since { is already required for another type of motion.

" Inner line
onoremap <silent> il :<C-U>normal! 0v$<CR>
onoremap <silent> al :<C-U>normal! <S-V><CR>

" Inner command: treat first few characters as a prompt to be ignored
onoremap <silent> ic :<C-U>normal! 3\|v$<CR>

" Simplify working with clipboard and primary selection
if has('x11') && $DISPLAY != ""
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
else
    nnoremap <silent> <C-c> <nop>
    nnoremap <silent> <leader>c <nop>
endif

"nnoremap gt :s/\v<(.)(\w*)/\u\1\L\2/g<CR>
nnoremap gt :set opfunc=CapitaliseInitials<CR>g@
vnoremap gt :<C-U>call CapitaliseInitials(visualmode(), 1)<CR>
function! CapitaliseInitials(type, ...)
    let l:sel_save = &selection
    let &selection = 'inclusive'
    let reg_save=@@
    if a:0  " Invoked from Visual mode, use gv command.
        silent exe "normal! mzgv" . ':s/\%V\v<(\S)(\S*)/\u\1\L\2\E/ge'. "\<CR>`z"
    elseif a:type ==# 'line'
        silent exe "normal! '[V']" . ':s/\%V\v<(\S)(\S*)/\u\1\L\2\E/ge' . "\<CR>"
    else
        silent exe "normal! `[mzv`]" . ':s/\%V\v<(\S)(\S*)/\u\1\L\2\E/ge' . "\<CR>`z"
    endif
    let &selection = l:sel_save
    let @@=reg_save
endfunction

" Execute text captured by motion as an external filter (i.e. shell command)
nnoremap <silent> X :set opfunc=ExecuteThatThing<CR>g@
vnoremap <silent> X :<C-U>call ExecuteThatThing(visualmode(), 1)<CR>
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
    silent exec "r ! " . escape(@", "%!#\r\n")
    let &selection = l:sel_save
    let @@=l:reg_save
endfunction

nmap <Return> Xic

" Do join (J) as an operation
nnoremap <silent> <leader>j :set opfunc=Join<CR>g@
vnoremap <silent> <leader>j :<C-U>call Join(visualmode(), 1)<CR>
function! Join(type, ...)
    let l:sel_save = &selection
    let &selection = 'inclusive'
    let l:reg_save = @@
    if a:0  " Invoked from Visual mode, use gv command.
        silent exe "normal! gvJ"
    elseif a:type ==# 'line'
        silent exe "normal! '[V']J"
    else
        silent exe "normal! `[v`]J"
    endif
    let &selection = l:sel_save
    let @@=l:reg_save
endfunction
