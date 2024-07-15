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

autocmd FileType javascript,vim setlocal sw=4 et
autocmd FileType html setlocal sw=2 et

augroup colorscheme_overrides
    autocmd!
    set t_Co=8
    autocmd ColorScheme default
        \ hi Normal ctermfg=none guifg=#CB8600 guibg=#251800
        \| hi ColorColumn ctermbg=7 guibg=#362300
        \| hi MatchParen guibg=#795000 guifg=#FFA800
        \| hi Todo ctermfg=15 ctermbg=0 guibg=#FFA800 guifg=#251800 cterm=bold
        \| hi Search ctermfg=none ctermbg=7 guifg=#CB8600 guibg=#362300
        \| hi Comment ctermfg=1 cterm=italic guifg=#795000
        \| hi Constant ctermfg=none guifg=#875a01
        \| hi Special ctermfg=none guifg=#CB8600
        \| hi Identifier gui=bold ctermfg=none guifg=#FFA800
        \| hi Statement ctermfg=none guifg=#CB8600
        \| hi PreProc ctermfg=none guifg=#CB8600
        \| hi Type ctermfg=none guifg=#CB8600
augroup END

color default
