# termctl.sh
#
# Functions for configuring the terminal via escape sequences.  Requires
# `allow-passthrough on` to be set for use in Tmux.
#
# Tmux passthrough sequence:
# https://github.com/tmux/tmux/wiki/FAQ#what-is-the-passthrough-escape-sequence-and-how-do-i-use-it
#
# Control sequences from `xterm(1)`:
# https://www.invisible-island.net/xterm/ctlseqs/ctlseqs.html

__tmux_passthrough() {
    # Works like `printf` but wraps sequence in tmux passthrough sequence.
    #
    # Example: __tmux_passthrough '\e[%d q' 1
    #
    # https://github.com/tmux/tmux/wiki/FAQ
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

__set_terminal_size() {
    # Usage: __set_terminal_size <lines> <columns>
    printf '\e[8;%d;%dt' "${1:?}" "${2:?}"
}

__set_terminal_title() {
    printf '\e]0;%s\a' "${1:?}"
}

__set_terminal_fg() {
    printf '\e]10;%s\a' "${1:?}"
}

__set_terminal_bg() {
    printf '\e]11;%s\a' "${1:?}"
}

__set_terminal_selection_fg() {
    printf '\e]19;%s\a' "${1:?}"
}

__set_terminal_selection_bg() {
    printf '\e]17;%s\a' "${1:?}"
}

__set_terminal_palette() {
    # Usage: __set_terminal_palette \
    #       0 '#000000' \
    #       1 '#ff0000' \
    #       2 '#00ff00' \
    #       ...
    printf '\e]4;%d;%s\a' "${@:?}"
}

__set_terminal_cursor_color() {
    printf '\e]12;%s\a' "${1:?}"
}

__set_terminal_cursor_style() {
    # 0  ⇒  blinking block.
    # 1  ⇒  blinking block (default).
    # 2  ⇒  steady block.
    # 3  ⇒  blinking underline.
    # 4  ⇒  steady underline.
    # 5  ⇒  blinking bar, xterm.
    # 6  ⇒  steady bar, xterm.
    printf '\e[%d q' "${1:?}"
}
