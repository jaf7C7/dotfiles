# Usage: grepedit TODO *.py
#
# Opens $EDITOR at each matching line.
#
grepedit() {
	grep -n "$@" |
	while IFS=: read -r file line _
	do
		"$EDITOR" +"$line" "$file" </dev/tty || break
	done
}

