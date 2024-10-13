#!/bin/sh
SCRIPT_PATH="$(readlink -f $0)"
DOTFILES="$(dirname "$SCRIPT_PATH")"
REGISTERED="$DOTFILES/registered.txt"
REGISTERED_LINUX="$DOTFILES/registered-linux.txt"
cat "$REGISTERED" "$REGISTERED_LINUX" | sort | uniq | while read -r FILENAME; do
	DEST="$HOME/$FILENAME"
	DESTDIR="$(dirname "$DEST")"
	mkdir -p "$DESTDIR"
	# NOTE: If the file exists, skip creating a conflicting symlink
	if [ -e "$DEST" ]; then
		echo "$DEST exists: skipping $FILENAME" >&2
		continue
	fi
	ln -s "$DOTFILES/$FILENAME" "$DEST"
	echo "Linked: $FILENAME"
done

echo "Bootstrap complete"
