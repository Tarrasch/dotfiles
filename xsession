#!/bin/sh

xmonad &
nm-applet &
kupfer --no-splash &
# nemo --no-default-window &
exec xfce4-panel  # Fick problem med ctrl+r/s om jag ladda mer en panelen
                  # http://unix.stackexchange.com/questions/157947/xfce4-intercepts-ctrls-shortcut/157948#157948
