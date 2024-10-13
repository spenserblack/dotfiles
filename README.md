# Dotfiles Starter

This template helps create a dotfiles repository. There are many ways to create a
dotfiles repository, but the way this one works is by having a "bootstrap" script that
will add *registered* files from this repository to your home directory. Files are
registered if they are in either `registered.txt` or `registered-OS.txt`, where `OS`
is your operating system. This prevents files in this repository that *aren't* part of
your tracked dotfiles from being added.

On Linux, this will create symlinks for each of the registered dotfiles. This allows
you to edit the file and have the changes be "automatically" applied. On Windows,
unfortunately, this will copy the files instead of creating symlinks, meaning that
changes to one file won't be synchronized with the other.

## Usage

### Registering dotfiles

You can register a new dotfile to be tracked by this repository by calling the
appropriate `register*` script along with the file or directory that you want to
register.

#### Examples

```shell
./register.sh ~/.gitconfig
./register-linux.sh ~/.config/nvim/
```

## Installation

After using this template to create a repository called "dotfiles", clone that
repository. Then, there are a few ways to "install" these scripts. They include

- Adding your repository to `$PATH`
- Making aliases or symlinks (`ln -s path/to/dotfiles/register.sh ~/.local/bin/dotfiles-register`)

Also, feel free to modify any of the scripts or this `README.md` once you've cloned
your new dotfiles repository. It is, after all, your repository.

On Windows, the implementation is done by batch files (the `*.cmd` files) calling
PowerShell scripts (the `*.ps1` files). Unfortunately, this may result in the
PowerShell scripts not getting called due to an execution policy error. Read the error
message and decide for yourself what the appropriate course of action should be.
