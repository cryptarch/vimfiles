let return_map_save = maparg('<Return>', 'n', 0, 1)
au CmdwinEnter [:>] nunmap <Return>
au CmdwinLeave [:>] exe (return_map_save.noremap ? 'nnoremap' : 'nmap') .
                    \ (return_map_save.buffer ? ' <buffer> ' : '') .
                    \ (return_map_save.expr ? ' <expr> ' : '') .
                    \ (return_map_save.nowait ? ' <nowait> ' : '') .
                    \ (return_map_save.silent ? ' <silent> ' : '') .
                    \ ' <Return> ' .
                    \ return_map_save.rhs
