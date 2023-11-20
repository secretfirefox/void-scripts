# This script was written by Secret Firefox.
# The purpose of this script is to make post-installation easy on Void Linux.
# Enjoy!

# Make sure the system is updated

sudo xbps-install -Syu

# Add the nonfree repository

sudo xbps-install void-repo-nonfree -y

# Install dbus, elogind, and Network Manager

sudo xbps-install dbus elogind NetworkManager -y 

# Switch from dhcpcd and wpa_supplicant to Network Manager

sudo sv stop dhcpcd wpa_supplicant
sudo touch /etc/sv/dhcpcd/down /etc/sv/wpa_supplicant/down
sudo sv status dhcpcd wpa_supplicant

# Enable dbus, elogind and Network Manager

sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/elogind /var/service
sudo ln -s /etc/sv/NetworkManager /var/service

# Install some recommended packages

sudo xbps-install curl wget git xz unzip zip nano gptfdisk xtools mtools mlocate ntfs-3g fuse-exfat bash-completion linux-headers ffmpeg mesa-vdpau mesa-vaapi cpupower htop neofetch -y

# Install some development packages (optional but recommended)

sudo xbps-install autoconf automake bison m4 make libtool flex meson ninja optipng sassc -y

# Install some important xdg utilities, to allow communication between apps

sudo xbps-install xdg-desktop-portal xdg-user-dirs xdg-utils -y

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
cd ..
rm -rf runit-services 

# Install ntp and chronyd for syncing time

sudo xbps-install ntp chrony
sudo ln -s /etc/sv/chronyd /var/service/chronyd 

# Install Firefox and set a better font for it

sudo xbps-install firefox firefox-i18n-en-US -y
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
sudo xbps-reconfigure -f fontconfig 

# Inform finished installation

echo "Installation complete. Please reboot the computer."


