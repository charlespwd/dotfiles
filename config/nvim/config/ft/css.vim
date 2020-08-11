" CSS and SCSS options

autocmd BufNewFile,BufRead *.scss setlocal filetype=scss.css
autocmd Filetype css,scss call SetCSSOptions()

function! SassPath(path, dirname)
  let path = a:path
  let path = substitute(path, '^\.', a:dirname . '/.', '')
  let path = substitute(path, '\~@aldogroup/', '/home/charles/ws/aldo/shoebox/packages/', '')
  let path = substitute(path, '^aldogroup/', '/home/charles/ws/aldo/shoebox/packages/', '')
  return path
endfunction

function! SetCSSOptions()
  " EmmetInstall
  setlocal iskeyword+=-
  setlocal iskeyword+=$
  setlocal iskeyword+=@
  map <buffer> <Plug>DeInline ^:s/\v[{;}]/\0\r/g<cr>ddk=a}:nohl<cr>
  map <buffer> <leader>il <Plug>DeInline
  map <buffer> gf :let @e=SassPath(expand('<cfile>'), expand('%:p:h'))<cr>:e <c-r>e<cr>
  let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"'}
  map <buffer> <leader>mv :MoveFileAndRename <c-r>=expand('%')<cr>
endfunction
