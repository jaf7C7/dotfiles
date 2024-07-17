# XTerm control seqs: https://invisible-island.net/xterm/ctlseqs/ctlseqs.html

[[ -f /etc/bashrc ]] && . /etc/bashrc

__linux_console ()
{
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
	printf '\033]17;%s\007' "$fg"  # selection fg
	printf '\033]19;%s\007' "$bg"  # selection bg
	printf '\033[%d q' 1           # cursor type (1=blinking block)
}

solarized ()
{
	# https://github.com/solarized/xresources/blob/master/Xresources.dark

	local base03='#002b36'
	local base02='#073642'
	local base01='#586e75'
	local base00='#657b83'
	local base0='#839496'
	local base1='#93a1a1'
	local base2='#eee8d5'
	local base3='#fdf6e3'

	local yellow='#b58900'
	local orange='#cb4b16'
	local red='#dc322f'
	local magenta='#d33682'
	local violet='#6c71c4'
	local blue='#268bd2'
	local cyan='#2aa198'
	local green='#859900'

	case "$1" in
	'dark')
		local bg="$base03"
		local fg="$base0"
		;;
	'light')
		local bg="$base3"
		local fg="$base00"
		;;
	esac

	printf '\033]4;%d;%s\007' \
		0 "$base02" \
		1 "$red" \
		2 "$green" \
		3 "$yellow" \
		4 "$blue" \
		5 "$magenta" \
		6 "$cyan" \
		7 "$base2" \
		8 "$base03" \
		9 "$orange" \
		10 "$base01" \
		11 "$base00" \
		12 "$base0" \
		13 "$violet" \
		14 "$base1" \
		15 "$base3"

	printf '\033]10;%s\007' "$fg"  # fg
	printf '\033]11;%s\007' "$bg"  # bg
	printf '\033]17;%s\007' "$fg"  # selection fg
	printf '\033]19;%s\007' "$bg"  # selection bg
	printf '\033[%d q' 1           # cursor type (1=blinking block)
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
