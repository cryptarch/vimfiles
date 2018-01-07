" Unmap keys I don't use and find annoying.
nnoremap q <NOP>
nnoremap s <NOP>
nnoremap - <NOP>
nnoremap _ <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Custom navigation.
noremap <S-E> ge

" Increment/decrement numbers
nnoremap ++ <C-A>
nnoremap -- <C-X>

" Set the leader.
let g:mapleader = ';'
let g:maplocalleader = ','

nnoremap <leader>. :&&<CR>

" Map to run shell command
nnoremap <leader>r p:.!bash<CR>

" Change colours.
nnoremap <leader>cd :colorscheme orclord \|: let g:airline_theme='jet' \|:AirlineRefresh<CR>
nnoremap <leader>cl :colorscheme fall \|: let g:airline_theme='lucius' \|:AirlineRefresh<CR>

" Mappings for changing between upper and lower case.
nnoremap gt :s/\v<(.)(\w*)/\u\1\L\2/g<CR>
nnoremap <leader>u gUl
nnoremap <leader>l gul

" Put marks around things.
vnoremap <leader>" c""<esc>P`[v`]
vnoremap <leader>' c''<esc>P`[v`]
vnoremap <leader>* c**<esc>P`[v`]
vnoremap <leader>( c()<esc>P`[v`]
vnoremap <leader>[ c[]<esc>P`[v`]
vnoremap <leader>{ c{}<esc>P`[v`]
vnoremap <leader>$ c$$<esc>P`[v`]
vnoremap <leader>< c<<esc>a><esc>P`[v`]

" When an operator is pending and we want to affect
" everything between two delimiters, we should usually
" do an inner movement.
"
" Don't try to omap <|> since they are needed for indenting.
" Don't try to omap $ since it is needed to match the end of a line.
onoremap " i"
onoremap ' i'
onoremap * i*
onoremap ( i(
onoremap [ i[
onoremap { i{

" Simplify working with clipboard
if has('x11')
    nnoremap + :let @+=@0<CR>

    nnoremap <silent> <C-c> :set opfunc=YankCB<CR>g@
    vnoremap <silent> <C-c> :<C-U>call YankCB(visualmode(), 1)<CR>
    function! YankCB(type, ...)
        let l:sel_save = &selection
        let &selection = 'inclusive'
        if a:0  " Invoked from Visual mode, use gv command.
            silent exe "normal! gv\"+y"
        elseif a:type ==# 'line'
            silent exe "normal! '[V']\"+y"
        else
            silent exe "normal! `[v`]\"+y"
        endif
        let &selection = l:sel_save
    endfunction
endif

" Break line at cursor.
nnoremap <leader>k i<CR><esc>

" Paste below/above
nnoremap <leader>p :put<CR>
nnoremap <leader>P :put!<CR>

" Remove blank lines in selection.
vnoremap <leader>c :s/^$\n//g<CR>

" Map to indicate very long or short lines.
let b:short=16
let b:long=90
let b:show_long_short=0
function! ToggleShowLongShortLines()
    if b:show_long_short
        let b:show_long_short=0
        set colorcolumn=
        set wrap
        match none
    else
        let b:show_long_short=1
        execute ':set colorcolumn=' . b:short . ',' . b:long
        execute "match Search '.\\+\\%<" . b:short . "v[^.!?;]$\\|\\%>" . b:long . "v.\\+'"
        set nowrap
    endif
endfunction
nnoremap <leader>w :call ToggleShowLongShortLines()<CR>

" Add lines above or below current without entering insert mode.
" From vimtips wiki:
"   http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nnoremap <leader>O O<Esc>j
nnoremap <leader>o o<Esc>k

" Push current word left or right.
" Ref: http://vim.wikia.com/wiki/Swapping_characters,_words_and_lines
nnoremap <silent> gh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>

" Accordion folds. NB: It isn't possible to map <S-space> in most terminal environments.
nnoremap <space> za
vnoremap <space> zf

" Exit everything immediately.
nnoremap <leader>q :qa!<CR>

" Save. Note that choosing <C-S> will freeze the terminal unless
" stty -ixon is set in .bashrc
nnoremap <leader>s :w<CR>

" Show syntax group under the cursor.
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . ', '
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . "> lo<"
\ . synIDattr(synID(line("."),col("."),0),"name") . ', '
\ . synIDattr(synIDtrans(synID(line("."),col("."),0)),"name") . ">"<CR>

"Make buffers easier to work with. Bclose is defined in plugin/bclose.vim"
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-W> :Bclose<CR>

" Navigate b/w panes.
nnoremap <silent> <C-Right> :vertical botright split<CR>
nnoremap <silent> <C-Left> :vertical topleft split<CR>
nnoremap <silent> <S-H> :hide<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-L> :wincmd l<CR>

" Command to open help in a vertical split.
cnoreabbrev vh vert botright help

" Commands to insert useful information.
inoremap <C-N> <esc>"%pa
nnoremap <C-X> "+p
inoremap <C-X> <esc>"+pa
inoremap <C-D> <C-R>=strftime("%F")<CR>

vnoremap <leader>n :s/^/\=(line('.')-line("'<")+1) . ' '/g<CR>
nnoremap <leader>n :setlocal number!<CR>

" Toggle search highlighting
" Ref http://vim.wikia.com/wiki/VimTip14
nnoremap <leader>h :set hlsearch! hlsearch?<CR>

" cmdwin helpers
nnoremap <leader>: :<C-F>
nnoremap <leader>/ /<C-F>

" Make current file executable.
nnoremap <silent> <leader>e :!chmod +x %<CR><CR>

" Git commit current file.
function! GitCommitCurrentFile()
    let l:isgit = system('git ' . 'rev-parse ' . '--is-inside-work-tree')
    if v:shell_error != 128 " git rev-parse etc gives exit code 128 when current directory not under Git.
        if &modified == 1
            echo 'Buffer has unsaved changes.'
        else
            let l:filenamecheck = system('git ' . 'diff ' . '--quiet ' . bufname('%'))
            if v:shell_error == 1
                let l:gitadd = system('git add ' . bufname('%'))
                let l:gitcommit = system('git commit ' . '-m ' . '\"Update ' . bufname('%') . '.\"')
                echo 'Committed changes to ' . bufname('%') . '.'
            else
                echo 'File ' . bufname('%') . ' not changed.'
            endif
        endif
    else
        echo 'Directory not under version control.'
    endif
endfunction
