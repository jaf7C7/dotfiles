# ~/.bashrc

for f in \
	/etc/bashrc \
	~/.git-completion.bash
do
	[[ -f $f ]] && . "$f"
done
unset f

CDPATH=.:~:~/projects

check-git ()
{
	for dir in ~/{dotfiles,bin,notes,projects/*}
	do
		status=$(git -c color.ui=always -C "$dir" status -s)
		if [[ -n $status ]]
		then
			printf '\e[01m%s\e[m\n%s\n' "$dir" "$status"
		fi
		unset status
	done
	unset dir
}

post ()
{
	# Usage: `post -d '{"foo": 10, "bar": {"qux": 30}}'`
	curl -sH 'Content-Type: application/json' -X POST "$@"
}
