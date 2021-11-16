noremap <silent> <buffer> <leader>jr :call <SID>runJavaWSL()<CR>
noremap <silent> <buffer> <leader>jrg :call <SID>runJavaWindows()<CR>

" Run in wsl (no gui support) java
function! s:runJavaWSL() abort
  let src_path = expand('%:p:~')
  call s:create_term_buf('v', 80)
  execute printf('term java %s', src_path)
endfunction

" Run in windows java
function! s:runJavaWindows() abort
  let src_path = expand('%:p:~')
  call s:create_term_buf('v', 80)
  execute printf('term java.exe $(basename %s)', src_path)
endfunction

function s:mvnRunner() abort
  
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
