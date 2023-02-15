" LIQUID OPTIONS
autocmd Filetype liquid call SetLiquidOptions()
autocmd Filetype liquid set filetype=liquid.html
function! SetLiquidOptions()
  " EmmetInstall
  inoremap <buffer> <C-\> </<C-X><C-O>
  let g:surround_{char2nr('8')}="{% block \r %}\n{% endblock %}"
  let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', '%':'%', '<':'>'}
  map <buffer> <leader>py :%!prettier --parser=liquid-html --print-width 120 --single-quote false<cr>
endfunction
