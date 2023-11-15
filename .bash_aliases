PROMPT_DIRTRIM=1
test -n "$LESSOPEN" && export LESS='-R'
shopt -s globstar failglob
alias args='printf "%s\n" "$@" | nl -w2 -ba -s\ '
