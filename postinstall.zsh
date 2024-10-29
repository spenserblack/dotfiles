#!/usr/bin/env zsh
# Setup script for zsh
mkdir -p "$HOME/.zsh_completions"

if [[ "$(which gh)" != "" ]]; then
  gh completion -s zsh > "$HOME/.zsh_completions/_gh.zsh"
fi

if [[ "$(which pnpm)" != "" ]]; then
  pnpm completion zsh > "$HOME/.zsh_completions/_pnpm.zsh"
fi
