__set_terminal_bg() {
	printf '\033]11;%s\007' "${1:?}"
}
