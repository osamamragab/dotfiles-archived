#!/bin/sh

dotfiles_dir="$HOME/dotfiles"

# list of files/directories to symlink in $HOME
symlink_files=".xinitrc .xprofile .profile .inputrc .bashrc .bash_profile .vim .vimrc .gitconfig"

[ ! -d "$HOME/bin" ] && mkdir "$HOME/bin"
[ ! -d "${dotfiles_dir}_old" ] && mkdir -p "${dotfiles_dir}_old" "${dotfiles_dir}_old/bin" "${dotfiles_dir}_old/.config"

symlink() {
	n=$(basename "$1")
	t="$2/$n"
	bd=$(basename "$(dirname "$t")")

	if [ -e "$t" ]; then
		if [ -L "$t" ]; then
			echo "remove symlink ($t)"
			rm "$t"
		else
			echo "move ($t -> ${dotfiles_dir}_old/$bd/$n)"
			mv "$t" "${dotfiles_dir}_old/$bd"
		fi
	fi

	echo "creating new symlink for $dotfiles_dir/$bd/$n"
	ln -s "$1" "$2"
}

# link $symlink_files to home directory
for f in $symlink_files; do
	symlink "$dotfiles_dir/$f" "$HOME"
done

for f in "$dotfiles_dir"/bin/*; do
	symlink "$f" "$HOME/bin"
done

for f in "$dotfiles_dir"/.config/*; do
	symlink "$f" "$HOME/.config"
done
