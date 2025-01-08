# https://github.com/git/git/blob/master/Documentation/CodingGuidelines

# Do nothing if not interactive.
if [[ $- != *i* ]]
then
	return
fi

# Source completion scripts and user functions.
for _ in /etc/bash_completion{,.d/*} ~/.bashrc.d/*
do
	test -f "$_" && . "$_"
done


# Shell variables (local to shell; not exported)

PS1='\$ '
PROMPT_COMMAND='__prompt_command'
CDPATH=.:~:~/.config:~/.local:~/Projects
HISTFILESIZE=1000000
HISTSIZE=10000
HISTIGNORE='[fb]g*:%*'
HISTCONTROL=ignoreboth


# Environment variables (global; exported to subprocesses)

set -a

if [[ -d ~/.local/bin && $PATH != ~/.local/bin:* ]]
then
	PATH=~/.local/bin:$PATH
fi
EDITOR=nano
GIT_HOOKS=~/.config/git/hooks
LESSOPEN='||/usr/bin/lesspipe %s'
NPM_CONFIG_PREFIX=~/.local
GOPATH=~/.local

set +a


# Shell options

shopt -s globstar  # Allow recursive globbing with '**'.
shopt -s extglob  # Allow extended pattern matching.
shopt -s histappend  # Append to history file, don't overwrite.
# XXX: Instead of this, try using readline's `operate-and-get-next
# command:  Scroll back in your history using `↑` or `"\C-n"`, then
# press `"\C-o"` to execute the current history line and load the next
# one for editing.
#shopt -s lithist  # Preserve formatting of multiline commands in history.
shopt -s no_empty_cmd_completion  # Don't try to complete empty lines.
shopt -s checkjobs  # Warn about background jobs when exiting the shell.


# TTY options

stty -ixon # Disable Ctrl-S pausing input.


# Shell aliases

alias args='i=0 ; for _ ; do printf "%4d %s\\n" $((++i)) "$_" ; done ; unset i'
alias cfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias diff='diff --color'
alias grep='grep --color'
alias ls='ls --color'
alias open='xdg-open'
alias sh='PS1=sh\$\  sh'
alias tree='tree --gitignore'
