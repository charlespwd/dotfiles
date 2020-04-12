if exists("current_compiler")
  finish
endif
let current_compiler = "run-test"

CompilerSet makeprg=run-test
CompilerSet errorformat=%-G    " remove empty lines
CompilerSet errorformat+=%-G\  " remove lines with space

" Remove React Warnings
CompilerSet errorformat+=%-WWarning:\ Failed\ prop\ type%.%#,
CompilerSet errorformat+=%-C\ \ \ \ in%.%#,
CompilerSet errorformat+=%-WWarning:\ componentDidMount%.%#,
CompilerSet errorformat+=%-WWarning:\ componentWillReceiveProps%.%#,
CompilerSet errorformat+=%-WWarning:\ componentWillMount%.%#,

" Remove any `* \w+` warnings
CompilerSet errorformat+=%-C*\ %.%#,

" Close Please warnings
CompilerSet errorformat+=%-ZPlease%.%#,

" Remove ErrorStart
CompilerSet errorformat+=%-GErrorStart,

" Add stack trace parsing
CompilerSet errorformat+=%I\ \ \ \ at\ %m\ (%f:%l:%c),
CompilerSet errorformat+=%I\ \ \ \ at\ %m\ (<%o>),
CompilerSet errorformat+=%I\ \ \ \ at\ %f:%l:%c,

" Remove PresentationTest Logging
CompilerSet errorformat+=%-G[PRESENTATION-test]%.%#,

" Add error format parsing
CompilerSet errorformat+=%En:\ %n\ Error:\ %o\ file:\ %f\ line:\ %l\ col:\ %c
