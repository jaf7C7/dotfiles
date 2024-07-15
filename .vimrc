filetype plugin indent on " See :help 'indent.txt'
packadd comment           " Comment text with `gc{motion}` or `gcc`.
packadd matchit           " Improve `%` behaviour.

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
    autocmd ColorScheme default
        \ set t_Co=256
        \| hi Comment ctermfg=1
        \| hi clear Constant
        \| hi clear Special
        \| hi clear Identifier
        \| hi clear Statement
        \| hi clear PreProc
        \| hi clear Type
augroup END

color default
