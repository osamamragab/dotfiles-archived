#!/bin/sh

dotfiles_dir="$HOME/dotfiles"
dotfiles_old_dir="$HOME/dotfiles_old"

# list of files/directories to symlink in $HOME
symlink_files=".xinitrc .xprofile .profile .inputrc .bashrc .bash_profile .vim .vimrc .gitconfig"

# create needed directories
[ ! -d "$HOME/bin" ] && mkdir "$HOME/bin"
[ ! -d "$dotfiles_old_dir" ] && mkdir "$dotfiles_old_dir"
[ ! -d "$dotfiles_old_dir/bin" ] && mkdir "$dotfiles_old_dir/bin"

# link $symlink_files to home directory
for f in $symlink_files; do
	if [ -e "$HOME/$f" ]; then
		echo "move ($HOME/$f -> $dotfiles_old_dir/$f)"
		mv "$HOME/$f" "$dotfiles_old_dir"
	fi

	echo "creating new symlink for $HOME/$f"
	ln -s "$dotfiles_dir/$f" "$HOME"
done

for f in "$dotfiles_dir"/bin/*; do
	n=$(basename "$f")

	if [ -e "$HOME/bin/$n" ]; then
		echo "move ($HOME/bin/$n -> $dotfiles_old_dir/bin/$n)"
		mv "$HOME/bin/$n" "$dotfiles_old_dir/bin"
	fi

	echo "creating new symlink for $dotfiles_dir/bin/$n"
	ln -s "$f" "$HOME/bin"
done

for f in "$dotfiles_dir"/.config/*; do
	n=$(basename "$f")

	if [ -e "$HOME/.config/$n" ]; then
		if [ -L "$HOME/.config/$n" -a -d "$HOME/.config/$n" ]; then
			echo "removing directory symlink ($HOME/.config/$n)"
			rm "$HOME/.config/$n"
		else
			echo "move ($HOME/.config/$n -> $dotfiles_old_dir/.config/$n)"
			mv "$HOME/.config/$n" "$dotfiles_old_dir/.config"
		fi
	fi

	echo "creating new symlink for $dotfiles_dir/.config/$n"
	ln -s "$f" "$HOME/.config"
done
