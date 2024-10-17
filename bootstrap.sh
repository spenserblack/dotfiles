#!/bin/sh
SCRIPT_PATH="$(readlink -f $0)"
DOTFILES="$(dirname "$SCRIPT_PATH")"

create_symlinks() {
	DOTFILES_PATH="$1"
	for FILENAME in $(find "$DOTFILES_PATH" -type f); do
		# SNOTE: kip .gitkeep file
		if [ "$(basename "$FILENAME")" = ".gitkeep" ]; then
			continue
		fi
		DEST="$HOME/${FILENAME#$DOTFILES_PATH/}"
		DESTDIR="$(dirname "$DEST")"
		mkdir -p "$DESTDIR"
		# NOTE: If the file exists, skip creating a conflicting symlink
		if [ -e "$DEST" ]; then
			echo "$DEST exists: skipping $FILENAME" >&2
			continue
		fi
		ln -s "$FILENAME" "$DEST"
		echo "Linked: $FILENAME"
	done
}

create_symlinks "$DOTFILES/registered"
create_symlinks "$DOTFILES/registered-linux"

echo "Bootstrap complete"
