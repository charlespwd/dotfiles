" RUBY OPTIONS
let g:ruby_indent_assignment_style = 'variable'

autocmd Filetype ruby call SetRubyOptions()
function! SetRubyOptions()
  let b:AutoPairs = g:AutoPairs
  let b:AutoPairsMapSpace = 1
  let b:AutoPairs['|'] = '|'
  let b:surround_{char2nr('e')} = "things.each do |thing|\n\t\r\nend"
  let b:surround_{char2nr('m')} = "module Module\n\t\r\nend"
  let b:surround_{char2nr('c')} = "class Thing\n\t\r\nend"
endfunction

autocmd Filetype eruby call SetERubyOptions()
function! SetERubyOptions()
  inoremap <buffer> <C-\> </<C-X><C-O>
  let b:AutoPairs={'$':'$', '(':')', '[':']', '{':'}', '"':'"', '%':'%', '<':'>'}
endfunction
