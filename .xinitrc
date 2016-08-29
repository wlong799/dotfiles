#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Load default system resources and keymap
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

# Load user resources and keymap
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

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

# Start bspwm with terminal, firefox, thunderbird, and calibre open
urxvt &
firefox &
thunderbird &
calibre &
exec bspwm
