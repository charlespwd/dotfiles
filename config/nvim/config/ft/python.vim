function! SetPythonOptions()
  map <c-\> :!nosetests
  map <c-]> :Redir !python <c-r>=expand('%')<cr><cr>
  map <a-]> :!python <c-r>=expand('%')<cr><cr>
endfunction

augroup Python
  autocmd!
  autocmd Filetype python call SetPythonOptions()
augroup END
