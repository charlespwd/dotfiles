" ft specific foo
" =========================================================

" PROSE OPTIONS
let g:pencil#autoformat = 1
let g:pencil#conceallevel = 3
autocmd Filetype markdown set filetype=mkd
autocmd FileType mkd,tex call SetProseOptions()
function! SetProseOptions()
  call pencil#init()
  call lexical#init()
endfunction

source ~/.vim/config/ft/clojure.vim
source ~/.vim/config/ft/html.vim
source ~/.vim/config/ft/javascript.vim
source ~/.vim/config/ft/latex.vim
source ~/.vim/config/ft/mkd.vim
source ~/.vim/config/ft/ruby.vim

autocmd FileType ruby,tex,clojure,mkd,md,html,javascript,css,scss,vim autocmd BufWritePre <buffer> StripWhitespace
autocmd Filetype java setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd BufReadPre,FileReadPre help set relativenumber
autocmd BufNewFile,BufRead *.raml setlocal filetype=yaml
autocmd BufNewFile,BufRead *.scss setlocal filetype=scss.css
