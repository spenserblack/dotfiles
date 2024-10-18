#!/bin/sh
USAGE="register path/to/dotfile"
SCRIPT_PATH="$(readlink -f $0)"
DOTFILES="$(dirname "$SCRIPT_PATH")"
DEST_FOLDER="$DOTFILES/registered$DOTFILES_REGISTERED_SUFFIX"

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

SOURCE="$1"
# NOTE: Strip $HOME from the beginning of the path
RELATIVE_FILENAME="${SOURCE#$HOME/}"
DEST="$DEST_FOLDER/$RELATIVE_FILENAME"

# If dest exists, skip
if [ -e "$DEST" ]; then
	echo "$DEST exists: skipping $SOURCE" >&2
	exit 0
fi

mkdir -p "$(dirname "$DOTFILES/$RELATIVE_FILENAME")"
mv "$SOURCE" "$DEST"
ln -s "$DEST" "$SOURCE"
git -C "$DOTFILES" add "$DEST"
git -C "$DOTFILES" commit -m "Register $RELATIVE_FILENAME"
echo "Registered: $RELATIVE_FILENAME"
