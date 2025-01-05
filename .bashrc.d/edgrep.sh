# Usage: edgrep <regex> <file> [<file>...]
# Greps for matching lines, and opens ed on each file at the first match.
edgrep() {
	regex="$1"
	nl=$(printf '\n')
	while IFS="$nl" read -r f
	do
		test -n "$file" || set --
		file="$f"
		set -- "$@" "$file"
	done <<-EOF
	$(grep -l "$@")
	EOF
	case $EDITOR in
	nano*)
		$EDITOR +cr/"$regex" "$@"
		;;
	*)
		$EDITOR +/"$regex" "$@"
	esac
	unset nl file f regex
}
