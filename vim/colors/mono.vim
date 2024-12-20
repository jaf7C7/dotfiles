hi clear
let g:colors_name = 'mono'

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

hi ColorColumn ctermbg=255
hi CursorLine ctermfg=255
hi CursorLineNr cterm=bold
hi IncSearch cterm=reverse,bold,underline
hi MatchParen cterm=bold,underline
hi Pmenu ctermbg=255 cterm=italic
hi PmenuSBar ctermbg=255
hi PmenuThumb ctermbg=254
hi Question cterm=reverse
hi Search cterm=reverse
hi StatusLine cterm=reverse
hi VertSplit ctermfg=0 ctermbg=0
hi Visual cterm=reverse
hi WildMenu cterm=bold,reverse
hi! def link ErrorMsg Question
hi! def link ModeMsg LineNr
hi! def link MoreMsg Question
hi! def link PMenuSel WildMenu
hi! def link SpecialKey WildMenu
hi! def link StatusLineNC StatusLine
hi! def link WarningMsg Question

hi Added ctermfg=2
hi Comment cterm=italic,bold
hi String cterm=italic
hi Error cterm=underline
hi Removed ctermfg=1
hi Todo cterm=bold,reverse
hi! def link Include Statement
