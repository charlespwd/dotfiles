" Prose options
let g:vim_markdown_new_list_item_indent = 0
autocmd FileType markdown,tex call SetProseOptions()
autocmd BufReadPost,FileReadPost *.wiki call SetProseOptions()
function! SetProseOptions()
  let b:delimitMate_expand_space = 0
  try
    nunmap <silent> =p
    nunmap <silent> =P
  catch ".*"
    " deal with it
  endtry

  vmap <leader>K "ic[<c-r>i](<c-r>i)
endfunction
