[[ $- == *i* ]] || return

export EDITOR=vi
export VIMINIT='set compatible expandtab shiftwidth=4 softtabstop=-1 autoindent hidden autoread wildchar=<Tab> history=100 formatprg=fmt\ -p\\\\#\\\  more listchars=tab:»\ ,space:· t_Co=8 background=dark highlight=vr,+ri,=rb,x-,Xr'

PROMPT_COMMAND='printf "\e]0;${TERMINAL_TITLE:-${USER}@${HOSTNAME}: ${PWD/~/\~}}\a"'
PS1='\$ '
CDPATH=.:~:~/Projects:~/Documents

shopt -s checkjobs
shopt -s extglob
shopt -s globstar

alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias tree='tree -C --gitignore'

. /etc/bash_completion

project() {
    bash --rcfile ~/Projects/"$1"/.bashrc
}

_project() {
    # Glob for matching project directories which contain a `.bashrc` file.
    set -- ~/Projects/${2}*/.bashrc

    # Check at least one real path has been matched and we aren't going
    # to complete a unexpanded glob.
    test -f "$1" || set --

    # For each match, remove the beginning and end of the path to leave
    # just the directory/project name.
    set -- "${@#~/Projects/}"
    set -- "${@%/.bashrc}"

    COMPREPLY=("$@")
}

complete -F _project project
