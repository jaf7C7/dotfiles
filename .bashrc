# ~/.bashrc

[[ $- == *i* ]] || return

PS1='\[\e]0;\u@\h:\w$(__git_ps1 " (%s)")\a\]\$ '
HISTCONTROL=erasedups

shopt -s checkwinsize globstar failglob

alias args='for arg; do printf "%3d %s\n" $((i++)) "$arg"; done; unset i args'
alias diff='diff --color'
alias grep='grep --color'
alias ls='ls --color'
alias tree='tree -C'

[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

command -v __git_ps1 &>/dev/null || {
    [[ -e /usr/lib/git-core/git-sh-prompt ]] &&
    . /usr/lib/git-core/git-sh-prompt
}
