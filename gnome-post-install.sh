# This script was written by Secret Firefox.
# It aims to facilitate a Gnome post-install on Void Linux.
# After running the script, you should have a functional system with GNOME desktop.
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

# Install Pipewire and Wireplumber

sudo xbps-install pipewire wireplumber wireplumber-elogind -y
sudo ln -s /usr/share/applications/pipewire.desktop /etc/xdg/autostart
sudo ln -s /usr/share/applications/pipewire-pulse.desktop /etc/xdg/autostart
sudo ln -s /usr/share/applications/wireplumber.desktop /etc/xdg/autostart


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

# Install the display servers

sudo xbps-install xorg wayland -y 

# Install GNOME and gnome-browser-connector, previously known as chrome-gnome-shell

sudo xbps-install gnome gnome-browser-connector -y

# Enable the GNOME Display Manager (GDM)

sudo ln -s /etc/sv/gdm /var/service

# Fix the question mark sign being put on the Network icon

sudo mkdir /etc/NetworkManager/conf.d
echo -e "[connectivity]\nuri=https://1.1.1.1\ninterval=0" | sudo tee /etc/NetworkManager/conf.d/connectivity.conf

# Inform finished install and reboot the computer

echo "The installation is complete and the computer will now reboot."
echo "The installation is complete and the computer will now reboot."
echo "The installation is complete and the computer will now reboot."
echo "The installation is complete and the computer will now reboot."
echo "The installation is complete and the computer will now reboot."
echo "The installation is complete and the computer will now reboot."
echo "The installation is complete and the computer will now reboot."
echo "The installation is complete and the computer will now reboot."
echo "The installation is complete and the computer will now reboot."
echo "The installation is complete and the computer will now reboot."
sudo reboot




