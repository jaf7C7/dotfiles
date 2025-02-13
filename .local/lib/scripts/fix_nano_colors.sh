#
# Remove weird colours from nano default syntax files
#
regexp='\<(pink|purple|mauve|lagoon|mint|lime|peach|orange|latte|rosy|beet|plum|sea|sky|slate|teal|sage|brown|ocher|sand|tawny|brick|crimson)\>'

for _ in $(grep -El "$regexp" /usr/share/nano/*.nanorc); do
	sed -E "s/$regexp/red/" "$_" >~/.config/nano/"${_##*/}"
done

unset regexp
