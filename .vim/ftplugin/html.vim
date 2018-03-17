" Check for django files. Default vim checker seems prone to false negatives.
let g:n = 1
while g:n < 10 && g:n < line('$')
    if getline(g:n) =~? '{%.*%}'
        set filetype=htmldjango
        break
    endif
    let g:n = g:n + 1
endwhile

