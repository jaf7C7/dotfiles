[[ $- == *i* ]] || return

for _ in {${PREFIX}/usr/share/bash-completion,/etc}/bash_completion; do
	test -f "$_" && . "$_"
done

export PATH=~/.local/bin:"$PATH"
export EDITOR='nano --afterends --autoindent --constantshow --fill=79 --minibar --nohelp --softwrap --syntax=none --trimblanks --zap --zero'

PROMPT_COMMAND='printf "\e]0;${TERMINAL_TITLE:-${USER}@${HOSTNAME}: ${PWD/~/\~}}\a"'
PS1='\$ '
CDPATH=.:~:~/Projects:~/Documents

shopt -s checkjobs
shopt -s extglob
shopt -s globstar

alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias T='gnome-terminal --'
