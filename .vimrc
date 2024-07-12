filetype plugin indent on " See :help 'indent.txt'
packadd comment           " Comment text with `gc{motion}` or `gcc`.
packadd matchit           " Improve `%` behaviour.

set nohlsearch

" Make Ctrl-Backspace delete previous word.
inoremap <C-H> <C-W>
cnoremap <C-H> <C-W>

" Mark trailing whitespace as an error when not in insert mode.
3match Error /\s\+$/
autocmd BufWinEnter * 3match Error /\s\+$/
autocmd InsertEnter * 3match Error /\s\+\%#\@<!$/
autocmd InsertLeave * 3match Error /\s\+$/

" Filetype whitespace settings
autocmd FileType javascript,vim setlocal sw=4 et
autocmd FileType html setlocal sw=2 et

" See `:help colorscheme-override`.
augroup color_overrides
    autocmd!
    autocmd Colorscheme default
        \ set t_Co=16
        \ | hi ColorColumn ctermbg=8 cterm=bold
        \ | hi Directory ctermfg=15
        \ | hi ErrorMsg ctermfg=1 ctermbg=none cterm=bold
        \ | hi IncSearch ctermfg=0 ctermbg=15 cterm=none
        \ | hi NonText ctermfg=none cterm=bold
        \ | hi PMenu ctermfg=0 ctermbg=8
        \ | hi PmenuSbar ctermbg=8
        \ | hi PMenuSel ctermfg=0 ctermbg=7
        \ | hi PmenuThumb ctermbg=7
        \ | hi Search ctermfg=0 ctermbg=7 cterm=none
        \ | hi SpecialKey ctermfg=1 cterm=bold
        \ | hi Title ctermfg=15 cterm=bold
        \ | hi Underlined ctermfg=none cterm=underline
        \ | hi WarningMsg ctermfg=3 cterm=bold
        \ | hi clear Constant
        \ | hi Function ctermfg=15
        \ | hi clear Identifier
        \ | hi clear PreProc
        \ | hi clear Special
        \ | hi clear Type
        \ | hi Comment ctermfg=6
        \ | hi Error ctermfg=7 ctermbg=1
        \ | hi MatchParen ctermfg=9 ctermbg=none cterm=bold
        \ | hi Statement ctermfg=12
        \ | hi String ctermfg=2
        \ | hi Todo ctermfg=9 ctermbg=none cterm=bold
augroup END

color default

" Check syn item under cursor with `gs`.
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap gs :call SynStack()<CR>

" Syntax overrides
autocmd FileType python syntax keyword Statement import from
autocmd FileType sh
    \ hi! link shQuote String
    \ | hi! link shOperator None
    \ | hi! link bashStatement None
    \ | hi! link shSet shStatement
    \ | hi! link shConditional Statement
    \ | hi! link shTestOpr None
    \ | hi! link shLoop Statement
    \ | hi! link shIf None
    \ | hi! link shSnglCase None
    \ | hi! link shRepeat None
    \ | syn clear shDerefWordError
