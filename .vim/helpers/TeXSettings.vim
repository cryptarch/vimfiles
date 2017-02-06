runtime helpers/PercentComments.vim

nnoremap <buffer>
    \ #1 :w \|! aspell check -t %<CR>
nnoremap <buffer> #2
    \ :write \|! detex % \| style<CR>
nnoremap <buffer> #3
    \ :write \|! pdflatex --interaction=batchmode main.tex > /dev/null<CR><CR>
nnoremap <buffer> #4
    \ :! bibtex -terse main.aux<CR><CR>

" Itemisation mappings.
nnoremap <buffer> <localleader>* :s/^/    \\item /<CR>
vnoremap <buffer> <localleader>* :s/^/    \\item /g<CR>o\end{itemize}<ESC>`<O\begin{itemize}<ESC><l`>
vnoremap <buffer> <localleader># :s/^/    \\item /g<CR>o\end{enumerate}<ESC>`<O\begin{enumerate}<ESC><l`>

" Sectioning.
nnoremap <buffer> <localleader>H :s/\(.*\)/\\chapter{\1}/<CR>
nnoremap <buffer> <localleader>h :s/\(.*\)/\\section{\1}/<CR>
nnoremap <buffer> <localleader>p :s/\(.*\)/\\subsection{\1}/<CR>

" Markup mappings
vnoremap <buffer> <localleader>i mL<Esc>`>a}<Esc>`<i\emph{<Esc>`L4l:delm L<CR>
nnoremap <buffer> <localleader>i mLviw<Esc>`>a}<Esc>`<i\emph{<Esc>`L6l:delm L<CR>

" Unicode search and destroy.
highlight nonascii ctermbg=yellow
call matchadd('nonascii', '[^\x00-\x7F]')
nnoremap <buffer> <localleader>- :%s/\%u2013/--/ge<CR> \| :%s/\%u2014/---/ge<CR>
nnoremap <buffer> <localleader>' :%s/\%u2018/`/ge<CR>  \| :%s/\%u2019/'/ge<CR>
nnoremap <buffer> <localleader>" :%s/\%u201c/``/ge<CR> \| :%s/\%u201d/''/ge<CR>

" Version control condescension.
highlight unbroken ctermbg=blue
call matchadd('unbroken', "[.!?;:'] ")
call matchadd('unbroken', '---[^%]')
nnoremap <buffer> <localleader>b :%s/\([.!?;:']\) /\1\r/ge<CR> \| :%s/---/---%\r/ge<CR>

" Full stops used in abbreviations need special handling
" to avoid treating them like sentence terminators.
highlight abbreviation ctermbg=22

" Match the most common abbreviations: Mr. Mrs. Dr. Drs. St. Ste. Mt. Mts.
match abbreviation "[MDS][rt][se]*\.\( \|$\)"

call matchadd('abbreviation', 'Messrs*\.\( \|$\)')
