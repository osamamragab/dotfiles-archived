#!/bin/sh

dotfiles_dir="$HOME/dotfiles"
tmp_dir="/tmp/dotfiles-$(date '+%s')"

# list of files/directories to symlink in $HOME
symlink_files=".zprofile .vim .vimrc"

[ ! -d "$HOME/.config" ] && mkdir -p "$HOME/.config"
[ ! -d "$HOME/.local" ] && mkdir -p "$HOME/.local/bin" "$HOME/.local/share/applications"

symlink() {
	n=$(basename "$1")
	t="$2/$n"
	bd=$(basename "$(dirname "$t")")

	if [ -e "$t" ]; then
		if [ -L "$t" ]; then
			echo "remove symlink ($t)"
			rm "$t"
		else
			echo "move ($t -> $tmp_dir/$bd/$n)"
			mkdir -p "$tmp_dir/$bd"
			mv "$t" "$tmp_dir/$bd"
		fi
	fi

	echo "creating new symlink for $dotfiles_dir/$bd/$n"
	ln -s "$1" "$2"
}

for f in $symlink_files; do
	symlink "$dotfiles_dir/$f" "$HOME"
done

for f in "$dotfiles_dir"/.config/*; do
	symlink "$f" "$HOME/.config"
done

for f in "$dotfiles_dir"/.local/bin/*; do
	symlink "$f" "$HOME/.local/bin"
done

for f in "$dotfiles_dir"/.local/share/*; do
	if [ -d "$f" ]; then
		dn=$(basename "$f")
		for ff in "$f"/*; do
			symlink "$ff" "$HOME/.local/share/$dn"
		done
	else
		symlink "$f" "$HOME/.local/share"
	fi
done
