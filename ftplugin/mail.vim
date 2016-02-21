runtime helpers/FormatText.vim
runtime helpers/SmallTabs.vim
runtime helpers/GrammarCheck.vim

" Interface with a clipboard fifo (~/cb) when using mutt over ssh.
" TODO: Make the following fail gracefully if ~/cb doesn't exist.
inoremap <buffer> <C-P> <esc>:read ~/cb<CR>i
nnoremap <buffer> <C-P> :read ~/cb<CR>

" :h swapfile
"  `This option can be reset when a swapfile is not wanted
"   for a specific buffer.  For example, with confidential information
"   that even root must not be able to access.
"   Careful: All text will be in memory:
"       - Don't use this for big files.
"       - Recovery will be impossible!'
set noswapfile

" h: backup
set nobackup
set nowritebackup

" Disable airline whitespace warning.
" In mail, the sig actually requires one trailing whitespace.
let g:airline#extensions#whitespace#enabled = 0
