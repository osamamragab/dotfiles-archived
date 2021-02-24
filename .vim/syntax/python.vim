syn match pythonOperator '\V=\|-\|+\|*\|@\|/\|%\|&\||\|^\|~\|<\|>\|!=\|:='

syn match pythonFunctionCall '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\ze\%(\s*(\)'
hi def link pythonFunctionCall Function

hi pythonInclude ctermfg=197 cterm=bold guifg=#f92672 gui=bold
hi pythonException ctermfg=197 cterm=bold guifg=#f92672 gui=bold
