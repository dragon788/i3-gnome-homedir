#!/bin/bash -x
echo "Copying configs to their respective locations and installing required packages"
cp -r --parents .config .local .xsession $HOME
sudo apt-get update
sudo apt-get install gnome-flashback network-manager-gnome -y
sudo apt-get install --no-install-recommends gdm3
sudo apt-get remove --purge lightdm
# Line below "fixes" the fact that some Vagrant/preseeded machines may have an "unmanaged"
# interface from before NetworkManager was installed
sudo rm -rf /etc/network/interfaces.d/* && sudo service network-manager restart
sleep 10
# xserver-xorg brings in some other nice things like touchpad drivers
sudo apt-get install i3 rofi xserver-xorg -y
sudo apt-get autoremove
#sudo service gdm restart
echo "Install finished, reboot and select 'Default session' in gdm"
