" Stuff that should come first
source ~/.vim/config/ft/prose.vim

" Filetypes
source ~/.vim/config/ft/clojure.vim
source ~/.vim/config/ft/css.vim
source ~/.vim/config/ft/html.vim
source ~/.vim/config/ft/javascript.vim
source ~/.vim/config/ft/python.vim
" source ~/.vim/config/ft/latex.vim
" source ~/.vim/config/ft/markdown.vim
source ~/.vim/config/ft/ruby.vim
source ~/.vim/config/ft/r.vim

" Others
augroup misc
  " clear the commands
  autocmd!
  autocmd FileType ruby,tex,clojure,md,html,javascript,css,scss,vim,unix,typescript autocmd BufWritePre <buffer> StripWhitespace
  autocmd BufReadPre,FileReadPre help set relativenumber
  autocmd FileType json let b:ale_lint_on_enter = 1
  autocmd FileType gitcommit,pullrequest if expand('%:t') == 'PULLREQ_EDITMSG' | set filetype=vimwiki | endif
  autocmd FileType gitcommit,pullrequest set bufhidden=delete
  autocmd FileType sql setlocal formatprg=sqlfmt\ -u
  autocmd TermOpen * set bufhidden=hide
  autocmd BufEnter *.png,*.jpg,*.gif,*.tif exec "! /usr/bin/xdg-open ".expand("%") | :bw
  autocmd BufWritePre *.py execute ':Black'
  autocmd BufEnter */config/jira/templates/* set ft=gotexttmpl
  autocmd FileType yaml setlocal complete+=k
  autocmd FileType yaml setlocal dictionary+=$JIRA/contacts.txt
augroup END

augroup runnable
  autocmd!
  autocmd FileType javascript,sh :map <c-\> :let w:scratch=0<cr>:Redir !<c-r>=expand('%')<cr><cr>
  autocmd FileType javascript :map <c-\> :Dispatch<cr>
  autocmd BufEnter */shoebox/* :map <silent> <leader>ap :!./scripts/replace-relative-imports %<cr><cr>
augroup END

autocmd Filetype liquid set filetype=liquid.html

function! MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '\v[|].*$', '', 'g')
  return sub
endfunction

function! MyFoldLine(lnum)
  let line = getline(a:lnum)
  if line =~ '^||' || line =~ 'info'
    return 1
  endif

  return 0
  " if matchstr(getline(a:lnum),'^[^\|]\\+') ==# matchstr(getline(a:lnum + 1),'^[^\|]\\+')
  "   return 1
  " else
  "   return '<1'
  " endif
  " if getline(a:lnum) =~? '\v<info>'
  "   return '-1';
  " endif
  " return '0'
  " let line = getline(a:lnum)
  "   return 0;
  " endif
endfunction

augroup quickfix
  autocmd!

  " nowrap in quickfix
  autocmd FileType qf setlocal nowrap

  " remap <c-i> to copy the import statement
  autocmd FileType qf nnoremap <buffer> <C-i> /import<cr>y$:let @@ = @@."\n"<cr><c-w><c-k>N

  " remap ctrl+v in quickfix to vertical split
  autocmd FileType qf nnoremap <buffer> <C-v> <C-w><cr><C-w>L

  " quick filter
  autocmd FileType qf nnoremap <buffer> <leader>nt :QFilter! test<cr>:QFilter! spec<cr>:QFilter! json<cr>:QFilter! scss<cr>:QFilter! yml<cr>:QFilter! erb<cr>:set nowrap<cr>
  autocmd FileType qf nnoremap <buffer> <leader>fa :QFilter! callitspring<cr>:QFilter! globoshoes<cr>:QFilter! composer<cr>
  autocmd FileType qf nnoremap <buffer> <leader>fc :QFilter! aldoshoes<cr>:QFilter! globoshoes<cr>:QFilter! composer<cr>
  autocmd FileType qf nnoremap <buffer> <leader>fC :QFilter composer<cr>
  autocmd FileType qf nnoremap <buffer> <leader>fg :QFilter! aldoshoes<cr>:QFilter! callitspring<cr>:QFilter! composer<cr>

  " No whitespace warnings
  autocmd FileType qf DisableWhitespace

  " Fold by filename
  autocmd BufReadPost quickfix setlocal foldlevel=0
  autocmd BufReadPost quickfix setlocal foldmethod=expr
  autocmd BufReadPost quickfix setlocal foldexpr=matchstr(getline(v:lnum),'^[^\|]\\+')==#matchstr(getline(v:lnum+1),'^[^\|]\\+')?1:'<1'
  autocmd BufReadPost quickfix setlocal foldexpr=MyFoldLine(v:lnum)
  autocmd BufReadPost quickfix setlocal foldtext=MyFoldText()
  autocmd BufReadPost quickfix highlight clear Folded
  autocmd BufReadPost quickfix highlight Folded ctermfg=Green cterm=bold
augroup END

function! AleLSPBindings()
  " <c-space> manual complete
  inoremap <silent><expr> <c-space> deoplete#manual_complete('ale')

  " docs
  map <buffer> K <plug>(ale_hover)

  " go to docs
  map <buffer> <c-]> <plug>(ale_go_to_definition)
  map <buffer> <c-}> <plug>(ale_go_to_definition_in_vsplit)
  map <buffer> <c-t> <plug>(ale_go_to_type_definition)

  imap <c-x><c-o> <Plug>(ale_complete)
endfunction

function! CoCLSPBindings()

  " <c-space> manual complete
  inoremap <silent><expr> <c-space> pumvisible()
        \? coc#_select_confirm()
        \: coc#refresh()

  " (CoC) Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible()
        \? coc#_select_confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " (CoC) GoTo code navigation.
  nmap <buffer> <c-]> <plug>(coc-definition)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  " xmap <leader>f  <Plug>(coc-format-selected)
  " nmap <leader>f  <Plug>(coc-format-selected)

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>ca  <Plug>(coc-codeaction-selected)
  nmap <leader>ca  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>caF  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd FileType javascript,ruby,typescript,typescript.jsx,vimwiki,liquid call CoCLSPBindings()
autocmd CursorHold javascript,ruby,typescript,typescript.jsx,liquid silent call CocActionAsync('highlight')
augroup CoCStuff
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END
