#!/bin/sh

cdir="$(dirname "$(readlink -f "$0")")"
cp -rsv "$cdir/.config" "$cdir/.local" "$cdir/.zprofile" "$HOME"
