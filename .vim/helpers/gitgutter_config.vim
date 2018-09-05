scriptencoding utf-8
if exists('&signcolumn')
    set signcolumn = yes
else
    let g:gitgutter_sign_column_always = 1
endif
let g:gitgutter_sign_modified = 'Δ'
let g:gitgutter_sign_modified_removed = '≃'
