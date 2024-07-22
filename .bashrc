[[ -f /etc/bashrc ]] && . /etc/bashrc

theme ()
{
	case "$1" in
	'clean'|'vga'|'')
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

		case "$1" in
		'clean'|'')
			export TERMINAL_THEME='clean'
			local fg="$color0"
			local bg="$color15"
			;;
		'vga')
			export TERMINAL_THEME='vga'
			local fg="$color7"
			local bg="$color0"
			;;
		esac
		;;
	'solarized')
		# https://github.com/altercation/solarized
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

		local color1="$red"
		local color2="$green"
		local color3="$yellow"
		local color4="$blue"
		local color5="$magenta"
		local color6="$cyan"
		local color9="$orange"
		local color13="$violet"

		case "$2" in
		'dark'|'')
			export TERMINAL_THEME='solarized-dark'
			local color0="$base03"
			local color7="$base0"
			local color8="$base01"
			local color10="$base02"
			local color11="$base00"
			local color12="$base1"
			local color14="$base2"
			local color15="$base3"
			local fg="$base0"
			local bg="$base03"
			local bold="$base1"
			;;
		'light')
			export TERMINAL_THEME='solarized-light'
			local color0="$base3"
			local color7="$base00"
			local color8="$base1"
			local color10="$base2"
			local color11="$base0"
			local color12="$base01"
			local color14="$base02"
			local color15="$base03"
			local fg="$base00"
			local bg="$base3"
			local bold="$base01"
			;;
		*)
			echo "Unknown theme: '$*'" >&2
			return 1
		esac
		;;
	'gruvbox')
		# https://github.com/morhetz
		local black0='#282828'
		local black1='#3c3836'
		local black3='#665c54'
		local black4='#7c6f64'
		local red='#9d0006'
		local green='#79740e'
		local yellow='#b57614'
		local orange='#af3a03'
		local blue='#076678'
		local purple='#8f3f71'
		local aqua='#427b58'
		local gray='#928374'
		local brightred='#fb4934'
		local brightgreen='#b8bb26'
		local brightyellow='#fabd2f'
		local brightorange='#fe8019'
		local brightblue='#83a598'
		local brightpurple='#d3869b'
		local brightaqua='#8ec07c'
		local white0='#fbf1c7'
		local white1='#ebdbb2'
		local white3='#bdae93'
		local white4='#a89984'

		case "$2" in
		'dark'|'')
			export TERMINAL_THEME='gruvbox-dark'
			local color0="$black0"
			local color1="$brightred"
			local color2="$brightgreen"
			local color3="$brightyellow"
			local color4="$brightblue"
			local color5="$brightpurple"
			local color6="$brightaqua"
			local color7="$white1"
			local color8="$black3"
			local color9="$brightorange"
			local color10="$black1"
			local color11="$black4"
			local color12="$gray"
			local color13="$white4"
			local color14="$white3"
			local color15="$white0"
			local bg="$black0"
			local fg="$white1"
			;;
		'light')
			export TERMINAL_THEME='gruvbox-light'
			local color0="$white0"
			local color1="$red"
			local color2="$green"
			local color3="$yellow"
			local color4="$blue"
			local color5="$purple"
			local color6="$aqua"
			local color7="$black1"
			local color8="$white3"
			local color9="$orange"
			local color10="$white1"
			local color11="$white4"
			local color12="$gray"
			local color13="$black4"
			local color14="$black3"
			local color15="$black0"
			local bg="$white0"
			local fg="$black1"
			;;
		*)
			echo "Unknown theme: '$*'" >&2
			return 1
		esac
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
	printf '\033]5;0;%s\007' "${bold:-"$fg"}" # Bold color
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
		local branch=$(git branch --show-current)
		printf ' (%s)' "${branch:-'???'}"
		# TODO: Display 'rebasing...' if currently rebasing
	fi
}

# TODO: Make terminal title more informative (use bash PS1 escapes)
PS1='\$ '
PROMPT_COMMAND='printf "\e]0;%s\a" "${USER}@${HOSTNAME}:${PWD//$HOME/\~}$(__git_ps1)"'
CDPATH=.:~:~/Projects:~/Courses
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
