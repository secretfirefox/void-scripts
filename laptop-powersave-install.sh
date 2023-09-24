# This script was made by Secret Firefox.
# This installs and configures power saving on laptops.
# Enjoy!

# Install TLP and PowerTop

sudo xbps-install tlp tlp-rdw powertop

# Enable TLP service

sudo ln -s /etc/sv/tlp /var/service

# Inform finished installation

echo "Installation Complete!"

