filetype plugin indent on " See :help 'indent.txt'
packadd comment           " Comment text with `gc{motion}` or `gcc`.
packadd matchit           " Improve `%` behaviour.
set nohlsearch
set noshowmode
set noincsearch
set colorcolumn=80

" Make Ctrl-Backspace delete previous word.
if &t_kb != ''
    noremap!  
else
    noremap!  
endif

autocmd FileType javascript,vim setlocal sw=4 et
autocmd FileType html setlocal sw=2 et

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
    set t_Co=16

    if $TERMINAL_THEME =~ 'light'
        set bg=light
    else
        set bg=dark
    endif

    if !exists('$TERMINAL_THEME') || $TERMINAL_THEME =~ 'clean'
        hi clear Statement
        hi clear Identifier
        hi Comment ctermfg=1
        hi clear Constant
        hi String ctermfg=4
        hi clear Special
        hi clear PreProc
        hi clear Type
        hi Todo ctermfg=none ctermbg=none cterm=reverse
        hi SpecialKey ctermfg=none ctermbg=none cterm=reverse
        hi Title ctermfg=none cterm=bold
        hi Error ctermbg=1 ctermfg=15
        hi ColorColumn ctermfg=8 ctermbg=7
        hi Added ctermfg=2

    elseif $TERMINAL_THEME =~ 'vga'
        hi Statement ctermfg=12 cterm=bold
        hi Identifier ctermfg=12 cterm=bold
        hi Function ctermfg=10 cterm=bold
        hi Comment ctermfg=8
        hi Constant ctermfg=6
        hi clear Number
        hi clear Special
        hi PreProc ctermfg=14
        hi clear Type
        hi Title ctermfg=none cterm=bold
        hi Error ctermbg=1 ctermfg=7

        hi Todo ctermfg=9 ctermbg=none cterm=bold
        hi SpecialKey ctermfg=9 ctermbg=none cterm=bold
        hi ColorColumn ctermfg=7 ctermbg=8

        hi! shVariable ctermfg=15 cterm=none
        hi! shAlias ctermfg=15 cterm=none
        hi! link shOperator None
        hi! link shTestOpr None
        hi! link bashAdminStatement None
        hi! link bashStatement None
        syn keyword shStatement command
        hi! link Delimiter None
        hi! link shOption None
        hi! link shCommandSub None

        hi! link vimHiCtermFgBg None
        hi! link vimHiCterm None
        hi! vimFuncName ctermfg=15
        hi! link vimFunction Function
        hi! link vimHiAttrib None

        hi! pythonBuiltin ctermfg=15
        hi! link pythonInclude pythonStatement
        hi! pythonExceptions ctermfg=15 cterm=bold

        hi! link javaScriptBraces None
        hi! javaScriptType ctermfg=15


    elseif $TERMINAL_THEME =~ 'solarized'
        hi Statement ctermfg=2
        hi Identifier ctermfg=4
        hi Comment ctermfg=10
        hi Constant ctermfg=6
        hi Special ctermfg=1
        hi PreProc ctermfg=1
        hi Type ctermfg=3
        hi Todo ctermfg=5 ctermbg=none cterm=bold
        hi MatchParen ctermfg=1 ctermbg=10 cterm=bold
        hi ColorColumn ctermbg=7

        hi pythonBuiltin ctermfg=13 cterm=none
        hi! link vimCommand None
        hi! link Delimiter None
        hi! link vimGroup Identifier
        hi! link vimHiGroup vimGroup

    elseif $TERMINAL_THEME =~ 'gruvbox'
        hi SpecialKey ctermfg=0 ctermbg=7 cterm=bold

        hi Statement ctermfg=9
        hi Identifier ctermfg=14
        hi Comment ctermfg=8
        hi Constant ctermfg=10
        hi Number ctermfg=13
        hi Special ctermfg=3
        hi PreProc ctermfg=14
        hi Type ctermfg=13
        hi Todo ctermfg=15 ctermbg=0 cterm=bold
        hi MatchParen ctermfg=none ctermbg=8 cterm=bold

        hi Boolean ctermfg=13
        hi! link Operator None
        hi! pythonInclude ctermfg=12
        hi! pythonBuiltin ctermfg=6
        hi! javaScriptIdentifier ctermfg=3
        hi! link javaScriptBraces None
        hi! link javaScriptOperator Statement
        hi! link shOption None
        hi! link Delimiter None
        hi! link vimHiCtermFgBg None
        hi! link vimHiCterm None

    elseif $TERMINAL_THEME =~ 'nord'
        hi Statement ctermfg=4
        hi Function ctermfg=6
        hi Identifier ctermfg=4
        hi Comment ctermfg=8
        hi Constant ctermfg=5
        hi String ctermfg=2
        hi clear Special
        hi PreProc ctermfg=4
        hi Type ctermfg=4
        hi Todo ctermfg=1 ctermbg=none cterm=bold

        hi! link javaScriptBraces None
        hi! link pythonBuiltin Identifier
        hi! link shDerefSimple None
        hi! link shCmdSubRegion None
        hi! link shDerefVar None
        hi! link shVariable None
        hi! link shAlias None
        hi! link vimVar None
        hi! link vimUserFunc Function
    endif
endfunc

autocmd VimEnter * call SetTheme()
autocmd ColorScheme default call SetTheme()
