" Prose options
let g:vim_markdown_new_list_item_indent = 0
autocmd FileType markdown,tex call SetProseOptions()
function! SetProseOptions()
  let b:delimitMate_expand_space = 0
endfunction