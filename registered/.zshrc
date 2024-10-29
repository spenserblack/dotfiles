# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
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
zstyle ':vcs_info:git:*' formats '%# %b'

setopt prompt_subst
PROMPT='%~${vcs_info_msg_0_}%# '

alias ls='ls --color=auto'
alias diff='diff -su --color=auto'
alias mime='file --mime-type'
alias nv=nvim
