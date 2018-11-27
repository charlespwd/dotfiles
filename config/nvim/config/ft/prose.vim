" Prose options
let g:vim_markdown_new_list_item_indent = 0
autocmd FileType markdown,tex,vimwiki call SetProseOptions()
autocmd BufReadPost,FileReadPost *.wiki call SetProseOptions()
function! SetProseOptions()
  let b:delimitMate_expand_space = 0
  let b:surround_{char2nr('k')} = "[\r]()"
  try
    nunmap <silent> =p
    nunmap <silent> =P
  catch ".*"
    " deal with it
  endtry

  vmap <leader>K "ic[<c-r>i](<c-r>i)
endfunction
