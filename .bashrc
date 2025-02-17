# Do nothing if not interactive
[[ $- == *i* ]] || return

# Source completion functions
for _ in /etc/bash_completion{,.d/*}; do
	[[ -f $_ ]] && source "$_"
done

# Environment variables (global - exported to subprocesses)

: ~/.local/bin:
export PATH="${_}${PATH#${_}}"
export GIT_HOOKS=~/.config/git/hooks
export NPM_CONFIG_PREFIX=~/.local
export GOPATH=~/.local
export VERSION_CONTROL='never' # Stop GNU indent making backup files

# Shell variables (local to shell - not exported)

PS1='${PROMPT_LONG+\[\e[1;32m\]\u@\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\]}\$ '
PROMPT_COMMAND='printf "\e]0;%s\a" "${TERMINAL_TITLE:-${USER}@${HOSTNAME}:${PWD//~/\~}$(__git_ps1)}"'
HISTCONTROL='ignoreboth'
HISTIGNORE='[fb]g:%*:ls:jobs:clear'

# Shell aliases

alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias diff='diff --color'
alias grep='grep --color'
alias ls='ls --color'
alias tree='tree -C --gitignore'

# Readline bindings

bind '"\C-h": backward-kill-word'  # Ctrl-backspace
bind '"\e[A": history-search-backward' # ↑
bind '"\e[B": history-search-forward'  # ↓
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'
bind '"\e[5~": beginning-of-history'  # PgUp
bind '"\e[6~": end-of-history'  # PgDn
