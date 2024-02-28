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
set autoindent
set shiftwidth=4
" Map <Tab> to 4 spaces in insert mode
map! 	     
EOI
)
