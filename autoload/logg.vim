function! logg#write(msg, tag)
    echo a:msg
    echo a:tag
lua << EOC
    fout = io.open('logg.log', 'a')
    fout:write(vim.eval('a:msg'))
    fout:close()
EOC
endfunction

command! Logg      call logg#write(<f-args>, 0)
command! DebugLogg call logg#write(<f-args>, 1)
command! WarnLogg  call logg#write(<f-args>, 2)
command! ErrorLogg call logg#write(<f-args>, 3)
