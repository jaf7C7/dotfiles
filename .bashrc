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
if [[ $OS == 'Windows_NT' ]]
then
	alias python='winpty python'
	alias node='winpty node'
	alias gh='winpty gh'
fi
stty -ixon  # Disable Ctrl-S pausing input
stty werase '^H'  # Make Ctrl-Backspace delete previous word
