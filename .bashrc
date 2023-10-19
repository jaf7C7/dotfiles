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
		# If there are uncommitted changes
		if [[ -n ${status:=$(git -c color.ui=always -C "$dir" status -s)} ]]
		then
			printf '\e[01m%s\e[m\n%s\n' "$dir" "$status"
			unset status
		fi
	done
	unset dir
}
