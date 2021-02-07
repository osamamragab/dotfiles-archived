[ -f "$HOME/.profile" ] && . "$HOME/.profile"

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	exec startx
fi
