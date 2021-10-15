noremap <silent> <buffer> <leader>jr :call <SID>runJava()<CR>

function! s:runJava() abort
  let src_path = expand('%:p:~')
  call s:create_term_buf('v', 80)
  execute printf('term java %s', src_path)
endfunction

function s:create_term_buf(_type, size) abort
  set splitbelow
  set splitright
  if a:_type ==# 'v'
    vnew
  else
    new
  endif
  execute 'resize ' . a:size
endfunction
