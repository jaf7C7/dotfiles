[[ -f /etc/bashrc ]] && . /etc/bashrc

__set_theme ()
{
	# XTerm Escape Sequences:
	# https://invisible-island.net/xterm/ctlseqs/ctlseqs.html

	# Define 16-color palette. Accepts `#??????` or `rgb:/??/??/??`.
	# 'Linux console' palette from gnome-terminal
	printf '\033]4;%d;%s\007' \
		0 '#000000' \
		1 '#AA0000' \
		2 '#00AA00' \
		3 '#AA5500' \
		4 '#0000AA' \
		5 '#AA00AA' \
		6 '#00AAAA' \
		7 '#AAAAAA' \
		8 '#555555' \
		9 '#FF5555' \
		10 '#55FF55' \
		11 '#FFFF55' \
		12 '#5555FF' \
		13 '#FF55FF' \
		14 '#55FFFF' \
		15 '#FFFFFF'

	local fg='#000000'
	local bg='#ffffff'

	printf '\033]10;%s\007' "$fg"  # fg
	printf '\033]11;%s\007' "$bg"  # bg
	printf '\033[%d q' 1           # cursor type
	#printf '\033]12;%s\007' '#00ff00'  # cursor color
	printf '\033]17;%s\007' "$fg"  # selection fg
	printf '\033]19;%s\007' "$bg"  # selection bg
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
if [[ -d "$HOME/.local/bin" && "$PATH" != "$HOME/.local/bin":* ]]
then
	PATH="$HOME/.local/bin:$PATH"
fi

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
