# Usage: nanogrep <regex> <file> [<file>...]
# Greps for matching lines, and opens nano on each file at the first match.
nanogrep() {
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
	nano +cr/"$regex" "$@"
	unset nl file f regex
}
