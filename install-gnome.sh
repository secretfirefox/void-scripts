#!/bin/bash
# This script was made by Secret Firefox.
# Its purpose is to install Gnome Desktop Environment on your Void Linux.
# Enjoy!

# Install wayland and xorg display servers

sudo xbps-install xorg wayland -y

# Install the Desktop Environment

sudo xbps-install xorg wayland gnome gdm -y

# Enable the Gnome Display Manager (GDM)

sudo ln -s /etc/sv/gdm /var/service

# Install gnome-browser-connector (chrome-gnome-shell)

sudo xbps-install gnome-browser-connector

#  Inform finished install

echo "Installation finished, reboot the computer."
