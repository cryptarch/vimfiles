" Unmap keys I don't use and find annoying.
nnoremap q <NOP>
nnoremap s <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Custom navigation.
noremap <S-E> ge

" Set the leader.
let mapleader = ";"
let maplocalleader = ","

" Change colours.
nnoremap <leader>cd :colorscheme orclord \|: let g:airline_theme='jet' \|:AirlineRefresh<CR>
nnoremap <leader>cl :colorscheme fall \|: let g:airline_theme='lucius' \|:AirlineRefresh<CR>

" Switch to titlecase. Ref :h simple-change
nnoremap gt :s/\v<(.)(\w*)/\u\1\L\2/g<CR>

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

" Break line at cursor.
nnoremap <leader>k i<CR><esc>

" Remove blank lines in selection.
vnoremap c :s/^$\n//g<CR>

" Add lines above or below current without entering insert mode.
" From vimtips wiki:
"   http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nnoremap tO O<Esc>j
nnoremap to o<Esc>k

" Push current word left or right.
" Ref: http://vim.wikia.com/wiki/Swapping_characters,_words_and_lines
nnoremap <silent> gh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>

" Accordion folds. NB: It isn't possible to map <S-space> in most terminal environments.
nnoremap <space> za
vnoremap <space> zf

" Avoid annoying E173 error when closing multiple files.
cnoreabbrev q qa

" Exit with one button press.
nnoremap <leader>q :qa!<CR>

" Save. Note that choosing <C-S> will freeze the terminal unless
" stty -ixon is set in .bashrc
nnoremap <leader>s :w<CR>

" Show syntax group under the cursor.
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"Make buffers easier to work with. Kwbd is defined in plugin/bclose.vim"
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

" Clear all comment markers (one rule for all languages)
noremap _ :s/^\([[:space:]]*\)\([[:punct:]]\+\)\([[:space:]]*\)/\1\3/g<CR>

" Make current file executable.
nnoremap <silent> <leader>e :!chmod +x %<CR><CR>

" Git commit current file.
function! GitCommitCurrentFile()
    let isgit = system("git " . "rev-parse " . "--is-inside-work-tree")
    if v:shell_error != 128 " git rev-parse etc gives exit code 128 when current directory not under Git.
        if &modified == 1
            echo "Buffer has unsaved changes."
        else
            let filenamecheck = system("git " . "diff " . "--quiet " . bufname("%"))
            if v:shell_error == 1
                let gitadd = system("git add " . bufname("%"))
                let gitcommit = system("git commit " . "-m " . "\"Update " . bufname("%") . ".\"")
                echo "Committed changes to " . bufname("%") . "."
            else
                echo "File " . bufname("%") . " not changed."
            endif
        endif
    else
        echo "Directory not under version control."
    endif
endfunction
nnoremap <silent> <leader>a :call GitCommitCurrentFile()<CR>
