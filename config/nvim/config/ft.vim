" Stuff that should come first
source ~/.vim/config/ft/prose.vim

" Filetypes
source ~/.vim/config/ft/clojure.vim
" source ~/.vim/config/ft/css.vim
source ~/.vim/config/ft/html.vim
source ~/.vim/config/ft/javascript.vim
" source ~/.vim/config/ft/python.vim
" source ~/.vim/config/ft/latex.vim
" source ~/.vim/config/ft/markdown.vim
" source ~/.vim/config/ft/ruby.vim

" Others
autocmd FileType ruby,tex,clojure,md,html,javascript,css,scss,vim,unix autocmd BufWritePre <buffer> StripWhitespace
autocmd BufReadPre,FileReadPre help set relativenumber
" autocmd BufNewFile,BufRead *.raml setlocal filetype=yaml
" autocmd Filetype mail setlocal ft=markdown.mail

" Always show gutter to prevent annoying left-right shift when done with
" warnings
"autocmd BufEnter * sign define dummy
"autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
