#!/bin/sh

# vim: wrap

alias i="doas xbps-install -Sy"

command -v doas > /dev/null 2>&1 || {
	echo "installing doas..."
	sudo xbps-install -Sy opendoas
}

echo "updating system..."
doas xbps-install -u xbps
doas xbps-install -Syu

echo "installing x..."
i xorg xorg-server xinit libX11-devel libXft-devel libXinerama glib-devel

echo "installing filesystems support..."
i fuse fuse-exfat mtpfs simple-mtpfs autofs

echo "installing network manager..."
i NetworkManager ufw

echo "installing build tools..."
i git gcc clang tcc make pkg-config

echo "installing manual pages..."
i man-pages man-pages-devel man-pages-posix tldr

echo "installing text editor..."
i vim neovim

echo "installing general tools..."
i curl wget ssh gnupg2 pass sxhkd nnn maim xclip xdotool xdg-utils xautolock entr youtube-dl rsync ripgrep fzf bat xz translate-shell xtools anki zeal tinycron libnotify tig tree unclutter urlscan urlview uftp highlight android-tools calcurse khal pandoc redshift newsboat spt

echo "installing audio tools..."
i alsa-utils alsa-plugins-pulseaudio pulseaudio pamixer pulsemixer

echo "installing multimedia tools..."
i ffmpeg ImageMagick mpv mpd mpc ncmpcpp sxiv zathura zathura-pdf-mupdf mupdf wkhtmltopdf obs openshot shotcut darktable darktable-cli audacity lmms transmission transmission-remote rtorrent

echo "installing system monitoring tools..."
i htop iotop bmon lm_sensors

echo "installing email tools..."
i neomutt msmtp thunderbird

echo "installing chatting applications..."
i irssi weechat weechat-python Signal-Desktop telegram-desktop cordless tuir toxcore toxic utox

echo "installing web browsers..."
i chromium firefox lynx w3m tor torbrowser-launcher

echo "installing networking tools..."
i nmap netcat wireshark socat inetutils net-tools iperf3 iputils aircrack-ng arp-scan geoip

echo "installing compilers..."
i rustup go python3 nodejs yarn R ruby lua apl sassc texlive groff lowdown
curl -fsSL "https://deno.land/x/install/install.sh" | sh

echo "installing programming tools..."
i gdb binutils upx ctags delve jq glow grpc protobuf terraform ninja shellcheck pylint black vale tflint cloc scc misspell
go get -u -v github.com/google/pprof github.com/securego/gosec google.golang.org/protobuf/cmd/protoc-gen-go github.com/fullstorydev/grpcurl github.com/m3ng9i/ran github.com/cosmtrek/air github.com/timakin/bodyclose
pip install jupyter vint
yarn global add typescript eslint babel degit surge http-server serve nodemon tsserver ts-node sass pug live-server parcel prettier svgo

echo "installing docker..."
i docker docker-compose docker-credential-pass

echo "installing arduino..."
i arduino arduino-cli

echo "installing fonts..."
i font-ibm-plex-otf font-inconsolata-otf

prgdir="$HOME/programs"
[ ! -e "$prgdir" ] && mkdir -p "$prgdir"
cd "$prgdir"

echo "installing suckless programs..."
suckless_programs="dwm st dmenu dwmblocks surf slock sent"
for p in $suckless_programs; do
	echo "installig $p"

	if [ "$p" = "surf" ]; then
		echo "installing surf dependencies..."
		i webkit2gtk-devel gcr-devel gst-libav gst-plugin-good1
	fi

	[ ! -e "$prgdir/$p" ] && git clone "git@github.com:$(git config --global --get user.username)/$p.git"
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

echo "running dotfiles setup script..."
[ -x "$HOME/dotfiles/setup.sh" ] && exec "$HOME/dotfiles/setup.sh"
