# Usage: exec <command>
#
# Only exec <command> if there are no background jobs running.
#
exec() {
	if test -n "$(jobs)"; then
		echo 'cannot exec: background jobs running' >&2
		jobs
		return 1
	fi
	command exec "$@"
}
