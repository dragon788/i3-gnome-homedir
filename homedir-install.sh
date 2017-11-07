#!/bin/bash -x
echo "Copying configs to their respective locations and installing required packages"
cp -r --parents .config .local .xsession $HOME
sudo apt-get install i3 gnome-flashback gdm
echo "Install finished, reboot and select 'Default session' in gdm"
