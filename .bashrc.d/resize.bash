# Usage: resize <height> <width>
#
# Resizes the terminal to the given dimensions.  Empty arguments will leave
# values unchanged.
#
resize() {
	read -r LINES COLUMNS <<-EOF
		$(stty size)
	EOF
	printf '\033[8;%d;%dt' "${1:-$LINES}" "${2:-$COLUMNS}"
}

