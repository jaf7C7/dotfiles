# Usage: resize <height> <width>
resize() {
	read -r LINES COLUMNS <<-EOF
	$(stty size)
	EOF
	__set_terminal_size "${1:-$LINES}" "${2:-COLUMNS}"
}
