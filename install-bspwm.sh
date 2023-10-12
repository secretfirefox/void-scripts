#!/bin/bash

# This script was made by Firefox.
# Its purpose is to facilitate installing and configuring Bspwm on your Void Linux system.
# This can be installed on top of an existing Void Xfce installation as well as from the base ISO.
# Enjoy!

# Install bspwm, sxhkd and dmenu (suckless tools)

sudo xbps-install bspwm sxhkd dmenu -y

# Install the screenshot, wallpaper selector, and appearance utilities

sudo xbps-install maim xclip feh lxappearance -y

# Install the terminal emulator (xfce4-terminal)

sudo xbps-install xfce4-terminal -y

# Install a file manager, a file extractor, and components for its functionality inside the file manager

sudo xbps-install Thunar thunar-archive-plugin xarchiver 

# Install picom for compositing functionality

sudo xbps-install picom -y

# Install polkit and a polkit agent (xfce-polkit)

sudo xbps-install polkit xfce-polkit -y
sudo ln -s /etc/sv/polkitd /var/service 

# Configure bspwm and sxhkd; give it the necessary permissions and copy files to their places

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

