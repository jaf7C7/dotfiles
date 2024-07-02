filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab

" Make Ctrl-Backspace delete previous word.
inoremap <C-H> <C-W>
cnoremap <C-H> <C-W>

" See `:help colorscheme-override`.
augroup color_overrides
    autocmd!
    autocmd Colorscheme *
       \ set t_Co=16
       \ | hi Directory ctermfg=15
       \ | hi Title ctermfg=15 cterm=bold
       \ | hi SpecialKey ctermfg=1 cterm=bold
       \ | hi NonText ctermfg=None cterm=bold
       \ | hi Search ctermfg=0 ctermbg=15 cterm=none
       \ | hi IncSearch ctermfg=0 ctermbg=11 cterm=bold
       \ | hi Error ctermfg=7 ctermbg=1
       \ | hi Todo ctermfg=9 ctermbg=None cterm=bold
    autocmd Colorscheme default
       \ | hi Statement ctermfg=12 cterm=bold
       \ | hi Comment ctermfg=14
       \ | hi String ctermfg=2
       \ | hi Constant ctermfg=1
       \ | hi Identifier ctermfg=15 cterm=bold
       \ | hi Type ctermfg=6
       \ | hi Special ctermfg=3
       \ | hi PreProc ctermfg=15

augroup END
color default
