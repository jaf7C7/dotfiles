# Git Hooks

These executables are intended to be modular, and run from your repository's
git hooks scripts.

## How to use

An example `.git/hooks/pre-commit` file:

```shell
#!/bin/sh

# Exit (and abort the commit) if any hook returns failure.
set -e

# Make sure the hooks are available.
test -d "$GIT_HOOKS"

# Select hooks to run in the order you want to run them:
#
# `pre-commit/no_commit_to_master`:
# Don't allow commits to the branch given by config option `init.defaultBranch`
# (defaults to `master`).
#
# `pre-commit/formatters/black`:
# Format all staged python files with `black`.
#
hooks='
pre-commit/no_commit_to_master
pre-commit/formatters/black
'

# Run all hooks.
for hook in $hooks; do
    "$GIT_HOOKS/$hook"
done
```
