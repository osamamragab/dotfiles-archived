#!/bin/bash

# Source global definitions
if [ -f '/etc/bashrc' ]; then
	source '/etc/bashrc'
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

source "$HOME/dotfiles/.include_all"

chmod +x ~/.vocab
~/.vocab
