if status is-interactive
    # Commands to run in interactive sessions can go here
    alias nv=nvim
    alias mime="file --mime"
    alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    alias ggl=google

    function dotdot
        echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
    end

    abbr --add dotdot --regex '^\.\.+$' --function dotdot
end

set -x GPG_TTY (tty)

set -x COWPATH "/usr/share/cowsay/cows:$HOME/cowfiles"
set -x DENO_INSTALL $HOME/.deno
set -x EDITOR nvim
set -x BROWSER chromium-browser
set -x GEM_HOME $HOME/.gem
set -x GEM_PATH $HOME/.gem

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
