" When an operator is pending and we want to affect
" everything between two delimiters, we should usually
" do an inner movement.
"
" Don't try to omap < or > since they are needed for indenting.
" Don't try to omap $ since it is needed to match the end of a line.
" Don't try to omap, say, { to i{, since { is already required for another type of motion.

" Line motion
"onoremap <silent> il :<C-U>normal! 0v$<CR>
onoremap <silent> al :<C-U>normal! <S-V><CR>

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

" Mask operation, eg for hiding passwords
nnoremap <silent> <leader>m :set opfunc=Mask<CR>g@
vnoremap <silent> <leader>m :<C-U>call Mask(visualmode(), 1)<CR>
function! Mask(type, ...)
    let l:sel_save = &selection
    let &selection = 'inclusive'
    let l:reg_save = @@
    if a:0  " Invoked from Visual mode, use gv command.
        silent exe "normal! gvrX"
    elseif a:type ==# 'line'
        silent exe "normal! '[V']rX"
    else
        silent exe "normal! `[v`]rX"
    endif
    let &selection = l:sel_save
    let @@=l:reg_save
endfunction

nnoremap <silent> <leader>" :set opfunc=DoubleQuote<CR>g@
vnoremap <silent> <leader>" :<C-U>call DoubleQuote(visualmode(), 1)<CR>
function! DoubleQuote(type, ...)
    let l:sel_save = &selection
    let &selection = 'inclusive'
    let reg_save=@@
    if a:0  " Invoked from Visual mode, use gv to re-select what was just selected
        silent exe 'normal! gvc""' . "\<esc>P"
    elseif a:type ==# 'line'
        silent exe "normal! '[V']" . ':s/^\|$/"/g' . "\<CR>"
    else
        silent exe 'normal! `[v`]c""' . "\<esc>P"
    endif
    let &selection = l:sel_save
    let @@=reg_save
endfunction
