# ~/.bashrc

[[ $- == *i* ]] || return

source ~/dotfiles/git-prompt.sh

[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\[\e]0;\u@\h:\w$(__git_ps1 " (%s)")\a\]\$ '
HISTCONTROL=erasedups
CDPATH=.:~

shopt -s checkwinsize globstar failglob

alias args='for _; do printf "%3d  %s\n" $((i++)) "$_"; done; unset i'
alias diff='diff --color'
alias grep='grep --color'
alias ls='ls --color'
alias tree='tree -C'
