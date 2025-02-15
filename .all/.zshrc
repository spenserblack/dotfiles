# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups  # prevent immediately repeated commands from filling up history
unsetopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

fpath=(~/.zsh_completions $fpath)

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %b'

setopt prompt_subst
PROMPT='%~${vcs_info_msg_0_}%# '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word

alias ls='ls --color=auto'
alias diff='diff -su --color=auto'
alias mime='file --mime-type'
alias nv=nvim

export GPG_TTY=$(tty)

if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi
