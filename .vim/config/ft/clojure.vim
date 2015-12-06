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
autocmd filetype clojure call SetClojureCommonOptions()
function! SetClojureCommonOptions()
  setlocal textwidth=80
  let b:AutoPairs={'"':'"','[':']','{':'}','(':')'}
  nnoremap <buffer> w w
  noremap <buffer> <c-c> <esc>

  let b:surround_{char2nr('p')} = "(clojure.pprint/pprint \r)"

  " jump to definition
  map <buffer> <c-[> ]<C-D>
  " evaluate around code
  map <buffer> <c-]> :Eval<cr>
  " evaluate inner form
  map <buffer> <c-\> cpp
endfunction

autocmd BufRead,BufNewFile *.clj call SetClojureOptions()
function! SetClojureOptions()
  map <Plug>LintEastwood :vnew<bar>0read !lein eastwood<cr><cr>:g/\v(\=\= Lin)<bar>(Subprocess failed)<bar>(\=\= Eastwood)<bar>(Entering directory)<bar>(Directories scanned)/d<cr>
  map <Plug>Pprint va)S)aclojure.pprint/pprint <esc>

  map <buffer> <leader>pr <Plug>Pprint
  map <buffer> <leader>lint <Plug>LintEastwood

  map <buffer> cpR :RunAllTests<cr>
  map <buffer> \r :Require!<cr>
  map <buffer> <leader>up cqp(use 'clojure.pprint)<cr>
  map <buffer> <leader>ee cqp(do (in-ns 'user) (go))<cr>
  map <buffer> <leader>rr cqp(do (in-ns 'user) (reset))<cr>

  " Select current paragraph and send it to tmux
  nmap <leader>vs vaF<Plug>SendToTmux

  noremap <buffer> <leader>sh :Slamhound<CR>
  command! Piggie :Piggieback (cemerick.austin/exec-env)
  command! Biggie :Piggieback (cemerick.austin/exec-env :exec-cmds ["open" "-ga" "/Applications/Google Chrome.app"])
  command! Wiggie :Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001)
endfunction

autocmd BufRead,BufNewFile *.cljs call SetClojureScriptOptions()
function! SetClojureScriptOptions()
  map <Plug>ConnectToFigwheel :Connect nrepl://localhost:7002<cr><cr>
  map <Plug>PiggiebackFigwheel
        \ :Piggieback (do (require '[figwheel-sidecar.repl-api :as fw]) (fw/cljs-repl))<cr>
  map <leader>C <Plug>ConnectToFigwheel<Plug>PiggiebackFigwheel
endfunction
