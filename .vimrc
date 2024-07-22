filetype plugin indent on " See :help 'indent.txt'
packadd comment           " Comment text with `gc{motion}` or `gcc`.
packadd matchit           " Improve `%` behaviour.
set nohlsearch
set noshowmode
set noincsearch
set colorcolumn=81
set statusline=%f\ %m\ %r\ %y\ %l:%v\ ts=%{&ts}\ et=%{&et}\ (%n)

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
    set bg=dark
    set t_Co=16
    set notermguicolors

    if !exists('$TERMINAL_THEME')
        let $TERMINAL_THEME = 'clean'
    endif

    if $TERMINAL_THEME =~ 'clean'
        hi SpecialKey ctermfg=none ctermbg=none cterm=reverse
        hi ColorColumn ctermfg=8 ctermbg=7

        hi clear Statement
        hi clear Identifier
        hi Comment ctermfg=1
        hi clear Constant
        hi String ctermfg=4
        hi clear Special
        hi clear PreProc
        hi clear Type
        hi Todo ctermfg=1 ctermbg=none cterm=reverse
        hi Title ctermfg=none cterm=none
        hi Error ctermbg=1 ctermfg=15
        hi Added ctermfg=2

    elseif $TERMINAL_THEME =~ 'vga'
        hi SpecialKey ctermfg=9 ctermbg=none cterm=bold
        hi ColorColumn ctermfg=7 ctermbg=8

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
        hi Todo ctermfg=9 ctermbg=none cterm=bold
        hi Error ctermbg=1 ctermfg=7

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
        hi ColorColumn ctermbg=10 ctermfg=8 cterm=none
        hi StatusLine ctermfg=10 ctermbg=8 cterm=none
        hi! link StatusLineNC StatusLine
        hi MatchParen ctermfg=1 ctermbg=8 cterm=bold

        hi Statement ctermfg=2
        hi Identifier ctermfg=4 cterm=none
        hi Comment ctermfg=8
        hi Constant ctermfg=6
        hi Special ctermfg=1
        hi PreProc ctermfg=1
        hi Type ctermfg=3
        hi Todo ctermfg=5 ctermbg=none cterm=bold

        hi pythonBuiltin ctermfg=13 cterm=none
        hi! link vimCommand None
        hi! link Delimiter None
        hi! link vimGroup Identifier
        hi! link vimHiGroup vimGroup

    elseif $TERMINAL_THEME =~ 'gruvbox'
        hi SpecialKey ctermfg=0 ctermbg=7 cterm=bold
        hi ColorColumn ctermbg=10 ctermfg=7 cterm=none
        hi StatusLine ctermfg=0 ctermbg=7 cterm=none
        hi! link StatusLineNC StatusLine
        hi MatchParen ctermfg=none ctermbg=10 cterm=bold

        hi Statement ctermfg=1
        hi Identifier ctermfg=6 cterm=none
        hi Comment ctermfg=7
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
        hi! javaScriptIdentifier ctermfg=3
        hi! link javaScriptBraces None
        hi! link javaScriptOperator Statement
        hi! link shOption None
        hi! link Delimiter None
        hi! link vimHiCtermFgBg None
        hi! link vimHiCterm None
    endif
endfunc

autocmd VimEnter * call SetTheme()
autocmd ColorScheme default call SetTheme()
