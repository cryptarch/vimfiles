if exists(':GitGutter')
    nnoremap <silent> <leader>gr :GitGutter<CR>
else
    nnoremap <leader>gr :echo GitGutter not found<CR>
endif

function! GitGutterRefresh()
    if exists(':GitGutter')
        GitGutter
    endif
endfunction

nnoremap <silent> <leader>gc :call GitCommitCurrentFile() \| :call GitGutterRefresh()<CR>
