#!/bin/sh

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

USER_FLAGS_FILE="$XDG_CONFIG_HOME/brave-flags.conf"
if [ -f "$USER_FLAGS_FILE" ]; then
	USER_FLAGS="$(sed "s/#.*//" "$USER_FLAGS_FILE")"
fi

if [ -n "$LD_LIBRARY_PATH" ]; then
	LD_LIBRARY_PATH="/opt/brave.com/brave:$LD_LIBRARY_PATH"
else
	LD_LIBRARY_PATH="/opt/brave.com/brave"
fi
export LD_LIBRARY_PATH

export CHROME_VERSION_EXTRA="stable"

exec /opt/brave.com/brave/brave "$@" $USER_FLAGS
