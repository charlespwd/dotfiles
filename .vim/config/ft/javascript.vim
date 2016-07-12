" JAVASCRIPT OPTIONS
let g:javascript_conceal_function   = "λ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
let g:angular_skip_alternate_mappings = 1

" these 2 lines check to see if eslint is installed via local npm and runs that before going global
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

let b:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['eslint']

function! SetJavascriptOptions()

  " if filereadable('./.eslintrc')
  "   let g:syntastic_javascript_checkers = ['eslint']
  " else
  "   let g:syntastic_javascript_checkers = ['jshint']
  " endif

  " surround with console.log
  let b:surround_{char2nr('c')} = "console.log(\r)"
  let b:surround_{char2nr('a')} = "$scope.$apply(function() {\n\r\n});"
  let b:surround_{char2nr('F')} = "(function() {\n\r\n})();"
  let b:surround_{char2nr('f')} = "function PLACEHOLDER() {\n\r\n}"
  let b:surround_{char2nr('i')} = "it('', function() {\n\r\n});"
  let b:surround_{char2nr('I')} = "if (true) {\n\r\n}"
  let b:surround_{char2nr('n')} = "{{/*\n\r\n*/}}"
  let b:surround_{char2nr('d')} = "describe('', function() {\n\r\n});"
  let b:surround_{char2nr('D')} = "describe('', () => {\n\r\n})"
  set conceallevel=2

  " Extract text under cursor as variable
  map <buffer> <Plug>JSExtractVariable "vd<esc>:let @n=Input('Name: ')<cr>"nP[{ovar <c-r>n = <c-r>v;<esc>:%s#<c-r>v#<c-r>n#gc<cr>
  vmap <buffer> <leader>X <Plug>JSExtractVariable

  " Inline variable
  map <buffer> <Plug>JSInlineVariable "ny<esc>?\v(let<bar>var<bar>const) <c-r>n<cr>f=w"vdt;dd:%s#<c-r>n#<c-r>v#gc
  vmap <buffer> <leader>I <Plug>JSInlineVariable
  map <buffer> <Plug>JumpToModule() viw"iy/import <c-r>i<cr>f'gf:nohl<cr>

  map <buffer> <leader>x :Errors<cr>
  map <buffer> <leader>gf <Plug>JumpToModule()
  " jump to function definition (outbox only)
  map <buffer> <c-[> viw"fybb<Plug>JumpToModule()/<c-r>f<cr>zt
  map <buffer> <leader>af vaBV
  map <buffer> <leader>B :!b build<cr>
  map <buffer> <leader>.. :!npm test<cr>
  map <buffer> <leader>., :!./node_modules/protractor/bin/protractor protractor.conf.js --specs %<cr>
  map <buffer> <leader>I f)i,<space>
  map <buffer> <leader>== :Esformatter<cr>
  vmap <buffer> == :EsformatterVisual<cr>
  map <buffer> <leader>rj :TernRename<cr>
  " wrap line by console.log()
  map <buffer> <leader>c ^vt;S)iconsole.log<esc>^
  " Unfold an inline : `keyword () { (blob;)* }`
  map <buffer> <leader>J ^f{a<cr><esc>:s/;/;\r/g<cr>v%=:nohl<cr>
  " turn a name: function() definition into a function name()
  map <buffer> <leader>:f ^cxw2wcxwbbx$%/,$<cr>:s///g<cr>
  " turn a function name() into a name: function()
  map <buffer> <leader>:F ^cxewcxe^ea:<esc>f{=a}f{%a,<esc>
  " unwrap something, e.g. |console.log(foo(bar)) => foo(bar)
  nnoremap <silent> <leader>e :call JSFormat()<cr>
  map <leader>uw "_dt("_ds)
endfunction

autocmd BufReadPre,FileReadPre *.es6,*.jsx set filetype=javascript
autocmd BufEnter *.js,*.jsx set completeopt-=preview
autocmd Filetype javascript call SetJavascriptOptions()
