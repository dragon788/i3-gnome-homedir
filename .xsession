#!/bin/bash -x
# Menu tools use this value to decide which applications
# are approriate for the current session.
if [ -z $XDG_CURRENT_DESKTOP ]; then
    # Drop Unity if you have issues with certain apps
    export XDG_CURRENT_DESKTOP="GNOME-Flashback:GNOME:Unity"
    export I3_IS_AWESOME='i3'
fi

# Redirect the X11 beep to PulseAudio
# If you don't have pactl you can install it or comment this
pactl upload-sample \
    /usr/share/sounds/freedesktop/stereo/dialog-information.oga \
    x11-bell
pactl load-module \
    module-x11-bell \
    display=$DISPLAY \
    sample=x11-bell

# Run gnome-session and tell it to use our i3 session.
# Running the exec allows it to inherit the dbus-session of gdm???
exec gnome-session --session=gnome-plus-i3 --debug --disable-acceleration-check "$@"
