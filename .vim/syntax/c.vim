syn match cOperator "[!~*&%<>^|=+-]"
syn match cOperator "&&\|||\|<<\|>>\|++\|--\|->"
syn match cOperator "\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match cOperator "/[^/*=]"me=e-1

syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cParen,cCppParen
hi def link cUserFunction Function

hi cInclude cterm=bold ctermfg=196 guifg=#f92672 gui=bold
