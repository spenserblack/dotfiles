if status is-interactive
    # Commands to run in interactive sessions can go here
    alias nv=nvim
    alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
end

set -x GPG_TTY (tty)

set -x COWPATH "/usr/share/cowsay/cows:$HOME/cowfiles"
set -x DENO_INSTALL $HOME/.deno
set -x EDITOR nvim
