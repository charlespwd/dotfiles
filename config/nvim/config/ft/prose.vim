" Prose options
let g:vim_markdown_new_list_item_indent = 0
autocmd FileType markdown,tex,vimwiki call SetProseOptions()
autocmd BufReadPost,FileReadPost *.wiki call SetProseOptions()

autocmd BufReadPost g:vimwiki_list[0].path . '*.md' call SetVimwikiOptions()

function! SetVimwikiOptions()
  let paths = deepcopy(g:vimwiki_list)->map('g:vimwiki_list[v:key].path')
  let isWiki = paths->filter('match(expand("%"), v:val) != -1 ')
  nmap <buffer> <leader>F :Files ~/Documents/wiki<cr>
  map <buffer> <leader>f :Files <c-r>=g:vimwiki_list[0].path<cr><cr>
  nmap <buffer> <leader>s :VWS<space>
  map <buffer> <leader>2g :!gh gist create '%'<cr>

  " <c-space> manual complete
  inoremap <silent><expr> <c-space> pumvisible()
        \? coc#_select_confirm()
        \: coc#refresh()

  " (CoC) Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible()
        \? coc#_select_confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
endfunction

function! SetProseOptions()
  let b:AutoPairsMapSpace = 0
  let b:delimitMate_expand_space = 0
  let b:surround_{char2nr('K')} = "[\r]()"
  let b:surround_{char2nr('k')} = "[[\r]]"
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

  map <Plug>DirName() :let @d = system('echo -n $(basename $(dirname '.expand('%:p').'))')<cr>
  vmap <buffer> <leader>K <Plug>DirName()"ic[<c-r>i](<c-r>i)
  vmap <buffer> <leader>T <Plug>DirName()"ic([#<c-r>i](https://github.com/shopify/<c-r>d/issues/<c-r>i))
  nmap <buffer> <leader>T <Plug>DirName()"iciw([#<c-r>i](https://github.com/shopify/<c-r>d/issues/<c-r>i))
  nmap <buffer> <leader>I <Plug>DirName()"iciw[#<c-r>i](https://github.com/shopify/<c-r>d/issues/<c-r>i)
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
