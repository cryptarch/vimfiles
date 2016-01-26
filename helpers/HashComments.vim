setlocal comments=:#
noremap <buffer> <localleader>- :s/^/#/<CR>:nohlsearch<CR>
noremap <buffer> <localleader>_ :s/^#//g<CR>:nohlsearch<CR>
