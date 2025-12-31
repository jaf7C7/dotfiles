# dotfiles

Manage dotfiles as a bare git repo, no more symlinking!

To create your dotfiles repo:

```sh
mkdir -p ~/.local/opt
git init --bare ~/.local/opt/dotfiles
alias cfg='git --git-dir=~/.local/opt/dotfiles --work-tree=~'
cfg config status.showUntrackedFiles no
```

Add and commit as normal, just use the `cfg` alias instead of `git`:

```sh
cfg add .bashrc
cfg diff --staged
cfg commit -m 'Add bashrc'
```

To load your dotfiles on a new machine:

```sh
git clone --separate-git-dir=$HOME/.local/opt/dotfiles git@github.com:jaf7C7/dotfiles.git
alias cfg='git --git-dir=~/.local/opt/dotfiles --work-tree=~'
cfg config status.showUntrackedFiles no
cfg restore ~
```

[Source](https://news.ycombinator.com/item?id=11071754)

