export EDITOR=vi
export VIMINIT='set sw=0 ts=4 ai hidden wc=<Tab> lcs=tab:»\ ,space:· hi=100 more t_Co=8 bg=dark hl=vr,+ri,=rb,x-,Xr'
alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias nano='nano -bMr79 -xiT4'
alias ps1='if [[ -n $OLD_PS1 ]]; then PS1=$OLD_PS1; unset OLD_PS1; else OLD_PS1=$PS1; PS1="\[\e]0;\u@\h: \w\a\]\$ "; fi'
alias tree='tree -C --gitignore'
