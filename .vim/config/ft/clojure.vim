" CLOJURE OPTIONS
" This should enable Emacs like indentation
let g:clojure_fuzzy_indent=1
let g:clojure_align_multiline_strings = 1
" Add some words which should be indented like defn etc: Compojure/compojure-api, midje and schema stuff mostly.
let g:clojure_fuzzy_indent_patterns=['^GET', '^POST', '^PUT', '^DELETE', '^ANY', '^HEAD', '^PATCH', '^OPTIONS', '^def', '^apply', '^add-watch', '^context']
let g:niji_light_colors =  [['brown', 'RoyalBlue3'],
                          \ ['Darkblue', 'SeaGreen3'],
                          \ ['darkgray', 'DarkOrchid3'],
                          \ ['darkgreen', 'firebrick3'],
                          \ ['darkcyan', 'RoyalBlue3']]
let g:paredit_electric_return=1
let g:paredit_smartjump=1
let g:paredit_leader = '<Space>'
autocmd Filetype clojure call SetClojureOptions()
function! SetClojureOptions()
  setlocal textwidth=70
  let b:AutoPairs={'"':'"'}
  " repl mappings
  imap <buffer> <c-\> <esc>cpp
  nnoremap <buffer> w w
  map <Plug>LintEastwood :vnew<bar>0read !lein eastwood<cr><cr>:g/\v(\=\= Lin)<bar>(Subprocess failed)<bar>(\=\= Eastwood)<bar>(Entering directory)<bar>(Directories scanned)/d<cr>
  map <Plug>Pprint va)S)aclojure.pprint/pprint <esc>
  map <buffer> <leader>pr <Plug>Pprint
  map <buffer> <leader>lint <Plug>LintEastwood
  map <buffer> <c-\> cpp
  map <buffer> cpR :RunAllTests<cr>
  map <buffer> <c-]> :Eval<cr>
  map <buffer> <c-[> ]<C-D>
  map <buffer> \r :Require!<cr>
  noremap <buffer> <c-c> <esc>
  command! Piggie :Piggieback (cemerick.austin/exec-env)
  command! Biggie :Piggieback (cemerick.austin/exec-env :exec-cmds ["open" "-ga" "/Applications/Google Chrome.app"])
  command! Wiggie :Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001)
endfunction


