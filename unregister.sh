#!/bin/sh
USAGE="unregister path/to/dotfile"
SCRIPT_PATH="$(readlink -f $0)"
DOTFILES="$(dirname "$SCRIPT_PATH")"
DEST="$DOTFILES/registered$DOTFILES_REGISTERED_SUFFIX.txt"

if [ $# -ne 1 ]; then
	echo $USAGE >&2
	exit 1
fi

FILENAME="$1"
# NOTE: Strip $HOME from the beginning of the path
FILENAME="${FILENAME#$HOME/}"

# NOTE: Skip if the file is not registered
if ! grep -q "^$FILENAME$" "$DEST"; then
	echo "Not registered: $FILENAME" >&2
	exit 1
fi

# NOTE: If symlink exists in $HOME, remove it and replace it with the original file.
#		Otherwise, just remove the file.
if [ -L "$HOME/$FILENAME" ]; then
	rm "$HOME/$FILENAME"
	mv "$DOTFILES/$FILENAME" "$HOME/$FILENAME"
else
	rm "$HOME/$FILENAME"
fi

# NOTE: Remove the file from the registered list
sed -i "\:^$FILENAME\$:d" "$DEST"

git -C "$DOTFILES" add "$DOTFILES/$FILENAME" "$DEST"
git -C "$DOTFILES" commit -m "Unregister $FILENAME"
echo "Unregistered: $FILENAME"
