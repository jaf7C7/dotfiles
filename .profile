if test -d ~/.local/bin; then
	PATH=~/.local/bin:"$PATH"
fi

export PAGER=less
export EDITOR='nano --ignorercfiles --afterends --autoindent --softwrap --fill=79 --trimblanks --minibar --constantshow --zero --nohelp --syntax=none'
export VIMINIT='set compatible expandtab shiftwidth=4 softtabstop=-1 autoindent hidden autoread wildchar=<Tab> history=100 formatprg=fmt\ -p\\\\#\\\ more listchars=tab:»\ ,space:· t_Co=8 background=dark highlight=vr,+ri,=rb,x-,Xr'

if test -d ~/.local/opt/plan9; then
    export PLAN9=~/.local/opt/plan9
    PATH="$PATH:$PLAN9/bin"
fi

if test -n "$BASH_VERSION" && test -f ~/.bashrc; then
	. ~/.bashrc
fi
