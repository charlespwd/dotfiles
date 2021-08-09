" $XDG_CONFIG_HOME/nvim/compiler/dev-test.vim
if exists("current_compiler")
  finish
endif
let current_compiler = "dev-test"

CompilerSet makeprg=dev-test
CompilerSet errorformat=%-G    " remove empty lines
CompilerSet errorformat+=%-G\  " remove lines with space

" Started with run options --no-color --seed 28466
" Run options: --seed 33297
CompilerSet errorformat+=%-W%.%#run\ options%.%#
" # Running:
CompilerSet errorformat+=%-W#\ Running:
" warning: setting Encoding.default_external
CompilerSet errorformat+=%-G%.%#warning:\ setting\ Encoding%.%#

" Running via Spring preloader in process 76016
" running spring after_fork
CompilerSet errorformat+=%-GRunning%.%#spring%.%#

" * Loading test environment
" * Waiting for ElasticSearch to be ready
CompilerSet errorformat+=%-G*\ %.%#

" Loading fixtures... completed in 0.558s
CompilerSet errorformat+=%-G%.%#Loading\ fixtures%.%#
" Finished in 0.085106s, 2138.5096 runs/s, 3160.7642 assertions/s.
CompilerSet errorformat+=%-G%.%#Finished\ in\ %.%#
" 182 runs, 269 assertions, 6 failures, 1 errors, 0 skips
CompilerSet errorformat+=%-G%.%#\ runs%.%#assertions%.%#

" ...F.......FFE.F
CompilerSet errorformat+=%-G%[EF.]%#

" rake aborted!
" CompilerSet errorformat+=%Arake\ aborted!
" " Command failed with status (1)
" CompilerSet errorformat+=%CCommand\ failed\ with\ status%.%#
" " /Users/charles/src/github.com/Shopify/theme-check/Rakefile:26:in `block (2 levels) in <top (required)>'
" " /Users/charles/.gem/ruby/2.7.1/gems/bundler-2.1.4/lib/bundler/cli/exec.rb:63:in `load'
" CompilerSet errorformat+=%+C%f:%l:%.%#
" " Tasks: TOP => test => tests:all => tests:file_system
" CompilerSet errorformat+=%+CTasks:%.%#
" " (See full trace by running task with --trace)
" CompilerSet errorformat+=%Z(See\ full\ trace%.%#

"   1) Failure:
CompilerSet errorformat+=%E\ \ %n)\ Failure:
"   1) Error:
CompilerSet errorformat+=%E\ \ %n)\ Error:
" ThemeTest#test_ignore [./theme-check/test/theme_test.rb:90]:
CompilerSet errorformat+=%Z%m\ [%f:%l]:
"    /Users/charles/src/github.com/Shopify/theme-check/test/config_test.rb:180:in `test_custom_check'
CompilerSet errorformat+=%Z\ \ \ \ %f:%l:%.%#
" /Users/charles/src/github.com/Shopify/theme-check/test/template_test.rb:12: warning: assigned but unused variable - theme
CompilerSet errorformat+=%f:%l:\ %m
" ConfigTest#test_custom_check:
CompilerSet errorformat+=%+C%.%#:
" NameError: uninitialized constant ThemeCheck::CustomCheck
CompilerSet errorformat+=%+C%.%#:%.%#
" /Users/charles/.gem/ruby/2.7.1/bin/bundle:23:in `<main>'
CompilerSet errorformat+=%f:%l:in\ %m
