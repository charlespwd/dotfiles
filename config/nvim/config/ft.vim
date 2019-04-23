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
  autocmd BufEnter *.png,*.jpg,*gif,*tif exec "! /usr/bin/xdg-open ".expand("%") | :bw
  autocmd BufWritePre *.py execute ':Black'
  autocmd BufEnter */config/jira/templates/* set ft=gotexttmpl
augroup END

augroup runnable
  autocmd!
  autocmd FileType javascript,sh :map <c-\> :let w:scratch=0<cr>:Redir !./%<cr>
  autocmd BufEnter */shoebox/packages/*.test.js :map <c-\> :let w:scratch=0<cr>:Redir !scripts/run-test <c-r>=expand('%:p')<cr><cr>
augroup END

autocmd Filetype liquid set filetype=liquid.html

augroup quickfix
  autocmd!

  " wrap in quickfix
  autocmd FileType qf setlocal wrap

  " remap <c-i> to copy the import statement
  autocmd FileType qf nnoremap <buffer> <C-i> /import<cr>y$<c-k>

  " remap ctrl+v in quickfix to vertical split
  autocmd FileType qf nnoremap <buffer> <C-v> <C-w><cr><C-w>L
augroup END
