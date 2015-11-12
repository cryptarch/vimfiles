" Switch to titlecase. Ref :h simple-change
nnoremap gt :s/\v<(.)(\w*)/\u\1\L\2/g<CR>

" Break line at cursor.
nnoremap K i<CR><esc>

" Remove blank lines in selection.
vnoremap c :s/^$\n//g<CR>

" Add lines above or below current without entering insert mode.
" From vimtips wiki:
"   http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nnoremap tO O<Esc>j
nnoremap to o<Esc>k

" Push current word left or right.
" Ref: http://vim.wikia.com/wiki/Swapping_characters,_words_and_lines
:nnoremap <silent> gh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
:nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>

" Accordion folds. NB: It isn't possible to map <S-space> in most terminal environments.
nnoremap <space> za
vnoremap <space> zf

" Avoid annoying E173 error when closing multiple files.
cnoreabbrev q qa

" Exit with one button press.
nnoremap q :qa!<CR>

" Save with one button press.
nnoremap s :w<CR>

" Show syntax group under the cursor.
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"Make buffers easier to work with. Kwbd is defined in plugin/bclose.vim"
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-W> :Kwbd<CR>

" Navigate b/w panes.
nnoremap <silent> <C-Right> :vertical botright split<CR>
nnoremap <silent> <C-Left> :vertical topleft split<CR>
nnoremap <silent> <S-H> :hide<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-L> :wincmd l<CR>

" General navigation.
noremap z ?[[:print:]]\([[:space:]]\\|$\)<CR>
noremap S /[[:punct:]]\+/e<CR>

" Command to open help in a vertical split.
cnoreabbrev vh vert botright help 

" Commands to insert useful information.
inoremap <C-N> <esc>"%pa
nnoremap <C-N> <esc>"%p
inoremap <C-X> <esc>"+pa
nnoremap <C-X> "+p
inoremap <C-D> <esc>:let @a=system("echo -n $(date -I)")<CR>a<C-R>a

" Clear all comment markers (one rule for all languages)
noremap _ :s/^\([[:space:]]*\)\([[:punct:]]\+\)\([[:space:]]*\)/\1\3/g<CR>

" Make current file executable.
nnoremap <silent> <C-E> :!chmod +x %<CR><CR>

" Insert lorem ipsum text inline. Assumes you have lorem-ipsum-generator in your path.
nnoremap <S-L> :r ! lorem-ipsum-generator -s1<CR>
