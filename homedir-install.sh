#!/bin/bash -x
echo "Copying configs to their respective locations and installing required packages"
cp -r --parents .config .local .xsession $HOME
sudo apt-get install --no-install-recommends gnome-flashback gdm3 network-manager-gnome -y
sudo rm -rf /etc/network/interfaces.d/* && sudo service network-manager restart
sudo apt-get install i3 xserver-xorg -y
sudo service gdm restart
echo "Install finished, reboot and select 'Default session' in gdm"
