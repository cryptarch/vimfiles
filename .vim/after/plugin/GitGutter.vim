if exists(':GitGutter')
    nnoremap <leader>r :GitGutter<CR>
else
    nnoremap <leader>r :echo GitGutter not found<CR>
endif
