# termctl
#
# Shell functions for controlling the terminal.
#
# Control sequences from xterm:
# https://www.invisible-island.net/xterm/ctlseqs/ctlseqs.html

# Usage: resize <height> <width>
#
# Resizes the terminal to the given dimensions.  Empty arguments will leave
# values unchanged.
#
resize() {
	read -r LINES COLUMNS <<-EOF
	$(stty size)
	EOF
	__set_terminal_size "${1:-$LINES}" "${2:-$COLUMNS}"
}

# Usage: title <title>
#        title (-u|--unset)
#
# Redefines `PROMPT_COMMAND` to set the terminal title to <title>.  The old
# value is saved, and can be restored with `-u` or `--unset`.
#
title() {
	case $1 in
	-u | --unset)
		PROMPT_COMMAND=$__OLD_PROMPT_COMMAND
		unset __OLD_PROMPT_COMMAND
		;;
	*)
		__OLD_PROMPT_COMMAND=$PROMPT_COMMAND
		PROMPT_COMMAND="__set_terminal_title \"$1\""
	esac
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
