if status is-interactive
    # Commands to run in interactive sessions can go here
    alias nv=nvim
    alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
end

set -x GPG_TTY (tty)
eval (ssh-agent -c)
if not pgrep --full ssh-agent | string collect > /dev/null
    eval (ssh-agent -c)
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

set -x COWPATH "/usr/share/cowsay/cows:$HOME/cowfiles"
set -x DENO_INSTALL $HOME/.deno
set -x EDITOR nvim
