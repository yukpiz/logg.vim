let s:tag_matches = {
\ 1: 'DEBUG',
\ 2: 'WARNING',
\ 3: 'ERROR',
\}

function! logg#debug(msg, tag)
  let l:line = logg#parse_line(a:msg, a:tag)
endfunction

function! logg#warn(msg, tag)
  let l:line = logg#parse_line(a:msg, a:tag)
endfunction

function! logg#error(msg, tag)
  let l:line = logg#parse_line(a:msg, a:tag)
endfunction

function! logg#write(line)
endfunction

function! logg#parse_line(msg, tag)
  let l:lines = []

  "Parse Log TimeStamp
  call add(l:lines, logg#parse_time(g:logg_time_format))

  "Parse Log Tag
  call add(l:lines, logg#parse_tag(a:tag))

  "Parse Log Message
  call add(l:lines, a:msg)

  return join(l:lines, ' ')
endfunction

function! logg#sandwitch_brackets(val)
  return '[' . a:val . ']'
endfunction

function! logg#parse_tag(tag)
  return has_key(s:tag_matches, a:tag) ?
  \ logg#sandwitch_brackets(s:tag_matches[a:tag]) : ''
endfunction

function! logg#parse_time(format)
  let l:time = strftime(a:format)
  return logg#sandwitch_brackets(l:time)
endfunction
