[[ $- == *i* ]] || return

EDITOR='nano --afterends --autoindent --constantshow --fill=79 --minibar --nohelp --softwrap --syntax=none --trimblanks --wordchars=_ --zap --zero'
VIMINIT='set compatible expandtab shiftwidth=4 softtabstop=-1 autoindent hidden autoread wildchar=<Tab> history=100 formatprg=fmt\ -p\\\\#\\\ more listchars=tab:»\ ,space:· t_Co=8 background=dark highlight=vr,+ri,=rb,x-,Xr'

PROMPT_COMMAND='printf "\e]0;${TERMINAL_TITLE:-${USER}@${HOSTNAME}: ${PWD/~/\~}}\a"'
PS1='\$ '
CDPATH=.:~:~/Projects:~/Documents

shopt -s checkjobs
shopt -s extglob
shopt -s globstar

alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias nano='$EDITOR'
alias tree='tree -aI .git --gitignore'
