runtime helpers/FormatText.vim
runtime helpers/SmallTabs.vim
runtime helpers/GrammarCheck.vim

nnoremap #1 :w \|! aspell check -e %<CR>

" Interface with a clipboard fifo (~/cb) when using mutt over ssh.
" TODO: Make the following fail gracefully if ~/cb doesn't exist.
inoremap <C-P> <esc>:r ~/cb<CR>i
nnoremap <C-P> :r ~/cb<CR>

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
