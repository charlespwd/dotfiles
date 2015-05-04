" MARKDOWN OPTIONS
autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=mkd.markdown tw=66
autocmd Filetype mkd call SetMarkdownOptions()
function! SetMarkdownOptions()
  call textobj#quote#init()
  let g:surround_{char2nr('8')}="**\r**"
  iabbrev <buffer> -- —
endfunction
