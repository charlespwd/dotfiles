" RUBY OPTIONS
autocmd Filetype ruby call SetRubyOptions()
function! SetRubyOptions()
  let g:rspec_command = "!rspec --format documentation --color {spec}"
  setlocal ts=2 sts=2 sw=2 expandtab
  map <buffer> <leader>L :call RunAllSpecs()<CR>
  map <buffer> <leader>S :call RunNearestSpec()<CR>
  map <buffer> <leader>T :call RunCurrentSpecFile()<CR>
endfunction
autocmd Filetype eruby call SetERubyOptions()
function! SetERubyOptions()
  EmmetInstall
  inoremap <buffer> <C-\> </<C-X><C-O>
  let b:AutoPairs={'$':'$', '(':')', '[':']', '{':'}', '"':'"', '%':'%', '<':'>'}
  setlocal ts=4 sts=4 sw=4 expandtab
endfunction
