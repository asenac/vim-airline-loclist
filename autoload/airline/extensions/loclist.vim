" vim: et ts=2 sts=2 sw=2

let s:spc = g:airline_symbols.space

function! airline#extensions#loclist#init(ext)
  call airline#parts#define_raw('loclist', '%{airline#extensions#loclist#get_errors()}')
  call a:ext.add_statusline_func('airline#extensions#loclist#apply')
endfunction

function! airline#extensions#loclist#apply(...)
  if &filetype == "cpp"
    let w:airline_section_warning = get(w:, 'airline_section_warning', g:airline_section_warning)
    let w:airline_section_warning .= s:spc.g:airline_left_alt_sep.s:spc.'%{airline#extensions#loclist#get_errors()}'
  endif
endfunction

function! airline#extensions#loclist#get_errors()
  let l = getloclist(0)
  let errors = 0
  let warns = 0
  let error_line = ''
  let warn_line = ''
  for i in l
    if i.type == 'E'
      let errors += 1
      if errors == 1
        let error_line = ' (line: ' . i.lnum . ')'
      endif
    else 
      let warns += 1
      if warns == 1
        let warn_line = ' (line: ' . i.lnum . ')'
      endif
    endif
  endfor

  let res = ''
  if errors > 0
    let res .= 'E: ' . errors . error_line . ' '
  endif
  if warns > 0
    let res .= 'W: ' . warns . warn_line . ' '
  endif
  return res
endfunction

