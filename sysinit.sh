#!/bin/sh

if ! command -v doas > /dev/null 2>&1; then
	echo "installing doas..."
	sudo xbps-install -Sy opendoas
fi

echo "updating system..."
doas xbps-install -u xbps
doas xbps-install -Syu

echo "installing xorg..."
doas xbps-install -Sy xorg-server xinit libX11-devel libXft-devel libXinerama glib-devel xorg

echo "installing filesystems support..."
doas xbps-install -Sy fuse fuse-exfat mtpfs simple-mtpfs

echo "installing build tools..."
doas xbps-install -Sy git gcc clang make pkg-config

echo "installing manual pages..."
doas xbps-install -Sy man-pages man-pages-devel man-pages-posix tldr

echo "installing text editor..."
doas xbps-install -Sy vim neovim

echo "installing general tools..."
doas xbps-install -Sy curl wget ssh gnupg2 pass sxhkd nnn maim youtube-dl rsync xz alsa-utils groff upx jq glow mdcat grip translate-shell

echo "installing media players/viewers..."
doas xbps-install -Sy ffmpeg ImageMagick mpv mpd sxiv zathura zathura-pdf-mupdf

echo "installing system monitoring tools..."
doas xbps-install -Sy htop iotop

echo "installing email tools..."
doas xbps-install -Sy neomutt msmtp

echo "installing web browsers..."
doas xbps-install -Sy chromium firefox lynx w3m

echo "installing image/video stuff..."
doas xbps-install -Sy obs openshot shotcut darktable darktable-cli

echo "installing fonts..."
doas xbps-install -Sy font-ibm-plex-otf font-inconsolata-otf
