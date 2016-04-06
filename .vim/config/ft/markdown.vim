" MARKDOWN OPTIONS
autocmd BufNewFile,BufRead *.md,*.markdown set filetype=markdown
autocmd Filetype mkd,markdown call SetMarkdownOptions()
function! SetMarkdownOptions()
  " call textobj#quote#init({'educate': 1})
  set textwidth=70
  let b:AutoPairs={'(':')', '[':']', '{':'}'}
  let b:surround_{char2nr('8')}="**\r**"
endfunction
