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
