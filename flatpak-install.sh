#!/bin/bash

# This script was made by Secret Firefox.
# It helps you to install Flatpak on Void Linux.
# Enjoy!

sudo xbps-install flatpak -y

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Reached end of the installation

echo "Installation complete. Reboot so programs show in Menu/Overview."


