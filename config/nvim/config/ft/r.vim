
function! SetROptions()
  iabbrev <buffer> ]<bar> %>%<cr>
  map <buffer> K <esc>:call RAction('help')<cr>
  set eadirection=hor

  " remapping the basic :: send inner paragraph
  nmap <c-\> vip<Plug>RDSendSelection

  " remapping selection :: send multiple lines
  vmap <c-\> <Plug>RDSendSelection
endfunction

augroup Rlang
  autocmd!
  autocmd Filetype r,rdoc call SetROptions()
augroup END
