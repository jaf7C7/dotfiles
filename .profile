# ~/.profile

_append_path()
{
	case $PATH in
	*:"$1") ;;
	*)
		PATH=${PATH}:${1}
	esac
}

_prepend_path()
{
	case $PATH in
	"$1":*) ;;
	*)
		PATH=${1}:${PATH}
	esac
}

_prepend_path ~/bin
_append_path ~/go/bin

unset _append_path _prepend_path

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
