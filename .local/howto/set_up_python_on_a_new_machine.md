# How To Set Up Python On A New Machine

It is generally not advisable to use the system python installation. This
method sets up a python installation inside a virtual environment in the user's
home directory, allowing python packages to be installed locally without
affecting the system.

1. Bootstrap `virtualenv` to get the standalone virtualenv:
```
wget https://bootstrapp.pypa.io/virtualenv.pyz
```

2. Create new virtual environment in a suitable user-specific location (e.g.
`~/.local/lib/python_venv`)
```
mkdir -P ~/.local/lib/python_venv &&
python3 virtualenv.pyz ~/.local/lib/python_venv
```

3. Install virtualenv into the virtual environment (without bothering to
activate the environment)
```
~/.local/lib/python_venv/bin/pip install virtualenv
```

4. Create symlinks to add the virtual environment's python, pip and virtualenv
installations into your user executables directory (usually `~/.local/bin/`):
```
for _ in ~/.local/lib/python_venv/bin/{python,pip,virtualenv}; do
    ln -s $_ ~/.local/bin
done
```

You can now use `python`, `pip` and `virtualenv` from the command line without
ever touching anything system-level.

## References

* [why not global pip / virtualenv? (intermediate) anthony explains
#079](https://www.youtube.com/watch?v=O390_abzo08)
* [a virtualenv from nothing! (beginner - intermediate) anthony explains
#072](https://www.youtube.com/watch?v=OXmYKh0eTQ8)
* [how do virtualenvs actually work (advanced) anthony explains
#522](https://www.youtube.com/watch?v=XFqDHPYfTwE)
