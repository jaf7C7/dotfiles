# ~/.profile

set -a	# Export all variables assigned

case $PATH in
~/bin:*) ;;
*)
	PATH=~/bin:$PATH
esac
EDITOR=vi

set +a	# End of exports

if tmux has-session 2>/dev/null; then
	s=$(tmux ls)
	case $s in
	*attached*)
		printf '\033[32m' ;;
	*)
		printf '\033[33m'
	esac
	printf '%s\033[0m\n' "$s"
	unset s
fi

case $SHELL in
*bash)
	test -f ~/.bashrc && . ~/.bashrc
esac
