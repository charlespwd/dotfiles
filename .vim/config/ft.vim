" Stuff that should come first
source ~/.vim/config/ft/prose.vim

" Filetypes
source ~/.vim/config/ft/clojure.vim
source ~/.vim/config/ft/css.vim
source ~/.vim/config/ft/html.vim
source ~/.vim/config/ft/javascript.vim
source ~/.vim/config/ft/python.vim
source ~/.vim/config/ft/latex.vim
source ~/.vim/config/ft/markdown.vim
source ~/.vim/config/ft/ruby.vim

" Others
autocmd FileType ruby,tex,clojure,md,html,javascript,css,scss,vim autocmd BufWritePre <buffer> StripWhitespace
autocmd Filetype java setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd BufReadPre,FileReadPre help set relativenumber
autocmd BufNewFile,BufRead *.raml setlocal filetype=yaml
autocmd Filetype mail setlocal ft=markdown.mail
