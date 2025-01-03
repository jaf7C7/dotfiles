__set_terminal_bold_color() {
	printf '\033]5;0;%s\007' "$1"
}
