# ~/.profile

case "$PATH" in
    "$HOME/bin:*:$HOME/go/bin"*) ;;
    *) PATH="$HOME/bin:$PATH:$HOME/go/bin"
esac

if [ -z "$TMUX" ] && tmux has-session 2>/dev/null; then
    printf '\nActive tmux sessions:\n'
    tmux ls
fi

if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

export EXINIT=$(cat <<\EOI
" Map <Tab> to 4 spaces in insert mode
map! 	     

" Map `^D` to 4 backspaces in insert mode
map!  

" Map `^O` in normal mode to open a new line below and indent
map  :s/\([     ]\{1,\}\)\(.*\)/&\1/jA

" Map `>` and `<` to indent and de-dent the section given by marks `[` and `]`
map > :'[,']s/^/    /
map < :'[,']s/    //

" Map `[[` and `]]` to jump to marks `[` and `]` respectively
map [[ '[
map ]] ']

" Map `**` to execute current line as an ex command
map ** :d x|@x

" Map `#` to comment the region between the cursor and the last jump point (mark `'`)
map # !''cmt
EOI
)
