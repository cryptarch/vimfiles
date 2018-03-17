augroup ALE
    au!
    autocmd VimEnter * nmap <Leader>[ <Plug>(ale_previous_wrap)
    autocmd VimEnter * nmap <Leader>] <Plug>(ale_next_wrap)
    autocmd VimEnter * nmap <localleader>a :ALEToggle<CR>

    let g:ale_lint_delay = 500
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_sign_column_always = 1
augroup END
