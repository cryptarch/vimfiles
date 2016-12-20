" Permit use of the mouse.
set mouse=a

" Modeline magic.
" Make vim conform to modelines placed at the end of files.
" http://vim.wikia.com/wiki/Modeline_magic
set modeline
set modelines=5

set ff=unix
set ffs=unix

set sidescroll=1

" Colours and syntax highlighting.
set t_Co=256
syntax on
color orclord
hi Normal ctermbg=NONE
hi Visual term=reverse cterm=reverse
set fillchars=stl:-,stlnc:-,vert:\|
set nohlsearch
set incsearch

" All teh opsec
set cryptmethod=blowfish

" Automatically deal with valid filetypes.
filetype on
filetype plugin on
filetype indent on

"Set indentation behaviour."
set autoindent
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Don't put two spaces between sentences!
set nojoinspaces

"Reduce the interference created by running shell commands.
" Ref h: press-enter, h: shortmess
set shortmess=aoOtTW

"Set the print header. See help: statusline for explanation of symbols."
set pheader=%F%=%-%Page\ %N

"Statusline
set statusline=%<0x%B\ %=\ %l,%c%V\ %P
set laststatus=2

"Set up folding.
set foldmethod=indent

" Suppress W16 warnings.
set autoread

" When navigating word-wise, don't treat underscores as internal characters.
set iskeyword-=_

" Don't continue commenting on new lines.
" Ref: http://vim.wikia.com/wiki/Disable_automatic_comment_insertion
augroup vimrc
    autocmd!
    autocmd FileType * setlocal formatoptions-=r formatoptions-=o
augroup END

set updatetime=500
runtime helpers/airline_config.vim
runtime helpers/gitgutter_config.vim
runtime helpers/Mappings.vim
