# This script was written by Secret Firefox.
# It facilitates post-installation in Void Linux.
# This script will also install the Gnome Desktop Environment.
# Enjoy!

# Make sure the system is updated

sudo xbps-install -Su

# Add the non-free repository

sudo xbps-install -Rs void-repo-nonfree

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

curl wget git xz unzip zip nano vim gptfdisk xtools mtools mlocate ntfs-3g fuse-exfat bash-completion linux-headers gtksourceview4 ffmpeg mesa-vdpau mesa-vaapi htop neofetch numlockx 7zip 

# Install some development packages (optional but recommended)

sudo xbps-install autoconf automake bison m4 make libtool flex meson ninja optipng sassc

# Install the Desktop Environment

sudo xbps-install xorg wayland gnome gdm

# Enable the Gnome Display Manager (GDM)
# Set the GDM to hold on for the time being

sudo ln -s /etc/sv/gdm /var/service
sudo sv down gdm

# Install some important xdg utilities, to allow communication between apps

sudo xbps-install xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-gnome xdg-user-dirs xdg-utils -y

# Install gnome-browser-connector (chrome-gnome-shell)

sudo xbps-install gnome-browser-connector

# Install PulseAudio

sudo xbps-install pulseaudio pulseaudio-utils pulsemixer alsa-plugins-pulseaudio

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

# Run some xdg-utilities to make GTK apps appear more ready

xdg-user-dirs-update

# Reached the end of the install script

echo "Installation complete. Reboot your computer to use your Gnome Desktop."

