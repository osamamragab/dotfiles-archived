#!/bin/bash

dir="$HOME/dotfiles"

olddir="$HOME/dotfiles_old"

# list of files/folders to symlink in homedir
files=(
  .zsh
  .oh-my-zsh
  .vim
  .fonts
  .bashrc
  .zshrc
  .vimrc
  .gitconfig
  .npmrc
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
