#!/bin/sh

# vim: wrap

if ! command -v doas > /dev/null 2>&1; then
	echo "installing doas..."
	sudo xbps-install -Sy opendoas
fi

echo "updating system..."
doas xbps-install -u xbps
doas xbps-install -Syu

echo "installing x..."
doas xbps-install -Sy xorg-server xinit libX11-devel libXft-devel libXinerama glib-devel xorg xdotool

echo "installing filesystems support..."
doas xbps-install -Sy fuse fuse-exfat mtpfs simple-mtpfs autofs lsblk

echo "installing build tools..."
doas xbps-install -Sy git gcc clang tcc make pkg-config

echo "installing manual pages..."
doas xbps-install -Sy man-pages man-pages-devel man-pages-posix tldr

echo "installing text editor..."
doas xbps-install -Sy vim neovim

echo "installing general tools..."
doas xbps-install -Sy curl wget ssh gnupg2 pass sxhkd nnn maim youtube-dl rsync ripgrep bat xz groff jq glow translate-shell anki zeal asciinema texlive biber tinycron tig tree unclutter urlscan urlview uftp highlight android-tools calcurse khal pandoc lowdown redshift

echo "installing audio tools..."
doas xbps-install -Sy alsa-utils pulseaudio alsa-plugins-pulseaudio pamixer pulsemixer

echo "installing multimedia tools..."
doas xbps-install -Sy ffmpeg ImageMagick mpv mpd mpc ncmpcpp sxiv zathura zathura-pdf-mupdf wkhtmltopdf obs openshot shotcut darktable darktable-cli audacity lmms transmission transmission-remote rtorrent

echo "installing system monitoring tools..."
doas xbps-install -Sy htop iotop bmon

echo "installing email tools..."
doas xbps-install -Sy neomutt msmtp thunderbird

echo "installing chatting applications..."
doas xbps-install -Sy irssi weechat weechat-python Signal-Desktop telegram-desktop cordless 6cord tuir toxcore toxic utox

echo "installing web browsers..."
doas xbps-install -Sy chromium firefox lynx w3m tor torbrowser-launcher

echo "installing fonts..."
doas xbps-install -Sy font-ibm-plex-otf font-inconsolata-otf

echo "installing networking stuff..."
doas xbps-install -Sy ufw nmap netcat wireshark socat inetutils net-tools iperf3 iputils aircrack-ng arp-scan

echo "installing programming stuff..."
doas xbps-install -Sy rustup go python3 nodejs yarn R ruby lua grpc protobuf apl

echo "installing programming tools..."
doas xbps-install -Sy gdb ctags upx terraform ninja shellcheck pylint vale tflint cloc scc
pip install vint

echo "installing docker..."
doas xbps-install -Sy docker docker-compose docker-credential-pass

echo "installing arduino..."
doas xbps-install -Sy arduino arduino-cli

prgdir="$HOME/programs"
[ ! -e "$prgdir" ] && mkdir -p "$prgdir"
cd "$prgdir"

echo "installing suckless programs..."
suckless_programs="dwm st dmenu dwmblocks surf slock sent"
for p in $suckless_programs; do
	echo "installig $p"

	if [ "$p" = "surf" ]; then
		echo "installing surf dependencies..."
		doas xbps-install -Sy webkit2gtk-devel gcr-devel gst-libav gst-plugin-good1
	fi

	[ ! -e "$prgdir/$p" ] && git clone "git@github.com:osamai/$p.git"
	cd "$prgdir/$p"
	git checkout main
	doas make install
	make clean
done

cd "$prgdir"

echo "installing mutt-wizard..."
[ ! -e "$prgdir/mutt-wizard" ] && git clone "git@github.com:LukeSmithxyz/mutt-wizard.git"
cd "$prgdir/mutt-wizard"
git checkout master
doas make install

cd "$prgdir"

echo "installing telegram cli..."
[ ! -e "$prgdir/tg" ] && git clone "git@github.com:kenorb-contrib/tg.git"
cd "$prgdir/tg"
git checkout master
doas make install

cd "$prgdir"

echo "installing z..."
[ ! -e "$prgdir/z" ] && git clone "git@github.com:rupa/z.git"
doas ln -s "$prgdir/z/z.1" "/usr/local/share/man/man1/z.1"

echo "installing v..."
[ ! -e "$prgdir/v" ] && git clone "git@github.com:rupa/v.git"
doas ln -s "$prgdir/v/v" "/usr/local/bin/v"
doas ln -s "$prgdir/v/v.1" "/usr/local/share/man/man1/v.1"

echo "installing SETools..."
[ ! -e "$prgdir/setools" ] && git clone "git@github.com:SELinuxProject/setools.git"

[ -x "$HOME/dotfiles/setup.sh" ] && exec "$HOME/dotfiles/setup.sh"

echo "done"
