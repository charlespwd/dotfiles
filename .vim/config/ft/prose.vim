" Prose options
let g:pencil#autoformat = 1
let g:pencil#conceallevel = 2
let g:online_thesaurus_map_keys = 0
autocmd FileType markdown,tex call SetProseOptions()
function! SetProseOptions()
  call pencil#init()
  call lexical#init()
  map <Plug>Dictionary :MacDictCWord<cr>:set ft=markdown<cr>:%s#\vDERIVATIVE<bar>ORIGIN<bar>[▶•]#\r\r\0#g<cr>:nohl<cr>ggvG$gqgg^
  map <Plug>LearnWord :let @g=expand('<cword>')<cr>:e ~/thoughts/new-words.md<cr>G<cr>i- <c-r>g: <esc>2h<Plug>Dictionary<c-w><c-k>$
  map <buffer> <leader>D <Plug>Dictionary
  map <buffer> <leader>Q :bd<cr>:bd<cr>
  map <buffer> <leader>T :OnlineThesaurusCurrentWord<cr>
  map <buffer> <leader>W <Plug>LearnWord
endfunction
