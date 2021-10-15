noremap <silent> <buffer> <leader>yr :call <SID>run_python()<CR>

function! s:run_python() abort
  let src_path = expand('%:p:~')
  call s:create_term_buf('v', 80)
  execute printf('term python3.8 %s', src_path)
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
