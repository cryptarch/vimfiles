runtime helpers/HashComments.vim

map #5 :w \|! %
map #6 :w \| so %

" Workaround for a won't-fix bug in bash syntax highlighting.
let g:vimsyn_noerror = 1 
