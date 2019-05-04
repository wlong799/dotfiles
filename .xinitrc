#!/bin/sh

# Load X resources
xrdb -merge ~/.Xresources

# Run programs necessary for proper execution
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Turn off speaker beeping
xset -b

# Load desktop background
fehbg &

# Lock screen after wake from suspend
xss-lock -- screenlock &

# Load lemonbar panel and setup hotkeys and gestures
mkpanel &
sxhkd &
gtk-launch libinput-gestures &

# Start bspwm
exec bspwm
