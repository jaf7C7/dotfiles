[[ -f /etc/bashrc ]] && . /etc/bashrc

__set_theme ()
{
	# XTerm Escape Sequences:
	# https://invisible-island.net/xterm/ctlseqs/ctlseqs.html

	# linux_console theme copied from gnome-terminal
	local -a linux_console=(
		'#000000'
		'#AA0000'
		'#00AA00'
		'#AA5500'
		'#0000AA'
		'#AA00AA'
		'#00AAAA'
		'#AAAAAA'
		'#555555'
		'#FF5555'
		'#55FF55'
		'#FFFF55'
		'#5555FF'
		'#FF55FF'
		'#55FFFF'
		'#FFFFFF'
	)

	local i=0
	local color
	for color in "${linux_console[@]}"
	do
		# Define 16-color palette. Accepts `#??????` or `rgb:/??/??/??`.
		printf '\033]4;%d;%s\007' "$((i++))" "$color"
	done

	local fg='#000000'
	local bg='#ffffff'

	# Set foreground
	printf '\033]10;%s\007' "$fg"
	# Set background
	printf '\033]11;%s\007' "$bg"

	# Set cursor type (1=blinking block)
	printf '\033[%d q' 1
	# Set cursor color
	#printf '\033]12;%s\007' '#00ff00'

	# Set highlight foreground
	printf '\033]17;%s\007' "$fg"
	# Set highlight background
	printf '\033]19;%s\007' "$bg"
}

resize ()
{
	# Resize window to <cols>x<rows> (default 80x43)
	printf '\033[8;%d;%dt' "${2:-43}" "${1:-80}"
}

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

# Disable Ctrl-S pausing input.
stty -ixon

# Make Ctrl-Backspace delete previous word, depending on the terminal's
# default setting.
if ! stty -a | grep -q '; erase = ^H;'
then
	stty werase '^H'
else
	stty werase '^?'
fi
__set_theme
