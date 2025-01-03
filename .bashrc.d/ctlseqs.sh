# ctlseqs.sh
#
# Shell functions to implement some of the xterm control sequences.
#
# https://www.invisible-island.net/xterm/ctlseqs/ctlseqs.html
#
__set_terminal_fg() {
	printf '\033]10;%s\007' "${1:?}"
}

__set_terminal_bg() {
	printf '\033]11;%s\007' "${1:?}"
}

__set_terminal_bold_color() {
	printf '\033]5;0;%s\007' "$1"
}

__set_terminal_selection_bg() {
	printf '\033]17;%s\007' "${1:?}"
}

__set_terminal_selection_fg() {
	printf '\033]19;%s\007' "${1:?}"
}

# Usage: __set_terminal_palette \
#       0 '#000000' \
#       1 '#ff0000' \
#       2 '#00ff00' \
#       ...
__set_terminal_palette() {
	printf '\033]4;%d;%s\007' "${@:?}"
}

# Usage: __set_terminal_size <height-in-chars> <width-in-chars>
__set_terminal_size() {
	printf '\033[8;%d;%dt' "$1" "$2"
}

__set_terminal_title() {
	printf '\033]0;%s\007' "$1"
}

# Usage: __tmux_passthrough <format> <args>...
#
# Works like `printf` but wraps sequence in tmux passthrough sequence.
# Example:
#	__tmux_passthrough '\033[%d q' 1
#
# See: https://github.com/tmux/tmux/wiki/FAQ
__tmux_passthrough() {
	printf "${@:?}" | awk '
		BEGIN {
			print("\033Ptmux;")
		}
		{
			gsub("\033", "\033\033")
			print($0)
		}
		END {
			print("\033\\")
		}
	'
}

