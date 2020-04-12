hi link qfFileName Directory
hi link qfLineNr LineNr
hi link qfError SpellBad
hi link qfInfoFile GruvboxBlueBold
hi link qfInfoLineNr LineNr
hi link qfInfo GruvboxBlue
hi link qfLog GruvboxGray
hi link qfDiffExpected GruvboxRed
hi link qfDiffActual GruvboxGreen

" Default syntax
syntax match qfFileName /^[^|]*/ nextgroup=qfSeparator
syntax match qfSeparator /|/ contained nextgroup=qfLineNr
syntax match qfLineNr /[^|]*/ contained contains=qfError
syntax match qfError /error/ contained

" Info highlighting (stack traces)
syntax match qfInfoLine /.*\<info\>|/ contains=qfInfoFile
syntax match qfInfoFile /^anonymous/
syntax match qfInfoFile /^[^|]*/ contained nextgroup=qfInfoSeparator
syntax match qfInfoSeparator /|/ contained nextgroup=qfInfoLineNr
syntax match qfInfoLineNr /[^|]*/ contained contains=qfInfo
syntax match qfInfo /info/ contained

" Unnamed lines formatting (log lines + diff)
syntax match qfLogLine /^||.*/ contains=qfLogSeparator
syntax match qfLogSeparator /^||/ contained nextgroup=qfLog
syntax match qfLog /.*/ contained contains=qfDiffExpected,qfDiffActual
syntax match qfDiffExpected /\v \+.*$/ contains=qfDiffActual
syntax match qfDiffActual /\v \-.*$/
