# Usage: __set_terminal_palette \
#       0 '#000000' \
#       1 '#ff0000' \
#       2 '#00ff00' \
#       ...
__set_terminal_palette() {
	printf '\033]4;%d;%s\007' "${@:?}"
}
