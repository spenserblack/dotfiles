# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/opt/nvim-linux64/bin" ] ; then
    PATH="/opt/nvim-linux64/bin:$PATH"
fi
if [ -d "/opt/nvim-linux-x86_64/bin" ] ; then
    PATH="/opt/nvim-linux-x86_64/bin:$PATH"
fi

if [ -d "/usr/local/go/bin" ] ; then
    PATH="/usr/local/go/bin:$PATH"
    eval "$(go env)"
    PATH="$GOBIN:$PATH"
    PATH="$GOPATH/bin:$PATH"
fi

export PNPM_HOME="$HOME/.local/share/pnpm"
if [[ -d "$PNPM_HOME" ]]; then
    case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
fi

if [ -d "/usr/local/odin" ] ; then
    PATH="/usr/local/odin:$PATH"
fi

if command -v ruby &> /dev/null; then
    export GEM_HOME="$HOME/.gem/$(ruby -e "puts RUBY_VERSION.split('.').first(2).join('.')")"
    PATH="$GEM_HOME/bin:$PATH"
fi

if [ -e "$HOME/.cargo/env" ] ; then
    . "$HOME/.cargo/env"
fi

if [ -e "/home/linuxbrew/.linuxbrew/bin/brew" ] ; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [ -n "$WSL_DISTRO_NAME" ]; then
    export BROWSER="wslview"
elif command -v firefox &> /dev/null; then
    export BROWSER="firefox"
fi

if command -v nvim &> /dev/null; then
    export EDITOR="nvim"
elif command -v vim &> /dev/null; then
    export EDITOR="vim"
else
    export EDITOR="vi"
fi

function yz() {
    if ! command -v yazi &> /dev/null; then
        echo "yazi is not installed"
        return 1
    fi
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
