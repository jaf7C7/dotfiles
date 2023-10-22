" ~/.vimrc

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set t_BE=  " Disable bracketed paste (to middle click paste commands)
set shortmess=I
set nohlsearch
set noshowmode noruler noshowcmd
set listchars=tab:.\ 
set list
set autoindent

filetype indent off

autocmd FileType markdown,html* set ts=2 sw=2 et
autocmd FileType vim set ts=4 sw=4 et

if has ('syntax')
    syntax on

    " Highlight trailing whitespace
    hi TrailingSpace ctermbg=1
    au BufEnter * match TrailingSpace /\s\+$/
    au InsertEnter * match TrailingSpace /\s\+\%#\@<!$/
    au InsertLeave * match TrailingSpace /\s\+$/

    " Get syntax group under the cursor
    function! SynStack()
        if !exists("*synstack")
            return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc
    nnoremap gs :call SynStack()<CR>

    " Syntax highlighting overrides:

    hi clear Directory

    hi clear PreProc
    hi clear Statement
    hi clear Identifier
    hi Constant ctermfg=6
    hi Function ctermfg=2 cterm=bold
    hi Comment ctermfg=4 cterm=bold
    hi clear Type
    hi clear Special
    hi clear Error
    hi Todo ctermfg=1 ctermbg=none cterm=bold
    hi Title ctermfg=none cterm=bold
    hi Underlined ctermfg=none cterm=underline

    hi! link vimFunction Function
    hi! link vimFuncName NONE

    hi! link pythonBuiltin NONE
    hi! link pythonDecoratorName NONE

    hi markdownLinkText ctermfg=none cterm=underline
    hi! link markdownUrl Constant
    hi! link markdownUrlDelimiter NONE
    hi! link markdownBlockquote NONE
endif
