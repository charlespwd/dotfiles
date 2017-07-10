function! SetPythonOptions()
  map <c-\> :!nosetests
endfunction

autocmd Filetype python call SetPythonOptions()
