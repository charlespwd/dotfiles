" HTML OPTIONS
autocmd Filetype html,htmldjango call SetHtmlOptions()
let g:syntastic_html_tidy_ignore_errors=["not recognized!","discarding unexpected"]
let g:syntastic_html_checkers=[]
function! SetHtmlOptions()
  " EmmetInstall
  inoremap <buffer> <C-\> </<C-X><C-O>
  let g:surround_{char2nr('8')}="{% block \r %}\n{% endblock %}"
  let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', '%':'%', '<':'>'}
  map <buffer> <leader>B :!b build<cr>
  map <buffer> <leader>UI <Plug>ExpandHTML
endfunction
