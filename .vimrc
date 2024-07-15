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
        \ hi ColorColumn ctermfg=147 ctermbg=234 cterm=bold
        \ | hi Comment ctermfg=147
        \ | hi Statement ctermfg=178
        \ | hi Constant ctermfg=134
        \ | hi Identifier ctermfg=152
        \ | hi Type ctermfg=150
        \ | hi Special ctermfg=187
        \ | hi PreProc ctermfg=146
augroup END

color default
