" HTML OPTIONS
autocmd Filetype html,htmldjango call SetHtmlOptions()
autocmd Filetype html,htmldjango setlocal ts=4 sts=4 sw=4 expandtab
let g:syntastic_html_tidy_ignore_errors=["not recognized!","discarding unexpected"]
let g:syntastic_html_checkers=[]
function! SetHtmlOptions()
  EmmetInstall
  inoremap <buffer> <C-\> </<C-X><C-O>
  let g:surround_{char2nr('8')}="{% block \r %}\n{% endblock %}"
  let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', '%':'%', '<':'>'}
endfunction
