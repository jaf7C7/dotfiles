filetype plugin indent on " See :help 'indent.txt'
packadd comment           " Comment text with `gc{motion}` or `gcc`.
packadd matchit           " Improve `%` behaviour.
set nohlsearch
set noshowmode

" Make Ctrl-Backspace delete previous word.
if &t_kb != ''
    noremap!  
else
    noremap!  
endif

autocmd FileType javascript,vim setlocal sw=4 et
autocmd FileType html setlocal sw=2 et

" Mark trailing whitespace as an error when not in insert mode.
3match Error /\s\+$/
autocmd BufWinEnter * 3match Error /\s\+$/
autocmd InsertEnter * 3match Error /\s\+\%#\@<!$/
autocmd InsertLeave * 3match Error /\s\+$/

" Check syntax item under cursor with `gs`
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap gs :call SynStack()<CR>

function! SetTheme()
    " UI
    hi ColorColumn ctermfg=none ctermbg=8
    hi Todo ctermfg=none ctermbg=none cterm=reverse
    hi Title ctermfg=none ctermbg=none cterm=bold
    hi Underlined ctermfg=none cterm=underline
    hi clear Directory
    hi SpecialKey ctermfg=1 cterm=bold
    hi Error ctermfg=7 ctermbg=1
    hi PMenu ctermfg=0 ctermbg=7

    " Syntax highlighting
    hi Search ctermfg=0 ctermbg=7
    hi Comment ctermfg=1
    hi clear Constant
    hi clear String
    hi clear Special
    hi clear Identifier
    hi clear Statement
    hi clear PreProc
    hi clear Type
endfunc

autocmd ColorScheme default call SetTheme()
color default
