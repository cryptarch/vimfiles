" Nocompatible is required by vimwiki.
" The vim help advises that if this option is set, it should be set at the top
" of the vimrc.
set nocompatible

"Enable syntax highlighting."
set t_Co=256
syntax on
color orclord

" Uncomment the following block to convert gui colours to terminal colours.
"if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
"  \ filereadable(expand("/usr/share/vim/vimfiles/plugin/guicolorscheme.vim"))
"" Use the guicolorscheme plugin to makes 256-color or 88-color
"" terminal use GUI colors rather than cterm colors.
"  runtime! plugin/guicolorscheme.vim
"  GuiColorScheme dwarflord
"else
"" For 8-color 16-color terminals or for gvim, just use the
"" regular :colorscheme command.
" colorscheme default
"endif

" This adds syntax highlighting to `set -o vi' mode in bash:
au BufRead,BufNewFile bash-fc-* set filetype=sh
" This is a workaround for a won't-fix bug in bash syntax highlighting.
let g:vimsyn_noerror= 1 

"Transparent background"
hi Normal ctermbg=NONE
hi Visual term=reverse cterm=reverse

"Permit use of the mouse."
set mouse=a

"Disable highlighting of search terms, as it becomes distracting."
set nohlsearch

"... but do highlight while a search is in progress.
set incsearch

"Autocompletion fun.
set infercase
filetype plugin on
set ofu=syntaxcomplete#Complete

"Set indentation behaviour."
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"Reduce the interference created by running shell commands."
" Furthermore, reduce interference when creating/opening new links in vimwiki.
" Ref h: press-enter, h: shortmess
set shortmess=aoOtTW

"Set the print header. See help: statusline for explanation of symbols."
set pheader=%F%=%-%Page\ %N

"Set up folding.
set foldmethod=indent


""""""""""""
""" Mappings

" Accordion folds.
nnoremap <space> za
vnoremap <space> zf

" Avoid annoying E173 error when opening multiple files.
cnoremap q qa

" Show syntax group under the cursor.
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


"Make buffers easier to work with. Kwbd is defined in plugin/bclose.vim"
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-W> :Kwbd<CR>

" Navigate b/w panes.
nmap <silent> <C-J> :wincmd j<CR>
nmap <silent> <C-K> :wincmd k<CR>
nmap <silent> <C-H> :wincmd h<CR>
nmap <silent> <C-L> :wincmd l<CR>

"Jump between matching brackets, highlighting text in between."
noremap % v%

" Command to open help in a vertical split.
cnoremap vh vert botright help 

" Commands to insert useful information.
inoremap <C-N> <esc>"%pi
nnoremap <C-N> <esc>"%p
inoremap <C-X> <esc>"+pi
nnoremap <C-X> "+p
" TODO: Make the following fail gracefully if ~/cb doesn't exist.
inoremap <C-P> <esc>:r ~/cb<CR>i
nnoremap <C-P> :r ~/cb<CR>

" Deal with specific file types.
filetype on
augroup vimrc_filetype
  autocmd!
  autocmd FileType sh call s:MyShSettings()
  autocmd FileType c call s:MyCSettings()
  autocmd FileType vim call s:MyVimSettings()
  autocmd FileType r\|perl\|sh call s:HashComments()
  autocmd FileType tex\|plaintex call s:MyTeXSettings()
  autocmd FileType python call s:MyPySettings()
  autocmd FileType vimwiki\|tex\|note\|asciidoc\|rst call s:FormatText()
  autocmd FileType vimwiki\|mail\|rst call s:SmallTabs()
  autocmd FileType vimwiki call s:WikiCompat()
  autocmd FileType vimwiki call s:WikiDates()
augroup end

" Clear all comment markers (one rule for all languages)
map _ :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

function! s:MyCSettings()
  " Insert comments markers
  map - :s/^/\/\//<CR>:nohlsearch<CR>
endfunction

function! s:MyVimSettings()
  " Insert comments markers
  map - :s/^/\"/<CR>:nohlsearch<CR>
endfunction

function! s:HashComments()
  " Insert comments markers
  map - :s/^/#/<CR>:nohlsearch<CR>
endfunction

function! s:MyShSettings()
    map #5 :w \|! %
    map #6 :w \| so %
endfunction

function! s:MyTeXSettings()
    map #3 :w \|! pdflatex --interaction=batchmode main.tex > /dev/null<CR><CR>
endfunction

function! s:MyPySettings()
    set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
endfunction

function! s:FormatText()
    set tw=72
endfunction

function! s:SmallTabs()
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
endfunction

function! s:WikiCompat()
    " Vimwiki is a bit obnoxious about overwriting useful mappings.
    nunmap <buffer><Tab>
    nunmap <buffer><S-Tab>
    au BufRead,BufNewFile *.bib set filetype=bib
endfunction

function! s:WikiDates()
    vnoremap <C-D> xa[[diary:<esc>pa\|<esc>pa]]<esc>
endfunction

let phd = {}
let phd.path= '~/phdwiki/'
let phd.diary_rel_path = ''
let phd.nested_syntaxes = {'vim': 'vim', 'sh': 'sh', 'plaintex': 'plaintex', 'tex': 'tex'}
let bib = {}
let bib.path = '~/phdwiki/bibtex/'
let bib.ext = '.bib'
let mundane = {}
let mundane.path = '~/extramuros/'
let mundane.diary_rel_path = ''
let g:vimwiki_list = [phd, bib, mundane]

