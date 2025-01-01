__set_terminal_selection_fg() {
	printf '\033]19;%s\007' "${1:?}"
}
