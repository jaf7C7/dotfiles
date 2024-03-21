" ~/.vimrc

set compatible      " Act like `vi(1)` as much as possible
set shell=bash      " Use bash for all shell commands
set expandtab       " Expand tabs to spaces
set shiftwidth=4    " `>>` and `<<` shift 4 spaces
set softtabstop=-1  " `<Tab>` and `<BS>` insert/delete `shiftwidth` spaces
set autoindent      " New lines will be indented to the same level as the last
set copyindent      " `autoindent` will use tabs or spaces accordingly
set history=50      " Command line history
set more            " Allow paging in command window
set showmatch       " Highlight matching parentheses
set cpoptions-=<    " Allow symbolic control chars in mappings (e.g. `<C-a>`)
set cpoptions-=C    " Allow line continuation with `\`
set cpoptions-=S    " Don't set global buffer options
set timeoutlen=100  " Wait 100ms after `<Esc>` for a mapping to complete
set list                        " Show tabs and trailing spaces
set listchars=tab:\|\ ,trail:.  " Tab: `|    `, Trailing space: `.`
set shortmess=I                 " No startup screen
set laststatus=0                " Don't show status bar
set clipboard=                  " Don't use system clipboard
set noloadplugins               " Don't load plugins
filetype plugin indent off      " ^^^^^^^^^^^^^^^^^^

" Readline-ish command-line editing and completion
set wildchar=<Tab>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>b <S-Left>

" :p -> :prev[ious]
cnoreabbrev p prev

" K calls python help
autocmd FileType python setlocal keywordprg=python\ -c'help(<cword>)'

if has('syntax')
    syntax clear
    hi Comment ctermfg=1 ctermbg=none cterm=none
    hi Constant ctermfg=none ctermbg=none cterm=none
    hi Special ctermfg=none ctermbg=none cterm=none
    hi Identifier ctermfg=none ctermbg=none cterm=none
    hi Statement ctermfg=none ctermbg=none cterm=none
    hi PreProc ctermfg=none ctermbg=none cterm=none
    hi Type ctermfg=none ctermbg=none cterm=none
    hi Underlined ctermfg=none ctermbg=none cterm=none
    hi Ignore ctermfg=none ctermbg=none cterm=none
    hi Error ctermfg=none ctermbg=none cterm=none
    hi Todo ctermfg=0 ctermbg=1 cterm=reverse
    hi String ctermfg=2 ctermbg=none cterm=none
    hi Function ctermfg=4 ctermbg=none cterm=bold
    "
    " TODO: Vim can't highlight long strings correctly
    "     https://learnvimscriptthehardway.stevelosh.com/chapters/47.html
    "     https://vim.fandom.com/wiki/Fix_syntax_highlighting
    "
    " au filetype python
    "    \ hi DocString ctermfg=4 cterm=bold |
    "    \ match DocString /"""\_.\{-}"""$/
    " syntax enable
endif

highlight ErrorMsg ctermfg=1 ctermbg=none cterm=none
highlight clear Directory
highlight Title ctermfg=none ctermbg=none cterm=bold
highlight Visual ctermfg=7 ctermbg=4 cterm=none
highlight PMenu ctermfg=7 ctermbg=4 cterm=none
highlight PMenuSel ctermfg=6 ctermbg=5 cterm=bold
