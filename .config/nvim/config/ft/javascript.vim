" JAVASCRIPT OPTIONS
let g:javascript_conceal_function   = "λ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
let g:angular_skip_alternate_mappings = 1
" let g:neomake_javascript_fastlint_maker = {
"       \ 'exe': 'eslint_d',
"       \ 'args': ['--quiet', '-f', 'compact'],
"       \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
"       \ '%W%f: line %l\, col %c\, Warning - %m'
"       \ }
let g:neomake_javascript_enabled_markers = ['eslint']
let g:do_lint_js=1
" let g:neomake_typescript_tsc_maker = {
"       \ 'args': ['-m', 'commonjs', '--target', 'es5', '--strictNullChecks', '--noEmit'],
"       \ 'errorformat':
"           \ '%E%f %#(%l\,%c): error %m,' .
"           \ '%E%f %#(%l\,%c): %m,' .
"           \ '%Eerror %m,' .
"           \ '%C%\s%\+%m'
"       \ }

function! SetTypescriptOptions()
  map <buffer> <leader>rj :TsuRenameSymbol<cr>
  map <buffer> <leader>rf :TsuRenameSymbol<cr>
endfunction

function! SetJavascriptOptions()
  setlocal textwidth=80
  let b:surround_{char2nr('p')} = "(\n\t\r\n)"
  let b:surround_{char2nr('P')} = "{\n\t\r\n}"
  let b:surround_{char2nr('S')} = "[\n\t\r\n]"
  let b:surround_{char2nr('c')} = "console.log(\r)"
  let b:surround_{char2nr('a')} = "const PLACEHOLDER = () => {\n\r\n};"
  let b:surround_{char2nr('F')} = "(function() {\n\r\n})();"
  let b:surround_{char2nr('f')} = "function PLACEHOLDER() {\n\r\n}"
  let b:surround_{char2nr('i')} = "it('', function() {\n\r\n});"
  let b:surround_{char2nr('I')} = "if (true) {\n\r\n}"
  let b:surround_{char2nr('n')} = "{{/*\n\r\n*/}}"
  let b:surround_{char2nr('D')} = "describe('', function() {\n\r\n});"
  let b:surround_{char2nr('d')} = "describe('', () => {\n\r\n})"
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
  map <buffer> <leader>mock ^dt'f;i: {},<esc>lD==
  " turn a require statement into an import statement
  map <buffer> <leader>imp cwimport<esc>f=dt(ifrom <esc>f(ds)
  " turn an import statement into a require statement
  map <buffer> <leader>req cwconst<esc>wWcw=<esc>f'irequire(<esc>lxf;i)<esc>
  " unwrap something, e.g. |console.log(foo(bar)) => foo(bar)
  nnoremap <silent> <leader>e :call JSFormat()<cr>
  map <leader>uw "_dt("_ds)
endfunction
" Set js options for all js files
autocmd BufReadPre,FileReadPre *.es6,*.jsx set filetype=javascript
autocmd Filetype javascript call SetJavascriptOptions()
autocmd Filetype typescript call SetTypescriptOptions()

" run lint on save
autocmd BufRead,BufWrite *.js,*.jsx if exists('g:do_lint_js') && g:do_lint_js | Neomake eslint | endif
" autocmd BufRead,BufWrite *.ts if exists('g:do_lint_js') && g:do_lint_js | Neomake | endif

" disable the annoying vim-node doc preview
autocmd BufEnter *.js,*.jsx set completeopt-=preview
