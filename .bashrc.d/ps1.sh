ps1() {
	case $PS1 in
	'\$ ')
		PS1="\[\e[32m\]\u@\h\[\e[m\]:\[\e[34m\]\w\[\e[33m\]\$(__git_ps1)\[\e[m\]\n\$ "
		;;
	*)
		PS1='\$ '
	esac
}
