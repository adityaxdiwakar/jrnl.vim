setlocal syntax=markdown
setlocal textwidth=80
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

syntax match JrnlTag "\ @\w\+\(-\w\+\)*" containedin=ALL
syntax match jseasoneptitle /s\d\de\d\d/ contains=@NoSpell contained display
syntax match jseasonepbody /s\d\de\d\d/ contains=@NoSpell display
syntax match jNumByNum /\v<\d+x\d+>/ contains=@NoSpell display
syntax match jbracket /\v[\[\]]/ contained conceal display
syntax match JrnlDate /\v\[\d{4}(-\d\d){2} \d\d(:\d\d){1,2}( [aApP][mM])?\] / contained conceal display
syntax match NoSpellUrl '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
syntax match NoSpellApostrophe '\'s' contains=@NoSpell
syntax match jLeadingWhiteSpace /\v^.{-}\] +/ contained

syntax region JrnlBoxDone start=/^\v\z(\s+)*\[[xc]\]\s+/ end=/\v^(\z1\s(\s+- \[ \])@!|$)@!/
syntax region JrnlBoxEmpty start=/^\v\s*\[ \]\s+/ end=/$/
syntax region JrnlBoxActive start=/^\v\s*\[\.\]\s+/ end=/$/ contains=jLeadingWhiteSpace
syntax region JrnlBoxQuestion start=/^\v\s*\[\?\]\s+/ end=/$/
syntax region JrnlBoxSkipped start=/^\v\s*\[\-\]\s+/ end=/$/
syntax region JrnlBoxInfo start=/^\v\s*\[i\]\s+/ end=/$/
syntax region JrnlBoxImportant start=/\v^\s*\[!\]\s+/ end=/$/ contains=jLeadingWhiteSpace
syntax region JrnlBoxStar start=/\v^\s*\[\*\]/ end=/$/ contains=jLeadingWhiteSpace
syntax region JrnlSpoilers matchgroup=jspoilers start=/||/ end=/||/ concealends contains=@Spell,jseasonepbody

"highlight JrnlTag guifg=#F8CC7A
highlight JrnlTag ctermfg=11, cterm=bold
highlight JrnlEntryLine ctermfg=14 ctermbg=NONE cterm=bold,underline
highlight JrnlDate ctermfg=8 ctermbg=NONE
highlight JrnlNope ctermfg=NONE ctermbg=NONE cterm=NONE
highlight JrnlSpoilers ctermbg=0
highlight JrnlBoxEmpty ctermfg=11
highlight JrnlBoxActive ctermfg=186 cterm=reverse 
highlight JrnlBoxDone ctermfg=8 cterm=strikethrough
highlight JrnlBoxQuestion ctermfg=13 
highlight JrnlBoxInfo ctermfg=14
highlight JrnlBoxSkipped ctermfg=9
highlight JrnlBoxImportant ctermfg=9 cterm=bold,reverse
highlight JrnlBoxStar ctermfg=11 cterm=bold,reverse


highlight def link jlbracket JrnlDate
highlight def link jseasoneptitle JrnlEntryLine
highlight def link jspoilers JrnlSpoilers

" Nopes
highlight def link jseasonepbody JrnlNope
highlight def link jLeadingWhiteSpace JrnlNope
