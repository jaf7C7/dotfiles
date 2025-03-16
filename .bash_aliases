alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias nano='nano --nohelp --afterends --zap --autoindent --tabsize=4'
alias tree='tree -C --gitignore'
set -o vi
export EDITOR=vi
export VIMINIT='set sw=0 ts=4 ai wc=<Tab> lcs=tab:»\ ,space:· hi=100'
