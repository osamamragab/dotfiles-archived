syn match cOperator "[!~*&%<>^|=+-]"
syn match cOperator "&&\|||\|<<\|>>\|++\|--\|->"
syn match cOperator "\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match cOperator "/[^/*=]"me=e-1

syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cParen,cCppParen
hi def link cUserFunction Function

hi cInclude ctermfg=196 cterm=bold guifg=#f92672 gui=bold
hi cStorageClass ctermfg=197 cterm=bold guifg=#f92672 gui=bold
