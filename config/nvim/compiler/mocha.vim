if exists("current_compiler")
  finish
endif
let current_compiler = "mocha"

if exists(":CompilerSet") != 2
  command! -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=mocha\ --reporter=dot

CompilerSet errorformat=%-G                    " remove empty lines
CompilerSet errorformat+=%-Gok\ %.%#           " remove passed tests
CompilerSet errorformat+=%-G#\ tests%.%#       " remove summary line
CompilerSet errorformat+=%-G#\ pass%.%#        " remove summary line
CompilerSet errorformat+=%-G#\ fail%.%#        " remove summary line

" remove \d+..\d+ line
CompilerSet errorformat+=%-G%*\\d%.%#%*\\d

" remove ...!... lines
CompilerSet errorformat+=%-G%*[\ ]%*[\!.]

CompilerSet errorformat+=%+A%[%^(]%#(%f:%l:%c)
CompilerSet errorformat+=%+A\ \ \ \ \ \ at\ %f:%l:%c

CompilerSet errorformat+=%E%>not\ ok\ %n\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
