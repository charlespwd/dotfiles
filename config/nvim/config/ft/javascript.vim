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

function! SetTypescriptOptions()
  call SetJavascriptOptions()
  let b:ale_lint_on_enter = 1
  let b:ale_lint_on_save = 1
  let b:ale_lint_on_insert_leave = 0
  " set ft=typescript.jsx
  map <buffer> <leader>,, :copen<cr>
endfunction

function! SetJavascriptOptions()
  setlocal textwidth=75
  let b:surround_{char2nr('c')} = "console.log(\r)"
  let b:surround_{char2nr('e')} = "expect(\r)"
  let b:surround_{char2nr('a')} = "const PLACEHOLDER = () => {\n\r\n};"
  let b:surround_{char2nr('F')} = "(function() {\n\r\n})();"
  let b:surround_{char2nr('f')} = "function PLACEHOLDER() {\n\r\n}"
  let b:surround_{char2nr('i')} = "it('', () => {\n\r\n});"
  let b:surround_{char2nr('I')} = "if (true) {\n\r\n}"
  let b:surround_{char2nr('n')} = "{{/*\n\r\n*/}}"
  let b:surround_{char2nr('D')} = "describe('', () => {\n\r\n});"
  let b:surround_{char2nr('d')} = "describe('', () => {\n\r\n});"
  let b:match_words = "(:),\[:\],{:},<:>,<\@<=\\([^/][^ \t>]*\\)[^>]*\\%(/\@<!>\\|$\\):<\@<=/\1>,':'"

  set conceallevel=0

  " map <buffer> <leader>gf <Plug>JumpToModule()
  " jump to function definition (outbox only)
  map <buffer> <leader>af vaBV
  map <buffer> <leader>B :!b build<cr>
  " map <buffer> <leader>., :!./node_modules/protractor/bin/protractor protractor.conf.js --specs %<cr>
  " map <buffer> <leader>.. :Dispatch<cr>
  " Unfold an inline : `keyword () { (blob;)* }`
  map <buffer> <leader>J ^f{a<cr><esc>:s/;/;\r/g<cr>v%=:nohl<cr>
  " turn a name: function() definition into a function name()
  map <buffer> <leader>:f ^cxw2wcxwbbx$%/,$<cr>:s///g<cr>
  " turn a function name() into a name: function()
  map <buffer> <leader>:F ^cxewcxe^ea:<esc>f{=a}f{%a,<esc>
  " turn a require statement into an import statement
  map <buffer> <leader>imp cwimport<esc>f=dt(ifrom <esc>f(ds)
  " turn an import statement into a require statement
  map <buffer> <leader>req cwconst<esc>wWcw=<esc>f'irequire(<esc>lxf;i)<esc>
  map <buffer> <leader>I <Plug>ShoeboxImportFn()

  " ALE lsp
  map <buffer> K <plug>(ale_hover)
  map <buffer> <c-]> <plug>(ale_go_to_definition)
  map <buffer> <c-}> <plug>(ale_go_to_definition_in_vsplit)
  map <buffer> <c-t> <plug>(ale_go_to_type_definition)
endfunction

" Set js options for all js files
" autocmd BufReadPre,FileReadPre *.es6,*.jsx set filetype=javascript
augroup jslike
  autocmd!
  autocmd BufReadPre,FileReadPre *.tsx set filetype=typescript
  autocmd BufReadPre,FileReadPre,BufEnter *.js.liquid set filetype=javascript.jsx.liquid
  autocmd Filetype javascript call SetJavascriptOptions()
  autocmd Filetype typescript,typescriptreact call SetTypescriptOptions()
  autocmd FileType javascript setlocal formatprg=prettier\ --parser\ babel

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
augroup END
