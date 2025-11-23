[[ $- == *i* ]] || return

export EDITOR=vi
export VIMINIT='set compatible shiftwidth=0 autoindent hidden autoread wildchar=<Tab> history=100 formatprg=fmt\ -p\\\\#\\\  more listchars=tab:»\ ,space:· t_Co=8 background=dark highlight=vr,+ri,=rb,x-,Xr'

PROMPT_COMMAND='printf "\e]0;${TERMINAL_TITLE:-${USER}@${HOSTNAME}: ${PWD/~/\~}}\a"'
PS1='\$ '
CDPATH=.:~:~/Projects

alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias tree='tree -C --gitignore'

. /etc/bash_completion

project() {
	bash --rcfile ~/Projects/"$1"/.bashrc
}

_project() {
	set -- ~/Projects/${2}*/.bashrc
	set -- "${@#~/Projects/}"
	set -- "${@%/.bashrc}"
	COMPREPLY=("$@")
}

complete -F _project project
