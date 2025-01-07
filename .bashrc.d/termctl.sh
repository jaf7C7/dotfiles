# termctl
#
# Shell functions for controlling the terminal.
#
# Control sequences from xterm:
# https://www.invisible-island.net/xterm/ctlseqs/ctlseqs.html

# Usage: resize <height> <width>
#        resize ((s|small)|(t|tall)|(l|large))
#
# Resizes the terminal to the given dimensions.
#
resize() {
	read -r LINES COLUMNS <<-EOF
	$(stty size)
	EOF
	case $1 in
	s|small)
		set -- 24 80
		;;
	t|tall)
		set -- 43 80
		;;
	l|large)
		set -- 43 132
		;;
	esac
	__set_terminal_size "${1:-$LINES}" "${2:-$COLUMNS}"
}

# Usage: theme <theme>
#
# Sets the terminal color scheme.  Check the themes directory for
# available themes.
#
theme() {
	if ! test -r "$HOME/.bashrc.d/themes/$1.sh"
	then
		echo "Unknown theme: $1" >&2
		return 1
	fi

	. "$HOME/.bashrc.d/themes/$1.sh"

	__set_terminal_fg "${fg?}"
	__set_terminal_bg "${bg?}"
	__set_terminal_bold_fg "${bold_fg?}"
	__set_terminal_selection_fg "${selection_fg?}"
	__set_terminal_selection_bg "${selection_bg?}"
	__set_terminal_palette \
		0 "${color0?}" \
		1 "${color1?}" \
		2 "${color2?}" \
		3 "${color3?}" \
		4 "${color4?}" \
		5 "${color5?}" \
		5 "${color5?}" \
		6 "${color6?}" \
		7 "${color7?}" \
		8 "${color8?}" \
		9 "${color9?}" \
		10 "${color10?}" \
		11 "${color11?}" \
		12 "${color12?}" \
		13 "${color13?}" \
		14 "${color14?}" \
		15 "${color15?}"

	unset fg bg selection_fg selection_bg \
		color0 color1 color2 color3 \
		color4 color5 color6 color7 \
		color8 color9 color10 color11 \
		color12 color13 color14 color15
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

__set_terminal_fg() {
	printf '\033]10;%s\007' "${1:?}"
}

__set_terminal_bg() {
	printf '\033]11;%s\007' "${1:?}"
}

__set_terminal_bold_fg() {
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
