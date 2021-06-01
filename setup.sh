#!/bin/sh

cdir="$(dirname "$(readlink -f "$0")")"
cp -rsv "$cdir/.config" "$cdir/.local" "$cdir/.zprofile" "$cdir/.editorconfig" "$HOME"
ln -s "$HOME/.config/tmux/tmux.conf" "$HOME/.tmux.conf"
