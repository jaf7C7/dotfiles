packadd comment           " Comment text with `gc{motion}` or `gcc`.
packadd matchit           " Improve `%` behaviour.
set nohlsearch
set noshowmode
set noincsearch
set colorcolumn=81
set rulerformat=%40(%{&ft}\ \ %{&et==1?'spaces:'.&sw:'tabs:'.&ts}\ \ %{&ff}\ \ %{&fenc}%=%l,%v%)

" Indentation
set autoindent
set tabstop=8
set shiftwidth=4
set expandtab
autocmd FileType sh,go setlocal ts=8 sw=8 noet

" Make Ctrl-Backspace delete previous word.
if &t_kb != ''
    noremap!  
else
    noremap!  
endif

" Mark trailing whitespace as an error when not in insert mode.
3match Error /\s\+$/
autocmd BufWinEnter * 3match Error /\s\+$/
autocmd InsertEnter * 3match Error /\s\+\%#\@<!$/
autocmd InsertLeave * 3match Error /\s\+$/

" Check syntax item under cursor with `gs`
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap gs :call SynStack()<CR>

function! SetTheme()
    set bg=dark
    set t_Co=16
    set notermguicolors

    if !exists('$TERMINAL_THEME')
        let $TERMINAL_THEME = 'vga-light'
    endif

    if $TERMINAL_THEME =~ 'vga'
        hi SpecialKey ctermfg=none ctermbg=none cterm=reverse
        hi Todo ctermfg=0 ctermbg=1 cterm=none

        if $TERMINAL_THEME =~ 'light'
            hi Comment ctermfg=1
            hi String ctermfg=4
            hi ColorColumn ctermfg=none ctermbg=255
        else
            hi Comment ctermfg=2
            hi String ctermfg=12
            hi ColorColumn ctermfg=none ctermbg=234
        endif

        hi clear Statement
        hi clear Identifier
        hi clear Constant
        hi clear Special
        hi clear PreProc
        hi clear Type
        hi Title ctermfg=none cterm=none
        hi Error ctermbg=1 ctermfg=15
        hi Added ctermfg=2

        hi htmlStatement ctermfg=6
        hi htmlSpecialChar ctermfg=3

    elseif $TERMINAL_THEME =~ 'solarized'
        hi Question ctermfg=2
        hi MoreMsg ctermfg=2
        hi ColorColumn ctermbg=10 ctermfg=8 cterm=none
        hi StatusLine ctermfg=10 ctermbg=7 cterm=none
        hi! link StatusLineNC StatusLine
        hi MatchParen ctermfg=1 ctermbg=8 cterm=bold

        hi Statement ctermfg=2
        hi clear Identifier
        hi Function ctermfg=4
        hi Comment ctermfg=8
        hi Constant ctermfg=6
        hi Special ctermfg=4
        hi PreProc ctermfg=4
        hi clear Type ctermfg=3
        hi Todo ctermfg=5 ctermbg=none cterm=bold
        hi Added ctermfg=2
        hi diffLine ctermfg=6
        hi gitcommitFile ctermfg=1

    elseif $TERMINAL_THEME =~ 'gruvbox'
        hi SpecialKey ctermfg=0 ctermbg=7 cterm=bold
        hi ColorColumn ctermbg=10 ctermfg=14 cterm=none
        hi StatusLine ctermfg=0 ctermbg=14 cterm=none
        hi! link StatusLineNC StatusLine
        hi! link VertSplit StatusLine
        hi MatchParen ctermfg=none ctermbg=10 cterm=bold
        hi Question ctermfg=15
        hi MoreMsg ctermfg=15
        hi PMenuSel ctermfg=0 ctermbg=5
        hi PMenu ctermfg=7 ctermbg=10

        hi Statement ctermfg=1
        hi Identifier ctermfg=6 cterm=none
        hi Comment ctermfg=12
        hi Constant ctermfg=2
        hi Number ctermfg=5
        hi Special ctermfg=3
        hi PreProc ctermfg=6
        hi Type ctermfg=5
        hi Todo ctermfg=7 ctermbg=0 cterm=bold
        hi Error ctermfg=7 ctermbg=1
        hi Boolean ctermfg=8
        hi! link Operator None

        hi! pythonInclude ctermfg=4
        hi! pythonBuiltin ctermfg=6
        hi! javaScriptIdentifier ctermfg=9
        hi! link javaScriptBraces None
        hi! link javaScriptOperator Statement
        hi! htmlH1 ctermfg=2 cterm=bold
        hi! htmlTagName ctermfg=6 cterm=bold
        hi! link cssClassName cssTagName
        hi! link cssClassNameDot cssClassName
        hi! link cssIdentifier cssTagName
        hi! link htmlSpecialTagName htmlTagName
        hi! link shOption None
        hi! link Delimiter None
        hi! link vimHiCtermFgBg None
        hi! link vimHiCterm None
    endif
endfunc

autocmd VimEnter * call SetTheme()
autocmd ColorScheme default call SetTheme()
