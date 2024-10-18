#!/bin/sh
USAGE="unregister path/to/dotfile"
SCRIPT_PATH="$(readlink -f $0)"
DOTFILES="$(dirname "$SCRIPT_PATH")"
SOURCE_FOLDER="$DOTFILES/registered$DOTFILES_REGISTERED_SUFFIX"

if [ $# -ne 1 ]; then
	echo $USAGE >&2
	exit 1
fi

DEST="$1"
# NOTE: Strip $HOME from the beginning of the path
RELATIVE_FILENAME="${DEST#$HOME/}"
SOURCE="$SOURCE_FOLDER/$RELATIVE_FILENAME"

# NOTE: Skip if the file is not in registered
if [ ! -e "$SOURCE" ]; then
	echo "File not found in $SOURCE_FOLDER folder: $DEST" >&2
	exit 1
fi

# NOTE: If symlink exists in $HOME, remove it and replace it with the original file.
#		Otherwise, just remove the file.
if [ -L "$DEST" ]; then
	rm "$DEST"
	mv "$SOURCE" "$DEST"
else
	rm "$SOURCE"
fi

git -C "$DOTFILES" add "$SOURCE"
git -C "$DOTFILES" commit -m "Unregister $RELATIVE_FILENAME"
echo "Unregistered: $RELATIVE_FILENAME"
