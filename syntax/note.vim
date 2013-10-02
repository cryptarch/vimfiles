" Vim syntax file
" Language: Notes

if exists("b:current_syntax")
    finish
endif

syn match noteBullet "^\s\s*[[:punct:][:digit:]]\s"

syn region noteString start=/\v^"/ skip=/\v\\./ end=/\v"/
syn region textAuthor start=/\v\[/ skip=/\v\\./ end=/\v\]/

syn match sectionDivider "^==*$"
syn match subsectionDivider "^--*$"
syn match noteHeading "^[A-Z]*$"

syn match noteHyperlink 'http://[[:alnum:][:punct:]]*'
syn match noteHyperlink 'www\.[[:alnum:][:punct:]]*'

hi def link sectionDivider Delimiter
hi def link subsectionDivider Delimiter
hi def link noteHyperlink Hyperlink
hi def link noteHeading SpecialComment
hi def link noteBullet Statement
hi def link noteString Function
hi def link textAuthor Include

let b:current_syntax="note"
