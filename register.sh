#!/bin/sh
USAGE="register path/to/dotfile"
SCRIPT_PATH="$(readlink -f $0)"
DOTFILES="$(dirname "$SCRIPT_PATH")"
DEST="$DOTFILES/registered$DOTFILES_REGISTERED_SUFFIX.txt"

if [ $# -ne 1 ]; then
	echo $USAGE >&2
	exit 1
fi


# NOTE: If a directory is passed, we will register all files in that directory
if [ -d "$1" ]; then
	find "$1" -type f -exec "$SCRIPT_PATH" {} \;
	exit $?
fi

if [ ! -f "$1" ]; then
	echo "File not found: $1" >&2
	exit 1
fi

FILENAME="$1"
# NOTE: Strip $HOME from the beginning of the path
FILENAME="${FILENAME#$HOME/}"

# NOTE: Skip if the file is already registered
if grep -q "^$FILENAME$" "$DEST"; then
	echo "Already registered: $FILENAME" >&2
	exit 0
fi

mv "$HOME/$FILENAME" "$DOTFILES/$FILENAME"
ln -s "$DOTFILES/$FILENAME" "$HOME/$FILENAME"
echo "$FILENAME" >> "$DEST"
sort -o "$DEST" "$DEST"
git -C "$DOTFILES" add "$DOTFILES/$FILENAME" "$DEST"
git -C "$DOTFILES" commit -m "Register $FILENAME"
echo "Registered: $FILENAME"
