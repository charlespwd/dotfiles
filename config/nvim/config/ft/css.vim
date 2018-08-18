" CSS and SCSS options

autocmd BufNewFile,BufRead *.scss setlocal filetype=scss.css
autocmd Filetype css,scss call SetCSSOptions()
function! SetCSSOptions()
  " EmmetInstall
  setlocal iskeyword+=-
  setlocal iskeyword+=$
  setlocal iskeyword+=@
  map <buffer> <Plug>DeInline ^:s/\v[{;}]/\0\r/g<cr>ddk=a}:nohl<cr>
  map <buffer> <leader>il <Plug>DeInline
  let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"'}
endfunction
