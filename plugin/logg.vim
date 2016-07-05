if !exists('g:logg_time_format')
  let g:logg_time_format = '%c'
endif

command! DebugLogg call logg#debug(<f-args>, 1)
command! WarnLogg  call logg#warn(<f-args>, 2)
command! ErrorLogg call logg#error(<f-args>, 3)
