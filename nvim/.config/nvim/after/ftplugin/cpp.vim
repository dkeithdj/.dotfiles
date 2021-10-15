" build and run
nnoremap <silent> <buffer> <leader>fb :call <SID>compile_run_cpp()<CR>
" run only
nnoremap <silent> <buffer> <leader>fr :call <SID>run_cpp()<CR>

function! s:compile_run_cpp() abort
  let src_path = expand('%:p:~')
  let src_noext = expand('%:p:~:r')
  " The building flags
  let _flag = '-Wall -Wextra -O2'

  if executable('clang++')
    let prog = 'clang++'
  elseif executable('g++')
    let prog = 'g++'
  else
    echoerr 'No C++ compiler found on the system!'
  endif
  call s:create_term_buf('v', 80)
  execute printf('term %s %s -o %s && %s', prog, src_path, src_noext, src_noext)
  startinsert
endfunction

function! s:run_cpp() abort
  let src_noext = expand('%:p:~:r')
  call s:create_term_buf('v', 80)
  execute printf('term %s ', src_noext)
  startinsert
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
