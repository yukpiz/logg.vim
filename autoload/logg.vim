let s:tag_matches = {
\ 1: 'DEBUG',
\ 2: 'WARNING',
\ 3: 'ERROR',
\}

function! logg#debug(msg, tag)
  let l:line = s:parse_line(a:msg, a:tag)
  call s:write(l:line)
endfunction

function! logg#warn(msg, tag)
  let l:line = s:parse_line(a:msg, a:tag)
  call s:write(l:line)
endfunction

function! logg#error(msg, tag)
  let l:line = s:parse_line(a:msg, a:tag)
  call s:write(l:line)
endfunction

function! s:write(line)
lua << EOL
  fout = io.open(vim.eval('g:logg_file_path'), 'a')
  if fout == nil then
    return
  end
  fout:write(vim.eval('a:line') .. '\n')
  fout:close()
EOL
endfunction

function! s:parse_line(msg, tag)
  let l:lines = []

  "Parse Log TimeStamp
  call add(l:lines, s:parse_time(g:logg_time_format))

  "Parse Log Tag
  call add(l:lines, s:parse_tag(a:tag))

  "Parse Log Message
  call add(l:lines, s:parse_msg(a:msg))

  return join(l:lines, ' ')
endfunction

function! s:sandwitch_brackets(val)
  return '[' . a:val . ']'
endfunction

function! s:parse_time(format)
  let l:time = strftime(a:format)
  return s:sandwitch_brackets(l:time)
endfunction

function! s:parse_tag(tag)
  return has_key(s:tag_matches, a:tag) ?
  \ s:sandwitch_brackets(s:tag_matches[a:tag]) : ''
endfunction

function! s:parse_msg(msg)
  let l:msg = substitute(a:msg, '^\"', '', 'g')
  return substitute(l:msg, '\"$', '', 'g')
endfunction
