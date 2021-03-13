#!/bin/sh

dotfiles_dir="$HOME/dotfiles"

# list of files/directories to symlink in $HOME
symlink_files=".xinitrc .xprofile .inputrc .zshrc .zprofile .bashrc .vim .vimrc .gitconfig"

[ ! -d "${dotfiles_dir}_old" ] && mkdir -p "${dotfiles_dir}_old/.config" "${dotfiles_dir}_old/.local/bin" "${dotfiles_dir}_old/.local/share"

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

[ ! -f "$HOME/.vim/autoload/plug.vim" ] && {
	echo "installing vim plug..."
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}
