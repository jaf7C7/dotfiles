# Usage: resize <width> <height>
#
# Resizes the terminal to the given dimensions.  Empty arguments will leave
# values unchanged. E.g.
#
#	 $ resize 80
#
resize() {
	read LINES COLUMNS < <(stty size)
	printf '\033[8;%d;%dt' "${2:-$LINES}" "${1:-$COLUMNS}"
}

