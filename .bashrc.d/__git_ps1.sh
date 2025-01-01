# Usage: PS1='\w$(__git_ps1)\$ '
#
# A much simplified (and much quicker) version of the prompt which ships
# with `git`.
#
__git_ps1() {
	if ! git status -s >/dev/null 2>&1
	then
		return
	fi
	local current=$(git branch --show-current)
	if test -z "$current"
	then
		current=$(git rev-parse --short HEAD)
	fi
	printf ' (%s)' "$current"
}
