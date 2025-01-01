# Usage: title <title>
#        title (-u|--unset)
#
# Redefines `PROMPT_COMMAND` to set the terminal title to <title>.  The old
# value is saved, and can be restored with `-u` or `--unset`.
#
title() {
	case $1 in
		-u | --unset)
			PROMPT_COMMAND=$__OLD_PROMPT_COMMAND
			unset __OLD_PROMPT_COMMAND
			;;
		*)
			__OLD_PROMPT_COMMAND=$PROMPT_COMMAND
			PROMPT_COMMAND="__set_terminal_title \"$1\""
	esac
}
