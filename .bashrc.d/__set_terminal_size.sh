# Usage: __set_terminal_size <height-in-chars> <width-in-chars>
#
__set_terminal_size() {
	printf '\033[8;%d;%dt' "$1" "$2"
}
