# i3-gnome-homedir

## TL;DR Ubuntu
Run `bash homedir-install.sh` from the root of this repo (doesn't handle being called
from elsewhere yet)

## Basics for most distros
Copy these into your home directory using `cp -r --parents .config .local .xsession ~`
and make sure you have at least i3 and gnome-flashback installed (gnome-flashback is
a "classic" version using Gnome3 APIs but appears to have some hooks required for
functionality).

## Ubuntu/Debian dependencies
I'm investigating what --no-install-recommends breaks for things, as the script would install
a LOT of packages without it.
All minimally required packages and anything they pull in, who cares about space if it works?
`sudo apt install i3 gnome-flashback gdm3 xserver-xorg`
If you want a minimal set good for installing to a USB drive or a Chromebook/netbook if you
are tight on space already use the script above which attempts to only pull in the necessities

## Extras
If you aren't seeing the tray indicators you would expect, you may need to remove the
"tray_output primary" line from your i3 config

If you want nm-applet to run on i3 startup you need to install network-manager(-gnome)
If your system didn't have network-manager preinstalled you will probably need to remove interfaces under
/etc/network/interfaces.d/ otherwise network-manager won't manage them
`sudo rm /etc/network/interfaces.d/*`
then you can add nm-applet to ~/.config/gnome-sessions/gnome-plus-i3.session or you can copy its .desktop file
to ~/.config/autostart/ from /usr/share/applications/nm-applet.desktop
You will probably need to edit the file to remove the "NotIn" or "OnlyIn" line so that it will properly start.
