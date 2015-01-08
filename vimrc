" http://vim.wikia.com/wiki/Modeline_magic
set modeline
set modelines=5

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

" Custom filetypes.
au BufRead,BufNewFile *.muttrc set filetype=muttrc
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.bib set filetype=bib
au BufRead,BufNewFile *.tex set filetype=tex

" This adds syntax highlighting to `set -o vi' mode in bash:
au BufRead,BufNewFile bash-fc-* set filetype=sh

" Check for django files. Default vim checker seems prone to false negatives.
au BufRead,BufNewFile *.html call s:DjangoHtml()
func! s:DjangoHtml()
    let n = 1
    while n < 10 && n < line("$")
        if getline(n) =~ '{%.*%}'
            set filetype=htmldjango
            return
        endif
        let n = n + 1
    endwhile
endfunc

" This is a workaround for a won't-fix bug in bash syntax highlighting.
let g:vimsyn_noerror= 1 

" Set the leader.
let mapleader=";"

"Transparent background"
hi Normal ctermbg=NONE
hi Visual term=reverse cterm=reverse
set fillchars=stl:-,stlnc:-,vert:\|

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

"Reduce the interference created by running shell commands.
" Ref h: press-enter, h: shortmess
set shortmess=aoOtTW

"Set the print header. See help: statusline for explanation of symbols."
set pheader=%F%=%-%Page\ %N

"Set up folding.
set foldmethod=indent


""""""""""""
""" Mappings

" Switch to titlecase. Ref :h simple-change
nnoremap gt :s/\v<(.)(\w*)/\u\1\L\2/g<CR>

" Break line at cursor.
nnoremap K i<CR><esc>

" Accordion folds. NB: It isn't possible map <S-space> in most terminal environments.
nnoremap <space> za
nnoremap f zA
vnoremap <space> zf

" Avoid annoying E173 error when opening multiple files.
cnoremap q qa

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
nnoremap z bbe

"Jump between matching brackets, highlighting text in between."
noremap % v%

" Command to open help in a vertical split.
cnoremap vh vert botright help 

" Commands to insert useful information.
inoremap <C-N> <esc>"%pa
nnoremap <C-N> <esc>"%p
inoremap <C-X> <esc>"+pa
nnoremap <C-X> "+p
inoremap <C-D> <esc>:let @a=system("echo -n $(date -I)")<CR>a<C-R>a

" Deal with specific file types.
filetype on
augroup vimrc_filetype
  autocmd!
  autocmd FileType sh call s:MyShSettings()
  autocmd FileType c call s:MyCSettings()
  autocmd FileType r\|rnoweb call s:MyRSettings()
  autocmd FileType r\|perl\|sh call s:HashComments()
  autocmd FileType tex\|plaintex\|rnoweb call s:MyTeXSettings()
  autocmd FileType rnoweb call s:MySweaveSettings()
  autocmd FileType vim call s:MyVimSettings()
  autocmd FileType python call s:MyPySettings()
  autocmd FileType haskell call s:MyHaskellSettings()
  autocmd FileType mail call s:EmailSettings()
  autocmd FileType note\|asciidoc\|rst\|markdown call s:FormatText()
  autocmd FileType mail\|rst call s:SmallTabs()
  autocmd FileType mail\|rst\|markdown call s:GrammarCheck()
  autocmd FileType markdown call s:MarkdownSettings()
augroup end

" Clear all comment markers (one rule for all languages)
map _ :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

function! s:MyCSettings()
  " Insert comments markers
    map - :s/^/\/\//<CR>:nohlsearch<CR>
    if filereadable("Makefile")
        nnoremap #3 :w \|! make -j4<CR>
    endif
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
    map - :s/^/%/<CR>:nohlsearch<CR>
    nnoremap #1 :w \|! aspell check -t %<CR>
    nnoremap #2 :w \|! detex % \| style<CR>
    nnoremap #3 :w \|! pdflatex --interaction=batchmode main.tex > /dev/null<CR><CR>
    nnoremap #4 :! bibtex -terse main.aux && pdflatex --interaction=batchmode main.tex > /dev/null && pdflatex --interaction=batchmode main.tex > /dev/null<CR><CR>
endfunction

function! s:EmailSettings()
    nnoremap #1 :w \|! aspell check -e %<CR>

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
endfunction

function! s:GrammarCheck()
    nnoremap #2 :w \|! style %<CR>
endfunction

function! s:MyPySettings()
    set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    nnoremap <F3> :w \|! %<CR>
endfunction

function! s:MyHaskellSettings()
endfunction

function! s:FormatText()
    set tw=72
    vnoremap f :!fmt<CR>
    vnoremap <C-f> {gq}
    nnoremap <C-f> vgq
    inoremap <C-f> <esc>vgqi
endfunction

function! s:SmallTabs()
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
endfunction

function! s:MarkdownSettings()
    noremap #3 :w \|! markdown % > %.html<CR><CR>
    map - :s/^/> /<CR>
    nnoremap mH o====<ESC>
    nnoremap mh o----<ESC>
endfunction

function! s:MyRSettings()
    " Lines added by the Vim-R-plugin command :RpluginConfig (2014-May-15 10:25):
    filetype indent on

    " Use Ctrl+Space to do omnicompletion:
    if has("gui_running")
        inoremap <C-Space> <C-x><C-o>
    else
        inoremap <Nul> <C-x><C-o>
    endif

    " This seems to be necessary to make sure comments remain inline with " text.
    set cindent
    set comments=:#
    set cinkeys-=0# 
endfunction

function! s:MySweaveSettings()
    noremap #5 :w \|! R CMD Sweave %<CR><CR>
endfunction
 
let phd = {}
let phd.path= '~/phdwiki/'
let phd.diary_rel_path = ''
let phd.nested_syntaxes = {'vim': 'vim', 'sh': 'sh', 'plaintex': 'plaintex', 'tex': 'tex', 'C': 'c'}
let bibfiles = {}
let bibfiles.path = '~/phdwiki/bibtex/'
let bibfiles.ext = '.bib'
let rss = {}
let rss.path = '~/phdwiki/rss/'
let rss.ext = '.txt'
let mundane = {}
let mundane.path = '~/extramuros/'
let mundane.diary_rel_path = ''
let blog = {}
let blog.path = '~/src/blog/'
let blog.diary_rel_path = ''
let blog.nested_syntaxes = {'vim': 'vim', 'sh': 'sh', 'plaintex': 'plaintex', 'tex': 'tex', 'C': 'c'}
let g:vimwiki_list = [phd, bibfiles, rss, mundane, blog]

" Change the <LocalLeader> key:
let maplocalleader = ";"

