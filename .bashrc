[[ $- == *i* ]] || return

export EDITOR=vi
export VIMINIT='set sw=0 ts=8 ai hidden wc=<Tab> lcs=tab:»\ ,space:· hi=100 more t_Co=8 bg=dark hl=vr,+ri,=rb,x-,Xr fp=fmt\ -p'\''\\#\ '\'
export NANO='-bMr79 -xiT4'

PROMPT_COMMAND='printf "\e]0;${TERMINAL_TITLE:-${USER}@${HOSTNAME}: ${PWD/~/\~}}\a"'
PS1='\$ '
CDPATH=.:~:~/Projects

alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias nano='nano $NANO'
alias tree='tree -C --gitignore'

. /etc/bash_completion

project() {
	bash --rcfile ~/Projects/"$1"/.bashrc
}

_project() {
	set -- ~/Projects/*${2}*/.bashrc
	set -- "${@#~/Projects/}"
	set -- "${@%/.bashrc}"
	COMPREPLY=("$@")
}

complete -F _project project
