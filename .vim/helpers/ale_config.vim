augroup ALE
    au!
    autocmd VimEnter * nmap <Leader>[ <Plug>(ale_previous_wrap)
    autocmd VimEnter * nmap <Leader>] <Plug>(ale_next_wrap)
augroup END
