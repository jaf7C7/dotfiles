" ~/.vimrc

set compatible
set shiftwidth=4
set softtabstop=-1
set expandtab
set copyindent
set autoindent
set list
set listchars=tab:\|\ ,trail:.
set shortmess=I
set history=50
set cpoptions-=<
set timeoutlen=300

cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>b <S-Left>

highlight ErrorMsg ctermfg=1 ctermbg=none cterm=none
highlight clear Directory
highlight Title ctermfg=none cterm=bold
highlight Visual ctermfg=7 ctermbg=4 cterm=none
