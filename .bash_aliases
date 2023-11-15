PROMPT_DIRTRIM=1
if test -z "$LESSOPEN" && command -v lesspipe &>/dev/null; then
	eval $(lesspipe)
	export LESS=-R
fi
shopt -s globstar failglob
alias args='printf "%s\n" "$@" | nl -w2 -ba -s\ '
