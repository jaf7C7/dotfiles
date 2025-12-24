[[ $- == *i* ]] || return

for _ in {${PREFIX}/usr/share/bash-completion,/etc}/bash_completion; do
	test -f "$_" && . "$_"
done

if test -d ~/.local/bin; then
	PATH=~/.local/bin:"$PATH"
fi

PROMPT_COMMAND='printf "\e]0;${TERMINAL_TITLE:-${USER}@${HOSTNAME}: ${PWD/~/\~}}\a"'
PS1='\$ '
CDPATH=.:~:~/Projects:~/Documents

shopt -s checkjobs
shopt -s extglob
shopt -s globstar

alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias e='$EDITOR'
alias tree='tree -I .git --gitignore'
alias T='gnome-terminal --'
