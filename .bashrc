# XTerm control seqs: https://invisible-island.net/xterm/ctlseqs/ctlseqs.html

[[ -f /etc/bashrc ]] && . /etc/bashrc

theme ()
{
	case "$1" in
	'linux'|'')
		# 'Linux console' palette from gnome-terminal

		local color0='#000000'
		local color1='#AA0000'
		local color2='#00AA00'
		local color3='#AA5500'
		local color4='#0000AA'
		local color5='#AA00AA'
		local color6='#00AAAA'
		local color7='#AAAAAA'
		local color8='#555555'
		local color9='#FF5555'
		local color10='#55FF55'
		local color11='#FFFF55'
		local color12='#5555FF'
		local color13='#FF55FF'
		local color14='#55FFFF'
		local color15='#FFFFFF'

		case "$2" in
		'dark'|'')
			export TERMINAL_THEME='linux-dark'
			local fg="$color7"
			local bg="$color0"
			;;
		'light')
			export TERMINAL_THEME='linux-light'
			local fg="$color0"
			local bg="$color15"
			;;
		esac
		;;
	'solarized')
		# https://github.com/solarized/xresources

		local color0='#073642'
		local color1='#dc322f'
		local color2='#859900'
		local color3='#b58900'
		local color4='#268bd2'
		local color5='#d33682'
		local color6='#2aa198'
		local color7='#eee8d5'
		local color8='#002b36'
		local color9='#cb4b16'
		local color10='#586e75'
		local color11='#657b83'
		local color12='#839496'
		local color13='#6c71c4'
		local color14='#93a1a1'
		local color15='#fdf6e3'

		case "$2" in
		'dark'|'')
			export TERMINAL_THEME='solarized-dark'
			local bg="$color8"
			local fg="$color12"
			;;
		'light')
			export TERMINAL_THEME='solarized-light'
			local bg="$color15"
			local fg="$color11"
			;;
		esac
		;;
	'gruvbox')
		# https://github.com/morhetz/gruvbox-contrib/tree/master/xresources
		case "$2" in
		'dark'|'')
			export TERMINAL_THEME='gruvbox-dark'
			local color0='#282828'
			local color1='#cc241d'
			local color2='#98971a'
			local color3='#d79921'
			local color4='#458588'
			local color5='#b16286'
			local color6='#689d6a'
			local color7='#a89984'
			local color8='#928374'
			local color9='#fb4934'
			local color10='#b8bb26'
			local color11='#fabd2f'
			local color12='#83a598'
			local color13='#d3869b'
			local color14='#8ec07c'
			local color15='#ebdbb2'
			#local bg='#1d2021'  # hard contrast
			#local bg='#32302f'  # soft contrast
			local bg='#282828'  # normal contrast
			local fg='#ebdbb2'
			;;
		'light')
			export TERMINAL_THEME='gruvbox-light'
			local color0='#fdf4c1'
			local color1='#cc241d'
			local color2='#98971a'
			local color3='#d79921'
			local color4='#458588'
			local color5='#b16286'
			local color6='#689d6a'
			local color7='#7c6f64'
			local color8='#928374'
			local color9='#9d0006'
			local color10='#79740e'
			local color11='#b57614'
			local color12='#076678'
			local color13='#8f3f71'
			local color14='#427b58'
			local color15='#3c3836'
			#local bg='#f9f5d7'  # hard contrast
			#local bg='#f2e5bc'  # soft contrast
			local bg='#fbf1c7'  # normal contrast
			local fg='#3c3836'
			;;
		esac
		;;
	esac

	# Define 16-color palette
	printf '\033]4;%d;%s\007' \
		0 "$color0" \
		1 "$color1" \
		2 "$color2" \
		3 "$color3" \
		4 "$color4" \
		5 "$color5" \
		6 "$color6" \
		7 "$color7" \
		8 "$color8" \
		9 "$color9" \
		10 "$color10" \
		11 "$color11" \
		12 "$color12" \
		13 "$color13" \
		14 "$color14" \
		15 "$color15"

	printf '\033]10;%s\007' "$fg"  # Text fg
	printf '\033]11;%s\007' "$bg"  # Text bg
	printf '\033]17;%s\007' "$fg"  # Selection fg
	printf '\033]19;%s\007' "$bg"  # Selection bg
	printf '\033[%d q' 1           # Cursor type (1=blinking block)
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

theme linux light
