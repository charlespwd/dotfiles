" Prose options
let g:vim_markdown_new_list_item_indent = 0
autocmd FileType markdown,tex,vimwiki call SetProseOptions()
autocmd FileType vimwiki call SetVimwikiOptions()
autocmd BufReadPost,FileReadPost *.wiki call SetProseOptions()

function! SetVimwikiOptions()
  nmap <buffer> <leader>f :Files ~/Documents/wiki<cr>
  nmap <buffer> <leader>s :VWS<space>
endfunction

function! SetProseOptions()
  let b:AutoPairsMapSpace = 0
  let b:delimitMate_expand_space = 0
  let b:surround_{char2nr('k')} = "[\r]()"
  let b:surround_{char2nr('~')} = "```\n\r\n```"
  let b:surround_{char2nr('B')} = "**\r**"
  " call deoplete#custom#buffer_option('auto_complete', v:false)

  setlocal foldmethod=expr
  setlocal foldexpr=MarkdownFoldLevel(v:lnum)
  setlocal foldcolumn=3

  try
    nunmap <silent> =p
    nunmap <silent> =P
  catch ".*"
    " deal with it
  endtry

  vmap <buffer> <leader>K "ic[<c-r>i](<c-r>i)
  vmap <buffer> <leader>T "ic([#<c-r>i](https://github.com/shopify/theme-check/issues/<c-r>i))
  nmap <buffer> <leader>T "iciw([#<c-r>i](https://github.com/shopify/theme-check/issues/<c-r>i))
  setlocal spell spelllang=en_us
  call textobj#quote#init()

  map <buffer><silent> <leader>"c <Plug>ReplaceWithCurly
  map <buffer><silent> <leader>"s <Plug>ReplaceWithStraight
  map <buffer><silent> <leader>"s <Plug>ReplaceWithStraight
  map <buffer><silent> <leader>toc :read !cat '%' <bar> $BIN/gh-md-toc -<cr>
  vmap <buffer><silent> <leader>toc :!cat '%' <bar> $BIN/gh-md-toc -<cr>

  map <buffer> <leader>1 I#<space>
  map <buffer> <leader>2 I##<space>
  map <buffer> <leader>3 I###<space>
  map <buffer> <leader>4 I####<space>
  map <buffer> <leader>5 I#####<space>
  map <buffer> <leader>6 I######<space>
endfunction

function! MarkdownFoldLevel(lnum)
  let l1 = getline(a:lnum)

  if l1 =~ '^\s*$'
    return '='
  endif

  let l2 = getline(a:lnum+1)

  if l1 =~ '^---$' && a:lnum == 1
    " fold frontmatter
    return '>1'
  elseif l1 =~ '^---$'
    " done folding
    return '<1'
  elseif l1 =~ '^#'
    " fold headers (2nd level first)
    return '>' . (matchend(l1, '^#\+') - 1)
  elseif l2 =~ '^#'
    return 's1'
  else
    return '='
  endif
endfunction
