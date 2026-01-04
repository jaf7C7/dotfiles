#!/bin/sh
#
# Sets up a user-local python installation in a virtual environment.
#
# It is generally not advisable to use the system python installation. This
# method sets up a python installation inside a virtual environment in the user's
# home directory, allowing python packages to be installed locally without
# affecting the system.

set -eu

# $1 - Install location
dest=${1:-$HOME/.local/opt/python_venv}

echo "installing to: $dest"

if ! test -d "$dest"
then
	mkdir -p "$dest"
	echo "created dest dir"
fi
 
echo 'bootstrapping virtualenv...'

tmp=$(mktemp)
wget -O "$tmp" https://bootstrap.pypa.io/virtualenv.pyz
python3 "$tmp" "$dest"
rm "$tmp"

"${dest}/bin/pip" install virtualenv

for file in python pip virtualenv
do
	ln -s "${dest}/bin/${file}" ~/.local/bin
	echo "created symlink: ${HOME}/.local/bin/${file} -> ${dest}/bin/${file}"
done

echo 'done.'
