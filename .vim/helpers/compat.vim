" Map to hide or show carriage returns (^M)
let b:show_carriage_returns=0
hi! link SpecialKey Ignore
function! ToggleShowCarriageReturns()
    if b:show_carriage_returns
        let b:show_carriage_returns=0
        hi! link SpecialKey Ignore
    else
        let b:show_carriage_returns=1
        hi! link SpecialKey Comment
    endif
endfunction
nnoremap <C-M> :call ToggleShowCarriageReturns()<CR>
