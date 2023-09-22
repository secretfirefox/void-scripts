#!/bin/bash

# This script was made by Secret Firefox.
# It facilitates post-installation on Void Linux with Xfce.
# Use this only after updating your system and rebooting.
# Enjoy!

# Enable the nonfree repository

sudo xbps-install -S void-repo-nonfree -y

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

sudo xbps-install curl wget git xz unzip zip 7zip nano xtools mtools mlocate ntfs-3g fuse-exfat bash-completion linux-headers gtksourceview4 ffmpeg mesa-vdpau mesa-vaapi htop neofetch numlockx gnome-keyring libgnome-keyring xfce4-whiskermenu-plugin xfce4-screenshooter thunar-archive-plugin xarchiver -y

# Install some development packages (optional but recommended)

sudo xbps-install autoconf automake bison m4 make libtool flex meson ninja optipng sassc -y

# Install some important xdg utilities, to allow safe communication between apps

sudo xbps-install xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-gnome xdg-user-dirs xdg-user-dirs-gtk xdg-utils -y

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
xdg-user-dirs-gtk-update

# Reached the end of the install script

echo "Installation complete. Reboot your computer, then proceed to installing a DE or WM of your choice."


