scriptencoding utf-8
if exists('&signcolumn')  " Vim 7.4.2201
    set signcolumn=yes
else
    let g:gitgutter_sign_column_always = 1
endif
let g:gitgutter_sign_modified = 'Δ'
let g:gitgutter_sign_modified_removed = '≃'

let g:gitgutter_override_sign_column_highlight = 0
hi! link SignColumn fgRed
