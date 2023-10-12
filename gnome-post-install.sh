#!/bin/bash
# This script was made by Secret Firefox.
# Its purpose is to install Gnome Desktop Environment on your Void Linux.
# Enjoy!

# Install the Desktop Environment

sudo xbps-install xorg wayland gnome gdm

# Enable the Gnome Display Manager (GDM)
# Test GDM to make sure it is working (press Ctrl Alt F1 to return to TTY)

sudo ln -s /etc/sv/gdm /var/service
sudo sv once gdm

# Install gnome-browser-connector (chrome-gnome-shell)

sudo xbps-install gnome-browser-connector

#  Inform finished install

echo "Installation finished, reboot the computer."