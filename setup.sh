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
  targetFile="$HOME/$file"

  if [ -e "$targetFile" ]; then
    echo "moving $targetFile to $olddir/$file"
    mv "$targetFile" "$olddir"
  fi

  echo "creating symlink for $file"
  ln -s "$dir/$file" "$HOME"

  unset targetFile
done

unset dir olddir files file
