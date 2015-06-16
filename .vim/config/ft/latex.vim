" LATEX OPTIONS
let g:tex_flavor='latex'
autocmd BufReadPre,FileReadPre *.tex set filetype=tex
autocmd Filetype tex call SetTexOptions()
function! SetTexOptions()
  setlocal foldenable
  setlocal grepprg=grep\ -nH\ $*
  setlocal shellslash
  setlocal textwidth=70
  let b:AutoPairs={'$':'$', '(':')', '[':']', '{':'}'}
  let b:surround_{char2nr('q')} = "``\r''"
  let b:surround_{char2nr('m')} = "\\texttt{\r}"
  let b:surround_{char2nr('i')} = "\\textit{\r}"
  let b:surround_{char2nr('e')} = "\\textbf{\r}"
  PencilOff
endfunction
