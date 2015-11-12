runtime helpers/PercentComments.vim

nnoremap #1 :w \|! aspell check -t %<CR>
nnoremap #2 :w \|! detex % \| style<CR>
nnoremap #3 :w \|! pdflatex --interaction=batchmode main.tex > /dev/null<CR><CR>
nnoremap #4 :! bibtex -terse main.aux && pdflatex --interaction=batchmode main.tex > /dev/null && pdflatex --interaction=batchmode main.tex > /dev/null<CR><CR>
