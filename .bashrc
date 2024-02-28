# ~/.bashrc

[[ $- == *i* ]] || return

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
PS1='\[\e]0;\u@\h:\w$(__git_ps1 " (%s)")\a\]\$ '

shopt -s histappend checkwinsize globstar failglob

alias ls='ls --color'
alias grep='grep --color'
alias tree='tree -C'
alias args='printf "%s\n" "$@" | nl'
alias diff='diff --color'

[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

command -v __git_ps1 &>/dev/null || {
    [[ -e /usr/lib/git-core/git-sh-prompt ]] && . /usr/lib/git-core/git-sh-prompt
}
