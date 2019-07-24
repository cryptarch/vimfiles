" Colours and syntax highlighting.
" :h terminal-options (to enable termguicolors properly in st terminal)
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors

syntax on
packadd! vim-colors-paramount
color paramount
set background=dark

hi Normal ctermbg=NONE
hi Visual term=reverse cterm=reverse
set fillchars=stl:-,stlnc:-,vert:\|
set nohlsearch
set incsearch
set nonumber


