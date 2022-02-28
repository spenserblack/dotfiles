# dotfiles

My dotfiles

Set up with [this tutorial from Atlassian](https://www.atlassian.com/git/tutorials/dotfiles).

## Initial Setup

```shell
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
gh repo clone spenserblack/dotfiles $HOME/.dotfiles -- --bare
dotfiles config --local status.showUntrackedFiles no
dotfiles submodule update --init
```
