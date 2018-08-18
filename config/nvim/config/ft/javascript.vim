" JAVASCRIPT OPTIONS
let g:javascript_conceal_function   = "λ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
let g:angular_skip_alternate_mappings = 1
" let g:neomake_javascript_eslint_d_maker = {
"       \ 'exe': 'eslint',
"       \ 'args': ['--quiet', '-f', 'compact', '--no-ignore'],
"       \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
"       \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#'
"       \ }
" let g:neomake_javascript_enabled_makers = ['eslint_d']

let g:tsuquyomi_completion_detail=1
let g:tsuquyomi_completion_preview=1
let g:tsuquyomi_definition_split=2
let g:tsuquyomi_disable_default_mappings=0
let g:tsuquyomi_disable_quickfix=1
let g:tsuquyomi_save_onrename=1
let g:tsuquyomi_single_quote_import=1
let g:nvim_typescript#type_info_on_hold=0
let g:nvim_typescript#signature_complete=0
let g:nvim_typescript#default_mappings=0

function! SetTypescriptOptions()
  call SetJavascriptOptions()
  let b:ale_lint_on_enter = 1
  let b:ale_lint_on_save = 1
  let b:ale_lint_on_insert_leave = 0
  " set ft=typescript.jsx
  map <buffer> <leader>,, :copen<cr>
  " set omnifunc=''

  "" nvim-ts bindings
  " nmap <buffer> K :TSType<cr>
  " map <buffer> <c-]> :TSDef<cr>
  " map <buffer> <c-t> :TSTypeDef<cr>
  " map <buffer> <c-w><c-]> :vs<cr>:TSDef<cr>
  " map <buffer> <c-w><c-t> :vs<cr>:TSTypeDef<cr>
  " map <buffer> <leader>rj :TSRename<cr>
  " map <buffer> <leader>rf :TSRename<cr>
  map <buffer> <leader>I :TSImport<cr>
  map <buffer> <c-]> :TsuDefinition<cr>

  "" tsuquyomi bindings
  " type hint
  nmap <buffer> K :<C-u>echo tsuquyomi#hint()<CR>:<C-u>echo tsuquyomi#hint()<CR>
  map <buffer> <leader>rj :TsuRenameSymbol<cr>
  map <buffer> <leader>rf :TsuRenameSymbol<cr>
endfunction

function! SetJavascriptOptions()
  setlocal textwidth=75
  let b:surround_{char2nr('c')} = "console.log(\r)"
  let b:surround_{char2nr('e')} = "expect(\r)"
  let b:surround_{char2nr('a')} = "const PLACEHOLDER = () => {\n\r\n};"
  let b:surround_{char2nr('F')} = "(function() {\n\r\n})();"
  let b:surround_{char2nr('f')} = "function PLACEHOLDER() {\n\r\n}"
  let b:surround_{char2nr('i')} = "it('', function() {\n\r\n});"
  let b:surround_{char2nr('I')} = "if (true) {\n\r\n}"
  let b:surround_{char2nr('n')} = "{{/*\n\r\n*/}}"
  let b:surround_{char2nr('D')} = "describe('', function() {\n\r\n});"
  let b:surround_{char2nr('d')} = "describe('', () => {\n\r\n})"
  let b:match_words = "(:),\[:\],{:},<:>,<\@<=\\([^/][^ \t>]*\\)[^>]*\\%(/\@<!>\\|$\\):<\@<=/\1>,':'"
  set conceallevel=0

  map <buffer> <leader>gf <Plug>JumpToModule()
  " jump to function definition (outbox only)
  map <buffer> K viw"fybb<Plug>JumpToModule()/<c-r>f<cr>zt
  map <buffer> <leader>af vaBV
  map <buffer> <leader>B :!b build<cr>
  " map <buffer> <leader>., :!./node_modules/protractor/bin/protractor protractor.conf.js --specs %<cr>
  " map <buffer> <leader>.. :Dispatch<cr>
  map <buffer> <leader>I f)i,<space>
  map <buffer> <leader>== :Esformatter<cr>
  map <buffer> <leader>lint :NeomakeSh npm run precommit<cr>:copen<cr>
  " open/close object, open means on multiple lines, close means one line
  map <buffer> <leader>{ ^f{f}bea,<esc>:s/,/,\r/g<cr>%a<cr><esc>=a}:nohl<cr>
  map <buffer> <leader>} ]}k$xva}J
" turn function into an arrow function
  map <buffer> <leader>ta :s/function/const<cr>f(i = <esc>f(%a =><esc>
  map <buffer> <leader>tf :s/const/function<cr>:s/ = (/(<cr>:s/=> //<cr>
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
  " turn an import statement into a proxyquire mock
  map <buffer> <PLUG>Mock() ^dt'f;i: {},<del><esc>
  map <buffer> <leader>mock <PLUG>Mock()==
  map <buffer> <leader>Mock <PLUG>Mock()F'b"iyef{cf}<c-r>i<esc>==
  " turn a require statement into an import statement
  map <buffer> <leader>imp cwimport<esc>f=dt(ifrom <esc>f(ds)
  " turn an import statement into a require statement
  map <buffer> <leader>req cwconst<esc>wWcw=<esc>f'irequire(<esc>lxf;i)<esc>
  " unwrap something, e.g. |console.log(foo(bar)) => foo(bar)
  nnoremap <silent> <leader>e :call JSFormat()<cr>
  map <leader>uw "_dt("_ds)
endfunction

" Set js options for all js files
" autocmd BufReadPre,FileReadPre *.es6,*.jsx set filetype=javascript
autocmd BufReadPre,FileReadPre *.tsx set filetype=typescript
autocmd BufReadPre,FileReadPre,BufEnter *.js.liquid set filetype=javascript.jsx.liquid
autocmd Filetype javascript call SetJavascriptOptions()
autocmd Filetype typescript call SetTypescriptOptions()

" run lint on save
" autocmd BufRead,BufWrite *.js,*.jsx Neomake eslint
" autocmd BufRead,BufWrite *.ts,*.tsx Neomake
" autocmd BufRead,BufWrite *.ts TsuGeterr

" disable the annoying vim-node doc preview
autocmd BufEnter *.js,*.jsx setlocal completeopt-=preview

autocmd User Node
  \ if &filetype == "javascript.jsx" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif
