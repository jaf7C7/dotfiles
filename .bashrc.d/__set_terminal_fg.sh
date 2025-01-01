__set_terminal_fg() {
    printf '\033]10;%s\007' "${1:?}"
}
