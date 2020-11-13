#!/bin/bash

dotfiles_dir="$HOME/dotfiles"
dotfiles_old_dir="$HOME/dotfiles_old"

# list of files/directories to symlink in $HOME
symlink_files=(
  .xinitrc
  .inputrc
  .bashrc
  .bash_profile
  .vim
  .vimrc
  .gitconfig
)

[ ! -d "$dotfiles_old_dir" ] && mkdir "$dotfiles_old_dir"
[ ! -d "$HOME/bin" ] && mkdir "$HOME/bin"

# link $symlink_files to home directory
for f in ${symlink_files[@]}; do
  if [ -e "$HOME/$f" ]; then
    echo "move ($HOME/$f => $dotfiles_old_dir/$f)"
    mv "$HOME/$f" "$dotfiles_old_dir"
  fi

  echo "creating new symlink for $HOME/$f"
  ln -s "$dotfiles_dir/$f" "$HOME"
done

for f in $(ls "$dotfiles_dir/bin"); do
  if [ ! -e "$HOME/bin/$f" ]; then
    echo "creating new symlink for $dotfiles_dir/bin/$f"
    ln -s "$dotfiles_dir/bin/$f" "$HOME/bin"
  fi
done
