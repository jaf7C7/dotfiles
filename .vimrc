filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab

" Make Ctrl-Backspace delete previous word.
inoremap <C-H> <C-W>
cnoremap <C-H> <C-W>

hi Directory ctermfg=15
hi Title ctermfg=15 cterm=bold
hi SpecialKey ctermfg=1 cterm=bold

" See `:help colorscheme-override`.
augroup color_overrides
    autocmd!
    autocmd Colorscheme *
       \ set t_Co=16
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
