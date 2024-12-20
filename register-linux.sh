#!/bin/sh
SCRIPT_PATH="$(readlink -f $0)"
DOTFILES="$(dirname "$SCRIPT_PATH")"
DOT_FOLDER=.linux sh "$DOTFILES/register.sh" "$@"
