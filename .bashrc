[[ -f /etc/bashrc ]] && . /etc/bashrc

theme ()
{
	case "$1" in
	'vga'|'')
		export TERMINAL_THEME='vga'

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

		local fg="$color7"
		local bg="$color0"
		;;
	'clean')
		export TERMINAL_THEME='clean'

		# 'XTerm' palette from gnome-terminal
		local color0='#000000'
		local color1='#CD0000'
		local color2='#00CD00'
		local color3='#CDCD00'
		local color4='#0000EE'
		local color5='#CD00CD'
		local color6='#00CDCD'
		local color7='#E5E5E5'
		local color8='#7F7F7F'
		local color9='#FF0000'
		local color10='#00FF00'
		local color11='#FFFF00'
		local color12='#5C5CFF'
		local color13='#FF00FF'
		local color14='#00FFFF'
		local color15='#FFFFFF'

		local fg="$color0"
		local bg="$color15"
		;;
	'solarized')
		# https://github.com/altercation/solarized/blob/master/xresources/solarized
		local base03='#002b36'  # official
		# local base03='#002833'  # darker bg (https://github.com/zyedidia/micro/blob/d173e527acc3b08060cbb6d2d72f6f7098c29ff4/runtime/colorschemes/solarized-tc.micro)
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

		local color0="$base02"
		local color1="$red"
		local color2="$green"
		local color3="$yellow"
		local color4="$blue"
		local color5="$magenta"
		local color6="$cyan"
		local color7="$base0"
		local color8="$base03"
		local color9="$orange"
		local color10="$base01"
		local color11="$base00"
		local color12="$base0"
		local color13="$violet"
		local color14="$base1"
		local color15="$base3"

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
		*)
			echo "Unknown theme: '$*'" >&2
			return 1
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
			local bg='#1d2021'  # hard contrast
			#local bg='#32302f'  # soft contrast
			#local bg='#282828'  # normal contrast
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
		*)
			echo "Unknown theme: '$*'" >&2
			return 1
		esac
		;;
	'nord')
		export TERMINAL_THEME='nord'

		# https://github.com/nordtheme/xresources/blob/develop/src/nord
		local nord0='#2E3440'
		local nord1='#3B4252'
		local nord2='#434C5E'
		local nord3='#4C566A'
		local nord4='#D8DEE9'
		local nord5='#E5E9F0'
		local nord6='#ECEFF4'
		local nord7='#8FBCBB'
		local nord8='#88C0D0'
		local nord9='#81A1C1'
		local nord10='#5E81AC'
		local nord11='#BF616A'
		local nord12='#D08770'
		local nord13='#EBCB8B'
		local nord14='#A3BE8C'
		local nord15='#B48EAD'

		local color0="$nord1"
		local color1="$nord11"
		local color2="$nord14"
		local color3="$nord13"
		local color4="$nord9"
		local color5="$nord15"
		local color6="$nord8"
		local color7="$nord5"
		local color8="$nord3"
		local color9="$nord11"
		local color10="$nord14"
		local color11="$nord13"
		local color12="$nord9"
		local color13="$nord15"
		local color14="$nord7"
		local color15="$nord6"

		local fg="$nord4"
		local bg="$nord0"
		;;
	*)
		echo "Unknown theme: '$*'" >&2
		return 1
	esac

	# Control seqs. from:
	# https://invisible-island.net/xterm/ctlseqs/ctlseqs.html

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
	# Usage: resize <cols> <rows> (default 80x43)
	printf '\033[8;%d;%dt' "${2:-43}" "${1:-80}"
}

bconv ()
{
	# Usage: bconv <input base> <output base> <number>
	printf 'obase=%d; ibase=%d; %s\n' "$2" "$1" "${3@U}" | bc
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

# TODO: Make terminal title more informative (use bash PS1 escapes)
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

theme solarized
