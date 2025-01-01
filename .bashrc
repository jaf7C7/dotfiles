# Do nothing if not interactive.
if [[ $- != *i* ]]; then
    return
fi

# Source system defaults if they exist.
if [[ -f /etc/bashrc ]]; then
    . /etc/bashrc
fi

# Source user functions.
for _ in ~/.bashrc.d/*.{sh,bash}; do
    test -f "$_" && . "$_"
done


# Shell variables (local to shell; not exported)

PS1="${INSIDE_EMACS+\[\e[34m\]\W\[\e[33m\]\$(__git_ps1)\[\e[m\] }\\\$ "
PROMPT_COMMAND='__prompt_command'
CDPATH=.:~:~/.config:~/.local:~/Projects
HISTFILESIZE=1000000
HISTSIZE=10000
HISTIGNORE='[fb]g*:%*'
HISTCONTROL=ignoreboth


# Environment variables (global; exported to subprocesses)

set -a

BIN=~/.local/bin
if [[ -d $BIN && $PATH != $BIN:* ]]; then
    PATH=$BIN:$PATH
fi
GIT_HOOKS=~/.config/git/hooks
TERMINAL_THEMES_DIR=~/.config/bash/themes
if [[ -n $INSIDE_EMACS ]]; then
    EDITOR=emacsclient
else
    EDITOR=$(command -v nano || command -v vi)
fi
EXINIT='set nocp tm=10 ul=0 bs= ai ci sw=0 hidden cpo+=n nosmd noru hl=8r,~i,@b,dn,eb,mb,Mb,nb,rb,sr,Ss,tn,cr,vr,wb,Wn,+r,=n | map!  '
LESSOPEN='||/usr/bin/lesspipe.sh %s'
NPM_CONFIG_PREFIX=~/.local
GOPATH=~/.local

set +a


# Shell options

shopt -s globstar                # Allow recursive globbing with '**'.
shopt -s extglob                 # Allow extended pattern matching.
shopt -s histappend              # Append to history file, don't overwrite.
shopt -s lithist                 # Preserve formatting of multiline commands in history.
shopt -s no_empty_cmd_completion # Don't try to complete empty lines.
shopt -s checkjobs               # Warn about background jobs when exiting the shell.


# TTY options

stty -ixon # Disable Ctrl-S pausing input.


# Shell aliases

alias args='i=0 ; for _ ; do printf "%4d %s\\n" $((++i)) "$_" ; done ; unset i'
alias cfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dash='PS1=dash\$\  dash'
alias diff='diff --color'
alias e=$EDITOR
alias emacs='emacsclient --alternate-editor=""'
alias grep='grep --color'
alias ls='ls --color'
alias open='xdg-open'
alias p='printf "%s\\n"'
alias sh='PS1=sh\$\  sh'
alias tree='tree --gitignore'
