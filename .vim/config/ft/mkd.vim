" MARKDOWN OPTIONS
autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=mkd
autocmd Filetype mkd call SetMarkdownOptions()
function! SetMarkdownOptions()
  call textobj#quote#init({'educate': 1})
  set textwidth=100
  let b:AutoPairs={'$':'$', '(':')', '[':']', '{':'}'}
  let b:surround_{char2nr('8')}="**\r**"
endfunction
