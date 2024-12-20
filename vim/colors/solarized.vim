hi clear
let g:colors_name = 'solarized'

hi clear SpecialKey
hi clear EndOfBuffer
hi clear NonText
hi clear Directory
hi clear ErrorMsg
hi clear IncSearch
hi clear Search
hi clear CurSearch
hi clear MoreMsg
hi clear ModeMsg
hi clear LineNr
hi clear LineNrAbove
hi clear LineNrBelow
hi clear CursorLineNr
hi clear CursorLineSign
hi clear CursorLineFold
hi clear Question
hi clear StatusLine
hi clear StatusLineNC
hi clear VertSplit
hi clear Title
hi clear Visual
hi clear VisualNOS
hi clear WarningMsg
hi clear WildMenu
hi clear Folded
hi clear FoldColumn
hi clear DiffAdd
hi clear DiffChange
hi clear DiffDelete
hi clear DiffText
hi clear SignColumn
hi clear Conceal
hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal
hi clear Pmenu
hi clear PmenuSel
hi clear PmenuMatch
hi clear PmenuMatchSel
hi clear PmenuKind
hi clear PmenuKindSel
hi clear PmenuExtra
hi clear PmenuExtraSel
hi clear PmenuSbar
hi clear PmenuThumb
hi clear TabLine
hi clear TabLineSel
hi clear TabLineFill
hi clear CursorColumn
hi clear CursorLine
hi clear ColorColumn
hi clear QuickFixLine
hi clear StatusLineTerm
hi clear StatusLineTermNC
hi clear MsgArea
hi clear Normal
hi clear MatchParen
hi clear ToolbarLine
hi clear ToolbarButton
hi clear Comment
hi clear Constant
hi clear Special
hi clear Identifier
hi clear Statement
hi clear PreProc
hi clear Type
hi clear Underlined
hi clear Ignore
hi clear Added
hi clear Changed
hi clear Removed
hi clear Error
hi clear Todo

hi ColorColumn ctermbg=10
hi CursorLine ctermfg=10
hi CursorLineNr ctermfg=13 ctermbg=10 cterm=bold
hi ErrorMsg ctermfg=1 cterm=bold
hi IncSearch ctermfg=10 ctermbg=15
hi LineNr ctermfg=6 ctermbg=10
hi MatchParen ctermbg=10 ctermfg=5 cterm=bold
hi Pmenu ctermbg=10 ctermfg=11
hi PmenuSBar ctermbg=10
hi PmenuThumb ctermbg=110
hi Question cterm=bold ctermfg=2
hi Search ctermfg=10 ctermbg=14
hi StatusLine ctermbg=10
hi VertSplit ctermbg=10 ctermfg=10
hi Visual ctermfg=9 cterm=reverse
hi WarningMsg cterm=bold ctermfg=3
hi WildMenu ctermbg=10 ctermfg=6 cterm=bold
hi! def link ModeMsg LineNr
hi! def link MoreMsg Question
hi! def link PMenuSel WildMenu
hi! def link QuickFixLine WildMenu
hi! def link SpecialKey WildMenu
hi! def link StatusLineNC StatusLine

hi Added ctermfg=2 ctermbg=10
hi Comment cterm=italic ctermfg=9
hi Constant ctermfg=3
hi String ctermfg=2
hi Error ctermbg=10 ctermfg=1
hi Removed ctermfg=1 ctermbg=10
hi Statement ctermfg=4
hi Todo cterm=bold,reverse ctermfg=1
hi! def link Include Statement

hi! def link javaScriptIdentifier Statement
