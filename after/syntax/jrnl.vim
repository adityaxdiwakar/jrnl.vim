setlocal syntax=markdown
setlocal textwidth=80
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

syntax match JrnlTagInBoxDone "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxImportant "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxActive "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxEmpty "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxSkipped "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxQuestion "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxInfo "\ @\w\+\(-\w\+\)*"
syntax match JrnlTagInBoxStar "\ @\w\+\(-\w\+\)*"
syntax match JrnlTag "\ @\w\+\(-\w\+\)*"


syntax match jseasoneptitle /s\d\de\d\d/ contains=@NoSpell contained display
syntax match jseasonepbody /s\d\de\d\d/ contains=@NoSpell display
syntax match jNumByNum /\v<\d+x\d+>/ contains=@NoSpell display
syntax match jbracket /\v[\[\]]/ contained conceal display
syntax match JrnlDate /\v\[\d{4}(-\d\d){2} \d\d(:\d\d){1,2}( [aApP][mM])?\] / contained conceal display
syntax match NoSpellUrl '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
syntax match NoSpellApostrophe '\'s' contains=@NoSpell
syntax match jLeadingWhiteSpace /\v^.{-}\] +/ contained

syntax region JrnlBoxDone start=/^\v\z(\s+)*\[[xc]\]\s+/ end=/\v^(\z1\s(\s+- \[ \])@!|$)@!/ contains=JrnlTagInBoxDone
syntax region JrnlBoxEmpty start=/^\v\s*\[ \]\s+/ end=/$/ contains=JrnlTagInBoxEmpty
syntax region JrnlBoxActive start=/^\v\s*\[\.\]\s+/ end=/$/ contains=jLeadingWhiteSpace,JrnlTagInBoxActive
syntax region JrnlBoxQuestion start=/^\v\s*\[\?\]\s+/ end=/$/ contains=JrnlTagInBoxQuestion
syntax region JrnlBoxSkipped start=/^\v\s*\[\-\]\s+/ end=/$/ contains=JrnlTagInBoxSkipped
syntax region JrnlBoxInfo start=/^\v\s*\[i\]\s+/ end=/$/ contains=JrnlTagInBoxInfo
syntax region JrnlBoxImportant start=/\v^\s*\[!\]\s+/ end=/$/ contains=jLeadingWhiteSpace,JrnlTagInBoxImportant
syntax region JrnlBoxStar start=/\v^\s*\[\*\]/ end=/$/ contains=jLeadingWhiteSpace,JrnlTagInBoxStar
syntax region JrnlSpoilers matchgroup=jspoilers start=/||/ end=/||/ concealends contains=@Spell,jseasonepbody

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

highlight JrnlTagInBoxDone cterm=bold,strikethrough ctermfg=8
highlight JrnlTagInBoxEmpty cterm=bold ctermfg=11
highlight JrnlTagInBoxActive cterm=bold,reverse ctermfg=186
highlight JrnlTagInBoxQuestion cterm=bold ctermfg=13
highlight JrnlTagInBoxSkipped cterm=bold ctermfg=9
highlight JrnlTagInBoxInfo cterm=bold ctermfg=14
highlight JrnlTagInBoxImportant cterm=bold,reverse ctermfg=9
highlight JrnlTagInBoxStar cterm=bold,reverse ctermfg=11
highlight JrnlTag ctermfg=11 cterm=bold

highlight def link jlbracket JrnlDate
highlight def link jseasoneptitle JrnlEntryLine
highlight def link jspoilers JrnlSpoilers

" Nopes
highlight def link jseasonepbody JrnlNope
highlight def link jLeadingWhiteSpace JrnlNope
