# Do nothing if not interactive.
if [[ $- != *i* ]]; then
	return
fi

# Source completion scripts and user functions.
for _ in /etc/bash_completion{,.d/*} ~/.bashrc.d/*; do
	test -f "$_" && . "$_"
done

# Shell variables (local to shell; not exported)

PS1='\$ '
if command -v __prompt_command &>/dev/null; then
	PROMPT_COMMAND='__prompt_command'
fi
CDPATH=.:~:~/.config:~/.local:~/Projects
HISTFILESIZE=1000000
HISTSIZE=10000
HISTIGNORE='[fb]g*:%*'
HISTCONTROL=ignoreboth

# Environment variables (global; exported to subprocesses)

if [[ -d ~/.local/bin && $PATH != ~/.local/bin:* ]]; then
	export PATH=~/.local/bin:$PATH
fi
export EDITOR=nano
export GIT_HOOKS=~/.config/git/hooks
export NPM_CONFIG_PREFIX=~/.local
export GOPATH=~/.local
command -v lessfile &>/dev/null && eval "$(lessfile)"

# Shell options

shopt -s checkjobs
shopt -s extdebug
shopt -s extglob
shopt -s globstar
shopt -s histappend
shopt -s no_empty_cmd_completion

# TTY options

stty -ixon # Disable Ctrl-S pausing input.

# Shell aliases

alias +='wl-paste --primary'
alias args='i=0 ; for _ ; do printf "%4d %s\\n" $((++i)) "$_" ; done ; unset i'
alias cfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias diff='diff --color'
alias grep='grep --color'
alias ls='ls --color'
alias open='xdg-open'
alias sh='PS1="sh\$ " sh'
alias tree='tree -C --gitignore'
