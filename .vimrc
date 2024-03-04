" ~/.vimrc

set compatible      " Act like `vi(1)` as much as possible
set expandtab       " Expand tabs to spaces
set shiftwidth=4    " `>>` and `<<` shift 4 spaces
set softtabstop=-1  " `<Tab>` and `<BS>` insert/delete `shiftwidth` spaces
set autoindent      " New lines will be indented to the same level as the last
set copyindent      " `autoindent` will use tabs or spaces accordingly
set history=50      " Command line history
set cpoptions-=<    " Allow symbolic control chars in mappings (e.g. `<C-a>`)
set timeoutlen=100  " Wait 100ms after `<Esc>` for a mapping to complete
set list                        " Show tabs and trailing spaces
set listchars=tab:\|\ ,trail:.  " Tab: `|    `, Trailing space: `.`
set shortmess=I                 " No startup screen

" Readline-ish command-line editing and completion
set wildchar=<Tab>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>b <S-Left>

highlight ErrorMsg ctermfg=1 ctermbg=none cterm=none
highlight clear Directory
highlight Title ctermfg=none ctermbg=none cterm=bold
highlight Visual ctermfg=7 ctermbg=4 cterm=none
highlight PMenu ctermfg=4 ctermbg=none cterm=none
highlight PMenuSel ctermfg=7 ctermbg=4 cterm=none
