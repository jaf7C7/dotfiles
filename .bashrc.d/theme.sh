# Usage: theme <theme>
#
# Check the themes directory for available themes.
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


