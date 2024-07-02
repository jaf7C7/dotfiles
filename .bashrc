__git_ps1 ()
{
	command -v git &>/dev/null || return
	if git status -s &>/dev/null
	then
		printf ' (%s)' "$(git branch --show-current)"
		# TODO: Display 'rebasing...' if currently rebasing
	fi
}
PS1='\[\e]0;\u@\h:\w$(__git_ps1)\a\]\$ '  # Prompt sets terminal title
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
