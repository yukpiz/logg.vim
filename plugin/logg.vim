let g:logg_debug = 1

if g:logg_debug || !exists('g:logg_time_format')
  let g:logg_time_format = '%c'
endif

if g:logg_debug || !exists('g:logg_file_path')
  let g:logg_file_path = $HOME . '/logg.log'
endif

command! DebugLogg call logg#debug(<f-args>, 1)
command! WarnLogg  call logg#warn(<f-args>, 2)
command! ErrorLogg call logg#error(<f-args>, 3)
