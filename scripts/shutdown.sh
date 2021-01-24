#!/bin/sh

choice=$(printf "shutdown\nreboot\nlock\nexit" | dmenu -i -p "choose action: ")

[ "$choice" = "shutdown" ] && doas poweroff
[ "$choice" = "reboot" ] && doas reboot
[ "$choice" = "lock" ] && xautolock -locknow
[ "$choice" = "exit" ] && pkill dwm
