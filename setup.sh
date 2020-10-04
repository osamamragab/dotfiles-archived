#!/bin/bash

dotfiles_dir="$HOME/dotfiles"

dotfiles_old_dir="$HOME/dotfiles_old"

# list of files/directories to symlink in $HOME
symlink_files=(
  .xinitrc
  .bashrc
  .bash_profile
  .vim
  .vimrc
  .gitconfig
)

# create $olddir to backup existing dot files
mkdir -p $dotfiles_old_dir

# link $files to home directory
for file in ${symlink_files[@]}; do
  targetFile="$HOME/$file"

  if [ -e "$targetFile" ]; then
    echo "moving old ($targetFile) to ($dotfiles_old_dir/$file)"
    mv "$targetFile" "$dotfiles_old_dir"
  fi

  echo "creating new symlink for $file"
  ln -s "$dotfiles_dir/$file" "$HOME"

  echo ""

  unset targetFile file
done

unset dotfiles_dir dotfiles_old_dir symlink_files
