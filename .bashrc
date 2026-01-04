[[ $- == *i* ]] || return

export EDITOR='nano --afterends --autoindent --constantshow --fill=79 --minibar --nohelp --softwrap --syntax=none --trimblanks --wordchars=_ --zap --zero'
export VISUAL='vi'
export VIMINIT='set compatible tabstop=8 shiftwidth=0 softtabstop=-1 autoindent hidden autoread wildchar=<Tab> history=100 formatprg=fmt\ -p\\\\#\\\ more listchars=tab:»\ ,space:· t_Co=8 background=dark highlight=<-,k-,=rb,+ri,{ri,}rib,sr,Sr,vr,Wbr,x-,Xr'

PROMPT_COMMAND='printf "\e]0;${TERMINAL_TITLE:-${USER}@${HOSTNAME}: ${PWD/~/\~}}\a"'
PS1='\$ '
CDPATH=.:~:~/.local
HISTIGNORE=ignorespace:erasedups
HISTFILESIZE=100000
HISTSIZE=10000

shopt -s checkjobs
shopt -s extglob
shopt -s failglob
shopt -s globstar
shopt -s histappend
shopt -s histreedit
shopt -s histverify

alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias nano='$EDITOR'
alias tree='tree -aI .git --gitignore'
