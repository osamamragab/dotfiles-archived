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
	t="$HOME/bin/$n"

	if [ -e "$t" ]; then
		echo "move "$t" -> $dotfiles_old_dir/bin/$n"
		mv "$t" "$dotfiles_old_dir/bin"
	fi

	echo "creating new symlink for $dotfiles_dir/bin/$n"
	ln -s "$f" "$HOME/bin"
done

for f in "$dotfiles_dir"/.config/*; do
	n=$(basename "$f")
	t="$HOME/.config/$n"

	if [ -e "$t" ]; then
		if [ -d "$t" -a -L "$t" ]; then
			echo "removing directory symlink ($t)"
			rm "$t"
		else
			echo "move ($t -> $dotfiles_old_dir/.config/$n)"
			mv "$t" "$dotfiles_old_dir/.config"
		fi
	fi

	echo "creating new symlink for $dotfiles_dir/.config/$n"
	ln -s "$f" "$HOME/.config"
done
