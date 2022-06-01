if exists('+packages')
    packload
    silent! helptags ALL
endif

" Permit use of the mouse.
set mouse=a

set fileformat=unix
set fileformats=unix

set sidescroll=1

" All teh opsec
set cryptmethod=blowfish2
set nomodeline

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
set shiftround

" Override that tab behavior for certain directories
autocmd BufRead,BufNewFile ~/src/gnu/datamash/* setlocal ts=2 sw=2 sts=2

" ins-completion and popup menu
set completeopt=menuone,popup,noinsert

" When navigating word-wise, don't treat underscores as internal characters.
set iskeyword-=_

" However, restore _ when autocompleting
" https://www.reddit.com/r/vim/comments/22431a/i_ctrln_the_motion_w_and_iskeyword/
autocmd! InsertLeave <buffer> :set iskeyword-=_
autocmd! InsertEnter <buffer> :set iskeyword+=_

" Don't put two spaces between sentences!
set nojoinspaces

" Disable adding eol at eof
set nofixeol

set equalprg=jq\ .

"Reduce the interference created by running shell commands.
" Ref h: press-enter, h: shortmess
set shortmess=aoOtTW

" Ensure backspace works as intended regardless of what is default
" Ref: http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

"Set the print header. See help: statusline for explanation of symbols."
set printheader=%F%=%-%Page\ %N

"Statusline
set statusline=%<0x%B\ %=\ %l,%c%V\ %P
set laststatus=2

"Set up folding.
" Ref https://vi.stackexchange.com/a/8671
set foldmethod=indent
function AutoFold()
    if line('$') > 30
        set foldlevel=0
    elseif line('$') > 20
        set foldlevel=1
    elseif line('$') > 10
        set foldlevel=2
    else
        set foldlevel=3
    endif
endfunction
autocmd! BufReadPost * call AutoFold()

" Suppress W16 warnings.
set autoread

" Preserve undo history when switching buffers.
set hidden

" Control what information gets preserved between sessions
set viminfo='128,<64,s32,h

" Restore last known cursor position:
function! RestoreCursor()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction
augroup resCur
    autocmd!
    autocmd BufWinEnter * call RestoreCursor()
augroup END

" Don't continue commenting on new lines.
" Ref: http://vim.wikia.com/wiki/Disable_automatic_comment_insertion
augroup vimrc
    autocmd!
    autocmd FileType * setlocal formatoptions-=r formatoptions-=o
augroup END

" If file is readonly disable modifications
" Ref: http://vim.wikia.com/wiki/Make_buffer_modifiable_state_match_file_readonly_state
function UpdateModifiable()
    if !exists("b:setmodifiable")
        let b:setmodifiable = 0
    endif
    if &readonly
        if &modifiable
            setlocal nomodifiable
            let b:setmodifiable = 1
        endif
    else
        if b:setmodifiable
            setlocal modifiable
        endif
    endif
endfunction
autocmd BufReadPost * call UpdateModifiable()

" Prefill registers
let @d = strftime("%F")
let @s = '¯\_(ツ)_/¯'

set clipboard-=autoselect
if $DISPLAY == "" || !has('x11')
    set mouse="r"
endif

" If the parent directory did not exist, it would be necessary to invent it
" Ref: https://vi.stackexchange.com/a/679
function MkdirFunction(dir)
    if empty(a:dir) || isdirectory(a:dir)
        return
    else
        call mkdir(a:dir)
    endif
endfunction
augroup MkdirGroup
    autocmd!
    autocmd BufWritePre * call MkdirFunction(expand("<afile>:p:h"))
augroup END

" Silence E173
" https://vi.stackexchange.com/a/31461/18583
autocmd QuitPre * qa

set updatetime=500
runtime helpers/theme.vim
runtime helpers/airline_config.vim
runtime helpers/gitgutter_config.vim
runtime helpers/ale_config.vim
runtime helpers/Mappings.vim
runtime helpers/Operators.vim
runtime helpers/cmdwin_config.vim
