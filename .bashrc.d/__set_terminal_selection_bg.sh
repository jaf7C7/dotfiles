__set_terminal_selection_bg() {
    printf '\033]17;%s\007' "${1:?}"
}
