#!/bin/sh
SCRIPT_PATH="$(readlink -f $0)"
DOTFILES="$(dirname "$SCRIPT_PATH")"
DOTFILES_REGISTERED_SUFFIX=-linux sh "$DOTFILES/unregister.sh" "$@"
