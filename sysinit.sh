#!/bin/sh
# vim: wrap

cdir="$(dirname "$(readlink -f "$0")")"
if [ -x "$cdir/setup.sh" ]; then
	echo "running dotfiles setup script..."
	"$cdir/setup.sh"
fi

if ! command -v doas >/dev/null 2>&1; then
	echo "installing doas..."
	sudo xbps-install -Sy opendoas
	echo "permit nopass keepenv :wheel" | sudo tee /etc/doas.conf >/dev/null
fi

alias xi="doas xbps-install -Sy"

echo "updating system..."
xi -u xbps
xi -u

echo "installing x..."
xi xorg xorg-server xinit libX11-devel libXft-devel libXinerama libXinerama-devel libXrandr libXrandr-devel

echo "installing filesystems support..."
xi fuse fuse-exfat
# mtpfs simple-mtpfs

echo "installing network manager..."
xi NetworkManager ufw

echo "installing build tools..."
xi gcc git make pkg-config

echo "installing general tools..."
xi curl wget gnupg gnupg2 openssh pass passmenu tmux nnn slop maim dunst xdg-utils time entr nq rsync mlocate fd fzf skim ripgrep translate-shell cronie libnotify mmv tree xcompmgr unclutter urlview newsboat spt sc-im surfraw darkhttpd miniserve youtube-dl youtube-viewer pam-gnupg xdotool xclip xautolock xwallpaper pmount autofs xz zip unzip bsdtar openntpd bluez lprng qemu lftp redshift safeeyes github-cli delta tig bat glow mdp screenkey

echo "installing manual pages..."
xi man-pages man-pages-posix

echo "installing text editor..."
xi vim neovim

echo "installing zsh..."
xi zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search

echo "installing audio tools..."
xi alsa-utils alsa-plugins-pulseaudio pulseaudio pamixer pulsemixer

echo "installing multimedia tools..."
xi ffmpeg ImageMagick mpv sxiv gimp
# obs

echo "installing music players..."
xi mpd mpc ncmpcpp

echo "installing pdf tools..."
xi zathura zathura-pdf-mupdf mupdf wkhtmltopdf

# echo "installing video/photo/audio editors..."
# xi openshot darktable krita audacity lmms

echo "installing system monitoring tools..."
xi lm_sensors htop iftop bmon mon speedometer vnstat
# atop iotop gotop sysstat procs nmon

echo "installing email tools..."
xi neomutt msmtp isync notmuch

echo "installing chatting applications..."
xi irssi
# weechat weechat-python bitlbee slack-term Signal-Desktop telegram-tg telegram-desktop toot tuir toxcore toxic utox

echo "installing web browsers..."
xi firefox lynx w3m amfora sacc tor torbrowser-launcher
# netsurf lagrange

echo "installing torrent tools..."
xi transmission rtorrent

echo "installing programming stuff..."
xi clang tcc rustup go python3 nodejs yarn lua R ruby sassc postgresql13 mariadb sqlite redis flex bison c gdb valgrind strace ltrace clang-analyzer clang-tools-extra ccls rust-analyzer binutils upx ctags delve jq grpc protobuf terraform shellcheck shfmt pylint black tflint tokei misspell pgcli xxd hexedit hyperfine svgcleaner
go install -v github.com/google/pprof@latest github.com/securego/gosec@latest google.golang.org/protobuf/cmd/protoc-gen-go@latest github.com/fullstorydev/grpcurl@latest github.com/cosmtrek/air@latest github.com/timakin/bodyclose@latest
pip install jupyter mycli litecli
yarn global add typescript eslint prettier sass pug svgo ts-node
if ! command -v deno >/dev/null 2>&1; then
	export DENO_INSTALL="${XDG_DATA_HOME:-$HOME/.local/share}/deno"
	curl -fsSL "https://deno.land/x/install/install.sh" | sh
fi

echo "installing cheat sheet tools..."
xi cheat tealdeer
if ! command -v cht.sh >/dev/null 2>&1; then
	doas curl https://cht.sh/:cht.sh -o /usr/local/bin/cht.sh
	doas chmod +x /usr/local/bin/cht.sh
fi

echo "installing docker..."
xi docker docker-compose docker-credential-pass

# echo "installing arduino..."
# xi arduino arduino-cli

echo "installing markup/latex tools..."
xi pandoc groff texlive
# texlive-full mdocml lowdown mdBook

echo "installing networking tools..."
xi nmap netcat lsof traceroute mtr wireshark wireshark-qt termshark inetutils iputils net-tools bind-utils socat websocat iperf3 arp-scan aircrack-ng ettercap bettercap sqlmap wrk hey wuzz
# httpie testssl.sh geoip geoip-data kismet proxychains-ng john hashcat hashcat-utils
cargo install xh
# go install -v github.com/rs/curlie@latest
pip install mitmproxy

echo "installing fonts..."
xi font-ibm-plex-otf font-inconsolata-otf

progdir="$HOME/programs"
[ -d "$progdir" ] || mkdir -p "$progdir"

ghuser="$(git config --global --get user.username)"
if [ -z "$ghuser" ]; then
	printf "github username: "
	read ghuser
fi

if [ "$ghuser" ]; then
	echo "installing suckless programs..."
	for p in dwm st dmenu dwmblocks surf slock sent; do
		echo "installig $p"

		case "$p" in
			surf)
				echo "installing surf dependencies..."
				i webkit2gtk-devel gcr-devel gst-libav gst-plugins-good1
				;;
			sent)
				echo "installing sent dependencies..."
				i farbfeld
				;;
		esac

		[ -d "$progdir/$p" ] || git clone "git@github.com:$ghuser/$p.git" "$progdir/$p"
		cd "$progdir/$p"
		git checkout main
		doas make install
		make clean
	done
fi

echo "installing mutt-wizard..."
[ -d "$progdir/mutt-wizard" ] || git clone "git@github.com:LukeSmithxyz/mutt-wizard.git" "$progdir/mutt-wizard"
cd "$progdir/mutt-wizard"
git checkout master
doas make install

echo "installing hx..."
[ -d "$progdir/hx" ] || git clone "git@github.com:krpors/hx.git" "$progdir/hx"
cd "$progdir/hx"
git checkout master
doas make install
make clean

echo "installing z..."
[ -d "$progdir/z" ] || git clone "git@github.com:rupa/z.git" "$progdir/z"
doas cp -f "$progdir/z/z.1" "/usr/local/share/man/man1/z.1"
doas chmod 644 "/usr/local/share/man/man1/z.1"

if [ ! -f "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim" ]; then
	echo "installing vim plug..."
	curl --create-dirs -fLo "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim" "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi

cd "$cdir"

echo "changing default shell to zsh..."
chsh -s "$(which zsh)"
