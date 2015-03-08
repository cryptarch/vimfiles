" Permit use of the mouse.
set mouse=a

" Modeline magic.
" Make vim conform to modelines placed at the end of files.
" http://vim.wikia.com/wiki/Modeline_magic
set modeline
set modelines=5

" Colours and syntax highlighting.
set t_Co=256
syntax on
color orclord
hi Normal ctermbg=NONE
hi Visual term=reverse cterm=reverse
set fillchars=stl:-,stlnc:-,vert:\|
set nohlsearch
set incsearch

" Automatically deal with valid filetypes.
filetype on
filetype plugin on
filetype indent on

" Set the leader.
let mapleader = ";"
let maplocalleader = ";"

"Set indentation behaviour."
set autoindent
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"Reduce the interference created by running shell commands.
" Ref h: press-enter, h: shortmess
set shortmess=aoOtTW

"Set the print header. See help: statusline for explanation of symbols."
set pheader=%F%=%-%Page\ %N

"Set up folding.
set foldmethod=indent

" Suppress W16 warnings.
set autoread

" Call other helper scripts.
runtime helpers/Mappings.vim
