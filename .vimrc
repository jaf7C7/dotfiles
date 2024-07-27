set nohlsearch
set noincsearch
set colorcolumn=81
set hidden
set rulerformat=%40(%{&ft}\ \ %{&et==1?'spaces:'.&sw:'tabs:'.&ts}\ \ %{&ff}\ \ %{&fenc}%=%l,%v%)
set noshowmode
set fo+=j  " Remove comment leader when joining lines
packadd comment  " Comment text with `gc{motion}` or `gcc`.
packadd matchit  " Improve `%` behaviour.

set autoindent
set tabstop=8  " A tab char still displays as 8 cells.
set shiftwidth=4
set softtabstop=-1  " <Tab> inserts 'shiftwidth' spaces.
set expandtab

" Enable/disable alternate screen scrolling when entering/exiting vim
" https://www.invisible-island.net/xterm/ctlseqs/ctlseqs.html
let &t_ti = "\e[?1007l" . &t_ti
let &t_te = &t_te . "\e[?1007h"

" Make Ctrl-Backspace delete previous word.
if &t_kb != ''
    noremap!  
else
    noremap!  
endif

" Auto-fill new html files with boilerplate.
if filereadable(expand('~/Templates/boilerplate.html'))
    autocmd BufNewFile *.html 0r ~/Templates/boilerplate.html
endif

" Mark trailing whitespace as an error when not in insert mode.
" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
3match Error /\s\+$/
autocmd BufWinEnter * 3match Error /\s\+$/
autocmd InsertEnter * 3match Error /\s\+\%#\@<!$/
autocmd InsertLeave * 3match Error /\s\+$/

" Enable automatic bracketed paste (no more `:set paste`)
" https://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x
" if &term =~ "xterm.*"
"     let &t_ti = &t_ti . "\e[?2004h"
"     let &t_te = "\e[?2004l" . &t_te
"     function! XTermPasteBegin(ret)
"         set pastetoggle=<Esc>[201~
"         set paste
"         return a:ret
"     endfunction
"     map <expr> <Esc>[200~ XTermPasteBegin("i")
"     imap <expr> <Esc>[200~ XTermPasteBegin("")
"     vmap <expr> <Esc>[200~ XTermPasteBegin("c")
"     cmap <Esc>[200~ <nop>
"     cmap <Esc>[201~ <nop>
" endif

" Check syntax item under cursor with `gs`
" https://stackoverflow.com/questions/9464844/how-to-get-group-name-of-highlighting-under-cursor-in-vim
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
        hi ColorColumn ctermbg=10 ctermfg=none cterm=none
        hi StatusLine ctermfg=10 ctermbg=7 cterm=none
        hi! link StatusLineNC StatusLine
        hi MatchParen ctermfg=1 ctermbg=8 cterm=bold
        hi PMenu ctermfg=11 ctermbg=10
        hi PMenuSel ctermfg=0 ctermbg=13

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
        hi markdownCode ctermfg=4

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
