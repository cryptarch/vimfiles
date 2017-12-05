" Lines added by the Vim-R-plugin command :RpluginConfig (2014-May-15 10:25):
filetype indent on

" Use Ctrl+Space to do omnicompletion:
if has('gui_running')
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif

" This seems to be necessary to make sure comments remain inline with text.
set cindent
set cinkeys-=0# 
