[[ -f /etc/bashrc ]] && . /etc/bashrc

# See section: 'Operating System Controls'
# https://www.xfree86.org/current/ctlseqs.html
__defcolor ()
{
	# Change color number $1 to rgb/hex value $2
	printf '\033]4;%d;%s\007' "$1" "$2"
}

__setbg ()
{
	# Change background to rgb/hex value $1
	printf '\033]11;%s\007' "$1"
}

__setfg ()
{
	# TODO: Change background to rgb/hex value $1
	printf '\033]10;%s\007' "$1"
}

set_theme ()
{
	# TODO: Find escape sequence to toggle 'use bright colors for bold'
	case "$1" in
	'dark')
		__setbg '#251800'
		__setfg '#CB8600'
		__defcolor 0 '#555555'
		__defcolor 1 '#FF5555'
		__defcolor 2 '#55FF55'
		__defcolor 3 '#FFFF55'
		__defcolor 4 '#5555FF'
		__defcolor 5 '#FF55FF'
		__defcolor 6 '#55FFFF'
		__defcolor 7 '#FFFFFF'
		export VIMINIT='so ~/.vimrc | set termguicolors'
		;;
	'light')
		__setbg '#ffffff'
		__setfg '#000000'
		__defcolor 0 '#000000'
		__defcolor 1 '#AA0000'
		__defcolor 2 '#00AA00'
		__defcolor 3 '#AA5500'
		__defcolor 4 '#0000AA'
		__defcolor 5 '#AA00AA'
		__defcolor 6 '#00AAAA'
		__defcolor 7 '#AAAAAA'
		unset VIMINIT
	esac
}

set_theme 'light'

__git_ps1 ()
{
	command -v git &>/dev/null || return
	if git status -s &>/dev/null
	then
		printf ' (%s)' "$(git branch --show-current)"
		# TODO: Display 'rebasing...' if currently rebasing
	fi
}

PS1='\$ '
PROMPT_COMMAND='printf "\e]0;%s\a" "${USER}@${HOSTNAME}:${PWD//$HOME/\~}$(__git_ps1)"'
export EDITOR='vi'

alias ls='ls --color'
alias grep='grep --color'
alias diff='diff --color'
alias open='xdg-open'
if [[ $OS == 'Windows_NT' ]]
then
	alias python='winpty python'
	alias node='winpty node'
	alias gh='winpty gh'
fi

stty -ixon  # Disable Ctrl-S pausing input
stty werase '^H'  # Make Ctrl-Backspace delete previous word
