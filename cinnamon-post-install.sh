# This script was written by Secret Firefox.
# This will install the Cinnamon Desktop Environment on your Void Linux.
# Some personal customizations included.
# Enjoy!

# Ensure the system is up-to-date 

sudo xbps-install -Suy

# Add the non-free repository

sudo xbps-install -Rs void-repo-nonfree -y

# Install dbus, elogind, and Network Manager

sudo xbps-install dbus elogind NetworkManager -y 

# Turn off dhcpcd and wpa_supplicant in favor of NetworkManager

sudo sv stop dhcpcd wpa_supplicant
sudo touch /etc/sv/dhcpcd/down /etc/sv/wpa_supplicant/down
sudo sv status dhcpcd wpa_supplicant

# Enable dbus, elogind and Network Manager

sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/elogind /var/service
sudo ln -s /etc/sv/NetworkManager /var/service

# Install some recommended packages

sudo xbps-install curl wget git xz unzip zip nano vim gptfdisk xtools mtools mlocate ntfs-3g fuse-exfat bash-completion linux-headers gtksourceview4 ffmpeg mesa-vdpau mesa-vaapi htop neofetch numlockx 7zip psmisc gnome-keyring ibus ibus-mozc cpupower -y

# Install some development packages (optional but recommended)

sudo xbps-install autoconf automake bison m4 make libtool flex meson ninja optipng sassc -y

# Install some important xdg utilities, to allow communication between apps

sudo xbps-install xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-gnome xdg-user-dirs xdg-user-dirs-gtk xdg-utils -y

# Install PulseAudio and Pipewire/Wireplumber

sudo xbps-install pulseaudio pulseaudio-utils pulsemixer alsa-plugins-pulseaudio pipewire wireplumber -y

# Install cronie and enable its service

sudo xbps-install cronie -y 
sudo ln -s /etc/sv/cronie /var/service

# Install a logging daemon

sudo xbps-install socklog-void -y
sudo ln -s /etc/sv/socklog-unix /var/service/
sudo ln -s /etc/sv/nanoklogd /var/service/

# Install Profile Sync Daemon, to speed up browsers

git clone https://github.com/madand/runit-services
cd runit-services
sudo mv psd /etc/sv/
sudo ln -s /etc/sv/psd /var/service/
sudo chmod +x /etc/sv/psd/*

# Install Firefox and set a better font for it

sudo xbps-install firefox firefox-i18n-en-US -y
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
sudo xbps-reconfigure -f fontconfig 

# Install the display server

sudo xbps-install xorg -y 

# Install the desktop environment

sudo xbps-install cinnamon -y 

# Run some xdg-utilities to make GTK apps appear more ready

xdg-user-dirs-update
xdg-user-dirs-gtk-update

# Download and install the Mint-Yz theme and icons

cd ~/Downloads

wget https://github.com/SebastJava/mint-yz-theme/releases/download/v4.1/mint-yz-theme_4.1.zip
wget https://github.com/SebastJava/mint-yz-icons/releases/download/v4.0/mint-yz-icons_4.0.zip
unzip -d ~/Downloads/mint-yz-theme_4.1/ mint-yz-theme_4.1.zip
unzip -d ~/Downloads/mint-yz-icons_4.0/ mint-yz-icons_4.0.zip
cd ~/Downloads/mint-yz-theme_4.1/
sudo sh ~/Downloads/mint-yz-theme_4.1/INSTALLER.sh
cd ~/Downloads/mint-yz-icons_4.0/
sudo sh ~/Downloads/mint-yz-icons_4.0/INSTALLER.sh

# Update the icon cache for Mint-Yz themes

cd 
cd void-scripts
sudo sh mint-yz-update-icon-cache.sh

# Download Fox's preferred cursor

sudo xbps-install breeze-snow-cursor-theme -y 

# Install Fox's preferred font

sudo xbps-install font-fira-otf -y

# Download and install Fox's wallpaper selection

cd 
git clone https://github.com/secretfirefox/fox-backgrounds
cd fox-backgrounds
bash generate-single-directory.sh

# Download a terminal emulator, text editor, image viewer and a calculator

sudo xbps-install xfce4-terminal pluma eom galculator -y

# Install a video player, image editor and a pdf viewer

sudo xbps-install celluloid gimp atril -y 

# Inform finished installation

echo "Installation complete. Please restart the computer"
