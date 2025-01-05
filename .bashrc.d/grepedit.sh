# Usage: grep -n <regex> <file> [<file>...] | grepedit
#
# Parses output of `grep -n` and opens $EDITOR at each matching line.
#
# Required input format:
# 	<file_path>:<line_number>[:<line_text>]
#
grepedit() {
	while IFS=: read -r file line _
	do
		"$EDITOR" +"$line" "$file" </dev/tty || break
	done
}

