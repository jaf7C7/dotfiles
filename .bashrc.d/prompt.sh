# Usage: ps1
#
# Toggles the PS1 prompt between the short and long versions.
#
ps1() {
	case $PS1 in
	'\$ ')
		PS1="\[\e[32m\]\u@\h\[\e[m\]:\[\e[34m\]\w\[\e[33m\]\$(__git_ps1)\[\e[m\]\n\$ "
		;;
	*)
		PS1='\$ '
	esac
}

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
