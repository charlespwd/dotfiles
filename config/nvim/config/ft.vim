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
" source ~/.vim/config/ft/ruby.vim

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
  autocmd FileType javascript,sh :map <c-\> :let w:scratch=0<cr>:Redir !./%<cr>
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
  autocmd FileType qf nnoremap <buffer> <leader>nt :QFilter! test<cr>:QFilter! spec<cr>:QFilter! json<cr>:QFilter! scss<cr>:set nowrap<cr>
  autocmd FileType qf nnoremap <buffer> <leader>fa :QFilter! callitspring<cr>:QFilter! globoshoes<cr>:QFilter! composer<cr>
  autocmd FileType qf nnoremap <buffer> <leader>fc :QFilter! aldoshoes<cr>:QFilter! globoshoes<cr>:QFilter! composer<cr>
  autocmd FileType qf nnoremap <buffer> <leader>fC :QFilter composer<cr>
  autocmd FileType qf nnoremap <buffer> <leader>fg :QFilter! aldoshoes<cr>:QFilter! callitspring<cr>:QFilter! composer<cr>

  " Fold by filename
  autocmd BufReadPost quickfix setlocal foldlevel=0
  autocmd BufReadPost quickfix setlocal foldmethod=expr
  " autocmd BufReadPost quickfix setlocal foldexpr=matchstr(getline(v:lnum),'^[^\|]\\+')==#matchstr(getline(v:lnum+1),'^[^\|]\\+')?1:'<1'
  autocmd BufReadPost quickfix setlocal foldexpr=MyFoldLine(v:lnum)
  autocmd BufReadPost quickfix setlocal foldtext=MyFoldText()
  autocmd BufReadPost quickfix highlight clear Folded
  autocmd BufReadPost quickfix highlight Folded ctermfg=Green cterm=bold
augroup END
