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
