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
        \ | hi Search ctermfg=0 ctermbg=7 cterm=none
        \ | hi IncSearch ctermfg=0 ctermbg=13 cterm=bold
        \ | hi Error ctermfg=7 ctermbg=1
        \ | hi Todo ctermfg=9 ctermbg=none cterm=bold
        \ | hi MatchParen ctermfg=9 ctermbg=none cterm=bold
        \ | hi ColorColumn ctermbg=8 cterm=bold
        \ | hi Statement ctermfg=12
        \ | hi Comment ctermfg=3
        \ | hi String ctermfg=6
        \ | hi clear Constant
        \ | hi clear Identifier
        \ | hi clear Type
        \ | hi clear Special
        \ | hi clear PreProc
        \ | hi clear Function
        \ | hi PMenu ctermfg=0 ctermbg=8
        \ | hi PMenuSel ctermfg=0 ctermbg=7
        \ | hi PmenuSbar ctermbg=8
        \ | hi PmenuThumb ctermbg=7
augroup END

color default


" Vimscript
augroup vimscript_syntax_overrides
    autocmd!
    autocmd FileType vimscript syn clear vimFuncName
augroup END


" Shell
augroup shell_syntax_overrides
    autocmd!
    autocmd FileType sh
        \ hi link shVarAssign shStatement
        \ | hi link shCaseEsac shStatement
augroup END


" Python
augroup python_syntax_overrides
    autocmd!
    autocmd FileType python
        \ hi link pythonBraces Statement
        \ | hi link pythonOperator Statement
        \ | hi link pythonInclude Statement
        \ | hi pythonBuiltin cterm=bold
        \ | syn clear pythonFunction
        \ | syn match pythonBraces /[][{}()]/
        \ | syn match pythonOperator /[-+*^%></?!=&|]\+\ze\(\s\+\|$\)/
augroup END


" JavaScript
augroup javascript_syntax_overrides
    autocmd!
    autocmd FileType javascript
        \ syn clear javaScriptBraces
        \ | syn match javaScriptBraces /[][{}()]/
        \ | syntax match javaScriptOperator /[-+*^%></?!=&|]\+\ze\(\s\+\|$\)/
        \ | syntax match javaScriptLineComment +\/\/.*+ contains=CONTAINED
        \ | syntax region javaScriptComment start=+/\*+ end=+\*/+  contains=CONTAINED
augroup END


" Check syntax item under cursor with `gs`
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap gs :call SynStack()<CR>
