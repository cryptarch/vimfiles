" Check for django files. Default vim checker seems prone to false negatives.
let n = 1
while n < 10 && n < line("$")
    if getline(n) =~ '{%.*%}'
        set filetype=htmldjango
        break
    endif
    let n = n + 1
endwhile

