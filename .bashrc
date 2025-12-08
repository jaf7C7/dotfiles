[[ $- == *i* ]] || return

export EDITOR='nano --zero --nohelp --syntax=none --autoindent --tabstospaces --tabsize=4 --breaklonglines --fill=79 --trimblanks'
export VIMINIT='
set compatible
set expandtab
set shiftwidth=4
set softtabstop=-1
set autoindent
set hidden
set autoread
set wildchar=<Tab>
set history=100
set formatprg=fmt\ -p\\\\#\\\ 
set more
set listchars=tab:»\ ,space:·
set t_Co=8
set background=dark
set highlight=vr,+ri,=rb,x-,Xr
'

PROMPT_COMMAND='printf "\e]0;${TERMINAL_TITLE:-${USER}@${HOSTNAME}: ${PWD/~/\~}}\a"'
PS1='\$ '
CDPATH=.:~:~/Projects:~/Documents

shopt -s checkjobs
shopt -s extglob
shopt -s globstar

alias cfg='git --git-dir=$HOME/.local/opt/dotfiles/ --work-tree=$HOME'
alias diff='diff --color=auto'
alias e='$EDITOR'
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
