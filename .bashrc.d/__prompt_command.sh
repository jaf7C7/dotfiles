# Usage: PROMPT_COMMAND='__prompt_command'
#
# Sets terminal title - e.g. `jfox@fedora:~/.config/bash (master)`.
#
__prompt_command() {
	if test -z "$INSIDE_EMACS"
	then
		__PWD="$PWD"
		case $__PWD in
		$HOME*)
			__PWD=\~${__PWD#$HOME}
		esac
		printf '\033]0;%s\007' "${USER}@${HOSTNAME}:${__PWD}$(__git_ps1)"
		unset __PWD
	fi
}
