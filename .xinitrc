#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

eval $(ssh-agent -s)

exec sxhkd &
exec xautolock -time 10 -locker slock &
exec dwmblocks &
exec dwm
