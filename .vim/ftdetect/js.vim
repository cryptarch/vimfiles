augroup geojson
    autocmd!
    autocmd BufRead,BufNewFile *.geojson set filetype=json
augroup END

augroup gapps
    autocmd!
    autocmd BufRead,BufNewFile *.gs set filetype=javascript
augroup END
