" Vim compiler file
" Compiler:     tap (test anything protocol)
" Maintainer:   dane Summers <dsummersl@yahoo.co>
" Splint Home:	http://www.testanything.org/
" Last Change:  2006 Feb 12

if exists("current_compiler")
  finish
endif
let current_compiler = "tap"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=mocha\ --reporter\ tap\ \ %

CompilerSet errorformat=%-G                    " remove empty lines
CompilerSet errorformat+=%-Gok\ %.%#           " remove passed tests
CompilerSet errorformat+=%-G#\ tests%.%#       " remove summary line
CompilerSet errorformat+=%-G#\ pass%.%#        " remove summary line
CompilerSet errorformat+=%-G#\ fail%.%#        " remove summary line

" remove \d+..\d+ line
CompilerSet errorformat+=%-G%*\\d%.%#%*\\d

CompilerSet errorformat+=%+A%[%^(]%#(%f:%l:%c)
CompilerSet errorformat+=%+A\ \ \ \ \ \ at\ %f:%l:%c

CompilerSet errorformat+=%E%>not\ ok\ %n\ %m
" CompilerSet errorformat+=%+C%>\ \ %\\S%.%#
" CompilerSet errorformat+=%Z%[%^(]%#(%f:%l:%c)

" CompilerSet errorformat+=%+C%>#\ \ %\\S%.%#
" CompilerSet errorformat+=%Z#\ \ \ \ \ \at\ %m\ (%f:%l:%c)

let &cpo = s:cpo_save
unlet s:cpo_save
