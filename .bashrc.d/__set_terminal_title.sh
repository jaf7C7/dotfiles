__set_terminal_title() {
	printf '\033]0;%s\007' "$1"
}
