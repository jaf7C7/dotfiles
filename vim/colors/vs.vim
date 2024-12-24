hi clear
let g:colors_name = 'vs'

if &t_Co >= 16
  set termguicolors
endif

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

hi ColorColumn ctermbg=255 guibg=#f0f0f0
hi CursorLine ctermbg=255 guibg=#f0f0f0
hi CursorLineNr ctermfg=3 cterm=bold gui=bold
hi ErrorMsg ctermfg=1 cterm=bold gui=bold
hi IncSearch cterm=bold ctermfg=15 ctermbg=12 gui=bold
hi LineNr ctermfg=6
hi MatchParen ctermfg=1 ctermbg=255 cterm=bold guibg=#f0f0f0 gui=bold
hi Pmenu ctermbg=255 guibg=#f0f0f0
hi PmenuSBar ctermbg=255 guibg=#f0f0f0
hi PmenuThumb ctermbg=254
hi Question cterm=bold ctermfg=2 gui=bold
hi Search ctermfg=15 ctermbg=12
hi StatusLine ctermbg=255 guibg=#f0f0f0
hi VertSplit ctermbg=255 ctermfg=255 guibg=#f0f0f0
hi Visual ctermfg=2 cterm=reverse
hi WarningMsg cterm=bold ctermfg=3 gui=bold
hi WildMenu ctermbg=254 cterm=bold ctermfg=1 gui=bold
hi! def link ModeMsg LineNr
hi! def link MoreMsg Question
hi! def link PMenuSel WildMenu
hi! def link QuickFixLine WildMenu
hi! def link SpecialKey WildMenu
hi! def link StatusLineNC StatusLine

hi Added ctermfg=2
hi Comment ctermfg=2 guifg=#008000
hi Constant ctermfg=1 guifg=#AA0000
hi Error ctermbg=255 ctermfg=1 guifg=#AA0000 guibg=#f0f0f0
hi Removed ctermfg=1
hi Statement ctermfg=4 guifg=#0000FF
hi Todo cterm=bold ctermfg=9 guifg=#FF5555 gui=bold
hi! def link Include Statement

hi! def link javaScriptIdentifier Statement

hi helpOption cterm=bold gui=bold
hi! def link helpExample Statement
hi! def link helpHyperTextJump Statement
hi! def link helpExample Constant
hi! def link helpHyperTextEntry Comment

hi diffFile cterm=bold gui=bold
hi diffOldFile cterm=bold gui=bold
hi diffNewFile cterm=bold gui=bold
hi diffLine ctermfg=6
hi diffIndexLine cterm=bold
