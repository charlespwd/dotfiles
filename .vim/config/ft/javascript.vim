" JAVASCRIPT OPTIONS
let g:javascript_conceal_function   = "λ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

function! JSFormat()
  " Preparation: save last search, and cursor position.
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')
  let fileWorkingDirectory = expand('%:p:h')
  let currentWorkingDirectory = getcwd()
  execute ':lcd' . fileWorkingDirectory
  execute ':silent' . '%!esformatter'
  if v:shell_error
    undo
    "echo "esformatter error, using builtin vim formatter"
    " use internal formatting command
    execute ":silent normal! gg=G<cr>"
  endif
  " Clean up: restore previous search history, and cursor position
  execute ':lcd' . currentWorkingDirectory
  call winrestview(l:win_view)
  call setreg('/', l:last_search)
endfunction

function! SetJavascriptOptions()
  set conceallevel=2
  let g:syntastic_javascript_checkers = ['jscs', 'jshint']
  map <buffer> <leader>rj :TernRename<cr>
  " wrap line by console.log()
  map <buffer> <leader>c ^vt;S)iconsole.log<esc>^
  " unwrap console.log
  map <buffer> <leader>C ^"_dt("_ds)
  " Unfold an inline : `keyword () { (blob;)* }`
  map <buffer> <leader>J ^f{a<cr><esc>:s/;/;\r/g<cr>v%=:nohl<cr>
  " turn a name: function() definition into a function name()
  map <buffer> <leader>:f ^cxw2wcxwbbx$%/,$<cr>:s///g<cr>
  " turn a function name() into a name: function()
  map <buffer> <leader>f: ^cxewcxe^ea:<esc>f{=a}f{%a,<esc>
  " unwrap something, e.g. |console.log(foo(bar)) => foo(bar)
  nnoremap <silent> <leader>e :call JSFormat()<cr>
  map <leader>uw "_dt("_ds)
  let g:surround_{char2nr('c')} = "console.log(\r)"
endfunction

autocmd BufReadPre,FileReadPre *.es6 set filetype=javascript
autocmd Filetype javascript call SetJavascriptOptions()
