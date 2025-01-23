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
		;;
	esac
}

# Usage: PROMPT_COMMAND='__prompt_command'
#
# Sets terminal title to current directory, e.g.: `~/.bashrc.d`
#
__prompt_command() {
	printf '\033]0;%s\007' "${PWD//~/\~}$(__git_ps1)"
}

# Usage: PS1='\w$(__git_ps1)\$ '
#
# A much simplified (and much quicker) version of the prompt which ships
# with `git`.
#
__git_ps1() {
	if ! git status -s >/dev/null 2>&1; then
		return
	fi
	local current=$(git branch --show-current)
	if [[ -z $current ]]; then
		current=$(git rev-parse --short HEAD)
	fi
	printf ' (%s)' "$current"
}
