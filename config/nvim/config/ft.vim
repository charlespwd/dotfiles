" Stuff that should come first
source ~/.vim/config/ft/prose.vim

" Filetypes
source ~/.vim/config/ft/clojure.vim
source ~/.vim/config/ft/css.vim
source ~/.vim/config/ft/html.vim
source ~/.vim/config/ft/javascript.vim
" source ~/.vim/config/ft/python.vim
" source ~/.vim/config/ft/latex.vim
" source ~/.vim/config/ft/markdown.vim
" source ~/.vim/config/ft/ruby.vim

" Others
autocmd FileType ruby,tex,clojure,md,html,javascript,css,scss,vim,unix,typescript autocmd BufWritePre <buffer> StripWhitespace
autocmd BufReadPre,FileReadPre help set relativenumber
autocmd FileType json let b:ale_lint_on_enter = 1

autocmd Filetype liquid set filetype=liquid.html

" wrap in quickfix
autocmd FileType qf setlocal wrap

" remap <c-i> to copy the import statement
autocmd FileType qf nnoremap <buffer> <C-i> /import<cr>y$<c-k>

" remap ctrl+v in quickfix to vertical split
autocmd FileType qf nnoremap <buffer> <C-v> <C-w><cr><C-w>L

" autocmd BufNewFile,BufRead *.raml setlocal filetype=yaml
" autocmd Filetype mail setlocal ft=markdown.mail

" Always show gutter to prevent annoying left-right shift when done with
" warnings
"autocmd BufEnter * sign define dummy
"autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
