# How To Configure A Great Minimal Vim

Quick and easy way (in `.bashrc` or `.profile`):

```
VIMINIT='set compatible tabstop=8 shiftwidth=0 softtabstop=-1 autoindent hidden autoread wildchar=<Tab> history=100 formatprg=fmt\ -p\\\\#\\\ more listchars=tab:»\ ,space:· t_Co=8 background=dark highlight=vr,+ri,=rb,x-,Xr'
export VIMINIT
```

Or using `vimrc`:

```
" ~/.vimrc

" Act like `vi(1)`.
set compatible

" Keep tabs displayed at 8 spaces as they should be.
set tabstop=8

" Make `shiftwidth` follow `tabstop`. Change this and set `expandtab` if you
" want to indent with anything but 8 space tabs.
set shiftwidth=0

" Make `softtabstop` follow `shiftwidth`. This means that a backspace will
" delete `shiftwidth` spaces.
" TIP: Don't forget you can use `<C-t>` and `<C-d>` to indent/de-dent the
" current line as well.
set softtabstop=-1

" Automatically indent new lines.
set autoindent

" Don't complain about unsaved changes when switching buffers.
set hidden

" Automatically re-read current file on events like `^Z`, `fg` etc. This
" is great if you have an external file-watcher formatting files.
" Some autocommands to try if you want the buffer to update without leaving vim:
" - Re-read current file after cursor is inactive for 'updatetime':
" 	au CursorHold,CursorHoldI * checktime
" - Re-read the current file when cursor is moved in any mode:
" 	au CursorMoved,CursorMovedC,CursorMovedI * checktime
set autoread

" Autocomplete in command-mode with `Tab`.
set wildchar=<Tab>

" Save 100 previous commands.
set history=100

" Reformat comments with `gq<motion>` and comment leader `# `.
set formatprg=fmt\ -p\\\\#\\\

" Allow `more` prompt for scrolling info screens (e.g. `:highlight`).
set more

" Set nicer characters for whitespace display.
set listchars=tab:»\ ,space:·

" Just use terminal colors 0-7.
set t_Co=8

" Tell vim the terminal background is dark to change the colours it uses.
set background=dark

" Change a few ui colours (see :help 'highlight').
set highlight=vr,+ri,=rb,x-,Xr'

" Turn off distracting syntax highlighting.
if has('syntax')
    syntax off
endif
```


