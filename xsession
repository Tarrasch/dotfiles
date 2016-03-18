#!/bin/sh

# Ibus (vietnamese typing) in fx:
# https://bbs.archlinux.org/viewtopic.php?id=189990 Still unclear if this is
# useful or if only my Win+b keybinding in xmonad is enough.
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

xmonad &
nm-applet &
kupfer --no-splash &
# nemo --no-default-window &
exec xfce4-panel  # Fick problem med ctrl+r/s om jag ladda mer en panelen
                  # http://unix.stackexchange.com/questions/157947/xfce4-intercepts-ctrls-shortcut/157948#157948
