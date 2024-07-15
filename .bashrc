[[ -f /etc/bashrc ]] && . /etc/bashrc
__git_ps1 ()
{
	command -v git &>/dev/null || return
	if git status -s &>/dev/null
	then
		printf ' (%s)' "$(git branch --show-current)"
		# TODO: Display 'rebasing...' if currently rebasing
	fi
}
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

# See section: 'Operating System Controls'
# https://www.xfree86.org/current/ctlseqs.html
defcolor ()
{
	# Change color number $1 to rgb/hex value $2
	printf '\033]4;%d;%s\007' "$1" "$2"
}

setbg ()
{
	# Change background to rgb/hex value $1
	printf '\033]11;%s\007' "$1"
}

setfg ()
{
	# Change background to rgb/hex value $1
	printf '\033]10;%s\007' "$1"
}
