if exists("current_compiler")
  finish
endif
let current_compiler = "vitest"

if exists(":CompilerSet") != 2
  command! -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=vitest\ run\ --reporter=dot

" Remove empty lines
CompilerSet errorformat=%-G

" Remove passed tests
CompilerSet errorformat+=%-G\ ✓\ %.%#

" Remove summary lines
CompilerSet errorformat+=%-G⎯⎯⎯⎯⎯⎯⎯\ %.%#

" Remove RUN
CompilerSet errorformat+=%-G\ RUN\ %.%#

" Remove lines with test suite summary
CompilerSet errorformat+=%-G\ %#❯\ %.%#\ (%\\d\ tests%*[\|]\ %\\d\ failed\?)\ %\\dms

" Start of a failed test with the filename and the test description
CompilerSet errorformat+=%E\ FAIL\ %f\ >\ %m

" Error message
CompilerSet errorformat+=%E%>\ Error:\ %m

" File, line, and column where the error occurred
" CompilerSet errorformat+=%E\ ❯\ %*\\s\+\ %f:%l:%c

" End of a multiline error message
" CompilerSet errorformat+=%Z%p^
"
" Continuation of a multiline error message
" CompilerSet errorformat+=%+C\ %#\ %m
