export EDITOR=vi
export VIMINIT='set sw=0 ts=4 ai hidden wc=<Tab> lcs=tab:»\ ,space:· hi=100 more t_Co=8 bg=dark hl=vr,+ri,=rb,x-,Xr'
export NANO='-bMr79 -xiT4'

PROMPT_COMMAND='PS1="\[\e]0;${TERMINAL_TITLE:-\u@\h: \w}\a\]${PROMPT_STRING}\$ "'
CDPATH=.:~:~/Projects

alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias nano='nano $NANO'
alias tree='tree -C --gitignore'
