# This script was made by Secret Firefox.
# The purpose of this is to install Cinnamon on your Void Linux.
# Ideally, use this after using the post-install script. 
# This aims to bring you an environment similar to Linux Mint.
# Some compensations are made for software not available on Void.
# Enjoy!

# Install the display server 

sudo xbps-install xorg -y 

# Install the desktop environment

sudo xbps-install cinnamon -y 

# Install a terminal emulator, text editor, and a image viewer

sudo xbps-install xfce4-terminal pluma eom -y

# Install a video player, image editor, pdf viewer, and a calculator

sudo xbps-install celluloid gimp atril galculator -y

# Install the themes and icons from Linux Mint

cd Downloads

wget http://packages.linuxmint.com/pool/main/m/mint-themes/mint-themes_2.1.5.tar.xz

tar -xf mint-themes_2.1.5.tar.xz

sudo cp -r mint-themes/files/usr/share/themes/* /usr/share/themes/

wget http://packages.linuxmint.com/pool/main/m/mint-y-icons/mint-y-icons_1.6.7.tar.xz

tar -xf mint-y-icons_1.6.7.tar.xz

sudo cp -r mint-y-icons/usr/share/* /usr/share


