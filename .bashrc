# ~/.bashrc

for f in \
	/etc/bashrc \
	~/.git-completion.bash
do
	[[ -f $f ]] && . "$f"
done
unset f

CDPATH=.:~:~/projects

alias activate='source .venv/bin/activate'

kill-session ()
{
	# Kill login session on /dev/pts/<tty>
	for tty
	do
		kill $(lsof -wR /dev/pts/${tty} | awk 'NR==2{print $3}')
	done
	unset tty
}


check-git ()
{
	for dir in ~/{dotfiles,bin,notes,projects/*}
	do
		# If there are uncommitted changes
		if [[ -n ${status:=$(git -c color.ui=always -C "$dir" status -s)} ]]
		then
			printf '\e[01m%s\e[m\n%s\n' "$dir" "$status"
			unset status
		fi
	done
	unset dir
}
