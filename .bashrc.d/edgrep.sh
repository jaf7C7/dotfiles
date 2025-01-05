# Usage: edgrep <regex> <file> [<file>...]
# Greps for matching lines, and opens ed on each file at the first match.
edgrep() {
	regex="$1"
	nl=$(printf '\n')
	command exec 0<<-EOF
	$(grep -l "$@")
	EOF
	set --
	while IFS="$nl" read -r file
	do
		set -- "$@" "$file"
	done
	command exec 0<&1
	case $EDITOR in
	nano*)
		$EDITOR +cr/"$regex" "$@"
		;;
	*)
		$EDITOR +/"$regex" "$@"
	esac
	unset nl file f regex
}
