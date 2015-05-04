" HTML OPTIONS
autocmd Filetype html setlocal ft=htmldjango
autocmd Filetype html,scss,css,htmldjango call SetHtmlOptions()
autocmd Filetype html,htmldjango setlocal ts=4 sts=4 sw=4 expandtab
function! SetHtmlOptions()
  EmmetInstall
  inoremap <buffer> <C-\> </<C-X><C-O>
  map <buffer> <Plug>DeInline ^:s/\v[{;}]/\0\r/g<cr>ddk=a}:nohl<cr>
  map <buffer> <leader>il <Plug>DeInline
  let g:surround_{char2nr('8')}="{% block \r %}\n{% endblock %}"
  let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', '%':'%', '<':'>'}
endfunction
