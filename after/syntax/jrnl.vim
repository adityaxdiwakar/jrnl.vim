setlocal syntax=markdown
setlocal textwidth=80

highlight JrnlTag guifg=#F8CC7A
highlight JrnlEntryLine guifg=#66C9FF guibg=none gui=bold,underline
highlight JrnlDate guifg=#545454 guibg=none
highlight JrnlNope guifg=none guibg=none gui=none
highlight JrnlSpoilers guibg=#000000
highlight JrnlBoxEmpty guifg=#CBE697
highlight JrnlBoxActive guifg=#CBE697 gui=reverse
highlight JrnlBoxDone guifg=#545454 gui=strikethrough
highlight JrnlBoxQuestion guifg=#B283AF
highlight JrnlBoxInfo guifg=#9CDBFC
highlight JrnlBoxImportant guifg=#EA9073 gui=bold,reverse
highlight JrnlBoxStar guifg=#EEC476 gui=bold,reverse


syntax match JrnlTag /@.\{-}\w\+/ display
syntax match jseasoneptitle /s\d\de\d\d/ contains=@NoSpell contained display
syntax match jseasonepbody /s\d\de\d\d/ contains=@NoSpell display
syntax match jNumByNum /\v<\d+x\d+>/ contains=@NoSpell display
syntax match jbracket /\v[\[\]]/ contained conceal display
syntax match JrnlDate /\v\[\d{4}(-\d\d){2} \d\d(:\d\d){1,2}( [aApP][mM])?\] / contained conceal display
syntax match NoSpellUrl '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
syntax match NoSpellApostrophe '\'s' contains=@NoSpell
syntax match jLeadingWhiteSpace /\v^.{-}\] +/ contained

syntax region JrnlEntryLine start='\v^\[\d{4}(-\d\d){2} \d?\d(:[0-6]\d){1,2}( [apAP][mM])?\]' end=/$/ display
  \ contains=JrnlDate,jseasoneptitle,JrnlTag,Spell
syntax region JrnlBoxDone start=/^\v\z(\s+)*- \[[xc]\]\s+/ end=/\v^(\z1\s(\s+- \[ \])@!|$)@!/
syntax region JrnlBoxEmpty start=/^\v\s*- \[ \]\s+/ end=/$/
syntax region JrnlBoxActive start=/^\v\s*- \[\.\]\s+/ end=/$/ contains=jLeadingWhiteSpace
syntax region JrnlBoxQuestion start=/^\v\s*- \[\?\]\s+/ end=/$/
syntax region JrnlBoxInfo start=/^\v\s*- \[i\]\s+/ end=/$/
syntax region JrnlBoxImportant start=/\v^\s*- \[!\]\s+/ end=/$/ contains=jLeadingWhiteSpace
syntax region JrnlBoxStar start=/\v^\s*- \[\*\]/ end=/$/ contains=jLeadingWhiteSpace
syntax region JrnlSpoilers matchgroup=jspoilers start=/||/ end=/||/ concealends contains=@Spell,jseasonepbody

highlight def link jlbracket JrnlDate
highlight def link jseasoneptitle JrnlEntryLine
highlight def link jspoilers JrnlSpoilers

" Nopes
" highlight def link jseasonepbody JrnlNope
highlight def link jLeadingWhiteSpace JrnlNope

" These get overridden by indentLine, so we need matchadd
call matchadd('Conceal', '- \[ \]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[x\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[?\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[!\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[c\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[i\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[\.\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[\*\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '^\s*\zs-\ze [^\[]', 10, -1, { 'conceal': ''})
