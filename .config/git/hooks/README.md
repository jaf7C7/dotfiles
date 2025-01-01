# Git Hooks

These executables are intended to be modular, and run from your repository's
git hooks scripts.

## How to use

Copy the template file (shown below) to e.g. `.git/hooks/pre-commit`, make it
executable and add the hooks you want to the `hooks` variable.

```shell
#!/bin/sh

# Exit (and abort the operation) if any hook returns failure.
set -e

# Make sure the hooks are available.
test -d "$GIT_HOOKS"

# Get hook-type, e.g. `pre-commit`
hook_type=${0##*/}

# Select hooks to run in the order you want to run them:
#
# E.g.:
#
#   hooks='
#   no_commit_to_master
#   formatters/black
#   '
#
# `no_commit_to_master`:
# Don't allow commits to the branch given by config option `init.defaultBranch`
# (defaults to `master`).
#
# `formatters/black`:
# Format all staged python files with `black`.
#
hooks='
'

# Run all pre-commit hooks.
for hook in $hooks; do
    "$GIT_HOOKS/$hook_type/$hook"
done
```
