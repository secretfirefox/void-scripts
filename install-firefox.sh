# This script was created by Secret Firefox
# This installs Firefox with a English (United States) translation pack
# Enjoy!

# Install Firefox

sudo xbps-install firefox firefox-i18n-en-US

# Configure

sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo xbps-reconfigure -f fontconfig