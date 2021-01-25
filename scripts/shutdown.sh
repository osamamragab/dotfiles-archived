#!/bin/sh

choice=$(printf "shutdown\nreboot\nlock\nexit" | dmenu -i -p "choose action: ")

[ "$choice" = "shutdown" ] && doas poweroff
[ "$choice" = "reboot" ] && doas reboot
[ "$choice" = "lock" ] && slock
[ "$choice" = "exit" ] && pkill dwm
