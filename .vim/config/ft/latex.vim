" LATEX OPTIONS
let g:tex_flavor='latex'
autocmd BufReadPre,FileReadPre *.tex set filetype=tex
autocmd Filetype tex call SetTexOptions()
function! SetTexOptions()
  PencilOff
  setlocal foldenable
  setlocal grepprg=grep\ -nH\ $*
  setlocal shellslash
  setlocal textwidth=70
  let g:AutoPairs={'$':'$', '(':')', '[':']', '{':'}'}
  let g:surround_{char2nr('q')} = "``\r''"
  let g:surround_{char2nr('m')} = "\\texttt{\r}"
  let g:surround_{char2nr('i')} = "\\textit{\r}"
  let g:surround_{char2nr('e')} = "\\textbf{\r}"
endfunction


