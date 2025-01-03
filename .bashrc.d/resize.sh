# Usage: resize <height> <width>
#        resize ((s|small)|(m|tall)|(l|large))
resize() {
	read -r LINES COLUMNS <<-EOF
	$(stty size)
	EOF
	case $1 in
	s|small)
		set -- 24 80
		;;
	m|tall)
		set -- 43 80
		;;
	l|large)
		set -- 43 132
		;;
	esac
	__set_terminal_size "${1:-$LINES}" "${2:-$COLUMNS}"
}
