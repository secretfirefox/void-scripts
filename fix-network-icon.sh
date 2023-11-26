#!/bin/bash

# This was made by Secret Firefox.
# Does what it says on the tin.

sudo mkdir /etc/NetworkManager/conf.d
echo -e "[connectivity]\nuri=https://1.1.1.1\ninterval=0" | sudo tee /etc/NetworkManager/conf.d/connectivity.conf

