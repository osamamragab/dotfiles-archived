#!/bin/bash

dir="$HOME/dotfiles"

olddir="$HOME/dotfiles-old"

# list of files/folders to symlink in homedir
files=(
  .bashrc
  .zshrc
  .vimrc
  .gitconfig
  .npmrc
  .fonts
  .js
)

# create $olddir to backup existing dot files
mkdir -p $olddir

# link $files to home directory
for file in ${files[@]}; do
  if [ -e "$HOME/$file" ]; then
    echo "moving $HOME/$file to $olddir/$file"
    mv "$HOME/$file" "$olddir/$file"
  fi

  echo "creating symlink for $file"
  ln -s "$dir/$file" "$HOME/$file"
done
