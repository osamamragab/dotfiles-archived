#!/bin/sh

[ $1 = "up" ] && amixer set Master 5%+
[ $1 = "down" ] && amixer set Master 5%-
[ $1 = "toggle" ] && amixer set Master toggle

pkill -RTMIN+7 dwmblocks
