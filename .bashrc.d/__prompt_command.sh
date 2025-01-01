# Usage: PROMPT_COMMAND='__prompt_command'
#
# Sets terminal title - e.g. `jfox@fedora:~/.config/bash (master)`.
#
__prompt_command() {
	if test -z "$INSIDE_EMACS"
	then
		case $PWD in
		$HOME*)
			PWD=\~${PWD#$HOME}
		esac
		printf '\033]0;%s\007' "${USER}@${HOSTNAME}:${PWD}$(__git_ps1)"
	fi
}
