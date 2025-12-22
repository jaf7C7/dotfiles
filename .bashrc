[[ $- == *i* ]] || return

for _ in {${PREFIX}/usr/share/bash-completion,/etc}/bash_completion; do
    test -f "$_" && . "$_"
done

export PAGER=less
export EDITOR='nano --ignorercfiles --afterends --autoindent --tabstospaces --tabsize=4 --softwrap --fill=79 --trimblanks --minibar --constantshow --zero --nohelp --syntax=none'
export VIMINIT='set compatible expandtab shiftwidth=4 softtabstop=-1 autoindent hidden autoread wildchar=<Tab> history=100 formatprg=fmt\ -p\\\\#\\\ more listchars=tab:»\ ,space:· t_Co=8 background=dark highlight=vr,+ri,=rb,x-,Xr'

PROMPT_COMMAND='printf "\e]0;${TERMINAL_TITLE:-${USER}@${HOSTNAME}: ${PWD/~/\~}}\a"'
PS1='\$ '
CDPATH=.:~:~/Projects:~/Documents

shopt -s checkjobs
shopt -s extglob
shopt -s globstar

alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias diff='diff --color=auto'
alias e='$EDITOR'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias tree='tree -C -I .git --gitignore'
