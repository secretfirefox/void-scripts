#!/bin/bash

# This script was written by Secret Firefox.
# Using this will install BSPWM on your Void Linux, with default settings.
# Enjoy!

# Ensure the system is updated

sudo xbps-install -Syu

# Install the nonfree repository

sudo xbps-install void-repo-nonfree -y

# Install dbus, elogind, and NetworkManager

sudo xbps-install dbus elogind NetworkManager -y

# Switch from dhcpcd and wpa_supplicant to Network Manager

sudo sv stop dhcpcd wpa_supplicant
sudo touch /etc/sv/dhcpcd/down /etc/sv/wpa_supplicant/down
sudo sv status dhcpcd wpa_supplicant

# Enable dbus, elogind and Network Manager

sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/elogind /var/service
sudo ln -s /etc/sv/NetworkManager /var/service

# Install recommended packages

sudo xbps-install curl wget git xz unzip zip 7zip nano gptfdisk xtools mtools mlocate ntfs-3g fuse-exfat bash-completion linux-headers ffmpeg mesa-vdpau mesa-vaapi gtksourceview4 cpupower psmisc htop neofetch numlockx -y 

# Install development packages

sudo xbps-install autoconf automake bison m4 make libtool flex meson ninja optipng sassc -y

# Install xdg portals and utilities to allow secure communication between apps

sudo xbps-install xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-gnome xdg-user-dirs xdg-user-dirs-gtk xdg-utils -y

# Install PulseAudio, Pipewire and Wireplumber

sudo xbps-install pulseaudio pulseaudio-utils pulsemixer alsa-plugins-pulseaudio pipewire wireplumber -y

# Install cronie and enable its service 

sudo xbps-install cronie -y 
sudo ln -s /etc/sv/cronie /var/service

# Install a login daemon

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

# Install ntp and chronyd to keep system time in sync

sudo xbps-install ntp chrony -y
sudo ln -s /etc/sv/chronyd /var/service/chronyd

# Install Firefox and configure a better font for it

sudo xbps-install firefox firefox-i18n-en-US -y
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
sudo xbps-reconfigure -f fontconfig 

# Install a font package to be able to display foreign characters

sudo xbps-install noto-fonts-cjk -y 

# Install the display server

sudo xbps-install xorg -y 

# Install bspwm, sxhkd and dmenu (suckless tools)

sudo xbps-install bspwm sxhkd dmenu -y

# Install the terminal emulator (xfce4-terminal)

sudo xbps-install xfce4-terminal -y

# Install the screenshot, wallpaper selector, and appearance utilities

sudo xbps-install maim xclip feh lxappearance -y

# Install a file manager, a file extractor, and components for its functionality inside the file manager

sudo xbps-install Thunar thunar-archive-plugin xarchiver -y

# Install picom for compositing functionality

sudo xbps-install picom -y 

# Install polkit and a polkit agent (xfce-polkit, if you don't have one already)

sudo xbps-install polkit xfce-polkit -y
sudo ln -s /etc/sv/polkitd /var/service 

# Configure bspwm and sxhkd; give it the necessary permissions and copy files to their places

mkdir ~/.config
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
cp -r bspwmrc ~/.config/bspwm/
cp -r sxhkdrc ~/.config/sxhkd/ 
chmod 755 ~/.config/bspwm/bspwmrc
chmod 644 ~/.config/sxhkd/sxhkdrc

# Copy the provided screenshooting script to sxhkd directory

cp -r print-screen.sh ~/.config/sxhkd/print-screen.sh

# Generate a ~/.xinitrc for working dbus through startx

echo "dbus-launch --exit-with-session bspwm" >> ~/.xinitrc

# Inform finished installation

echo "Installation complete. Reboot, login with your credentials then do startx."

