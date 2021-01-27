syn match pythonOperator '\V=\|-\|+\|*\|@\|/\|%\|&\||\|^\|~\|<\|>\|!=\|:='

syn match pythonFunctionCall '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\ze\%(\s*(\)'
hi def link pythonFunctionCall Function
