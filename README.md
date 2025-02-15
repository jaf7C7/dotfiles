# dotfiles

Manage dotfiles as a bare git repo, no more symlinking!

To create your dotfiles repo:

```sh
git init --bare $HOME/.dotfiles
alias cfg='git --git-dir=$HOME/.local/opt/dotfiles --work-tree=$HOME'
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
alias cfg='git --git-dir=$HOME/.local/opt/dotfiles --work-tree=$HOME'
cfg config status.showUntrackedFiles no
```

[Source](https://news.ycombinator.com/item?id=11071754)

