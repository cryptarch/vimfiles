if exists('+packages')
    packload
    silent! helptags ALL
endif

" Permit use of the mouse.
set mouse=a

" Modeline magic.
" Make vim conform to modelines placed at the end of files.
" http://vim.wikia.com/wiki/Modeline_magic
set modeline
set modelines=5

set fileformat=unix
set fileformats=unix

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
set nonumber

" All teh opsec
set cryptmethod=blowfish
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

" Don't put two spaces between sentences!
set nojoinspaces

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
set foldmethod=indent

" Suppress W16 warnings.
set autoread

" When navigating word-wise, don't treat underscores as internal characters.
set iskeyword-=_

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

" Permit per-project vimrc files but in that case run vim securely.
set exrc
set secure

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


set updatetime=500
runtime helpers/airline_config.vim
runtime helpers/gitgutter_config.vim
runtime helpers/ale_config.vim
runtime helpers/Mappings.vim
runtime helpers/Operators.vim
runtime helpers/cmdwin_config.vim
