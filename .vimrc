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
    autocmd Colorscheme default
       \ set t_Co=16
       \ | hi Directory ctermfg=15
       \ | hi Title ctermfg=15 cterm=bold
       \ | hi SpecialKey ctermfg=1 cterm=bold
       \ | hi NonText ctermfg=none cterm=bold
       \ | hi Search ctermfg=0 ctermbg=15 cterm=none
       \ | hi IncSearch ctermfg=0 ctermbg=11 cterm=bold
       \ | hi Error ctermfg=7 ctermbg=1
       \ | hi Todo ctermfg=9 ctermbg=none cterm=bold
       \ | hi MatchParen ctermfg=0 ctermbg=6 cterm=none
       \ | hi Statement ctermfg=12 cterm=bold
       \ | hi Comment ctermfg=6
       \ | hi String ctermfg=2
       \ | hi Constant ctermfg=1
       \ | hi Identifier ctermfg=15 cterm=bold
       \ | hi Type ctermfg=5
       \ | hi Special ctermfg=3
       \ | hi PreProc ctermfg=15

augroup END
color default
