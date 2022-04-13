#!/bin/bash -xe

# Usage:
#   Step 1: Test that commands work when running manually
#
#      example: unikey_and_colemak.sh enable_unikey
#
#   Step 2:
#
#      Map Desktop environment custom shortcuts to these commnads
#
#  ~/unikey_and_colemak.sh enable_unikey
#  ~/unikey_and_colemak.sh try_reset
#  ~/unikey_and_colemak.sh try_reset_2
#  ~/unikey_and_colemak.sh set_ibus_engine_to_eng
#  ~/unikey_and_colemak.sh replace_ibus_deamon

SWEDISH_COLEMAK=dotfiles/swedish_colemak

case $1 in
	enable_unikey)				
		ibus engine Unikey
		setxkbmap -layout us -variant colemak
		;;
	try_reset)				
		xkbcomp ~/$SWEDISH_COLEMAK/keymap.xkb :0 || xkbcomp ~/$SWEDISH_COLEMAK/keymap.xkb :1
		;;
	try_reset_2)				
		xkbcomp ~/$SWEDISH_COLEMAK/keymap.xkb :0 || xkbcomp ~/$SWEDISH_COLEMAK/keymap.xkb :1
		setxkbmap -layout us -variant colemak
		;;
	set_ibus_engine_to_eng)				
		ibus engine xkb:us:colemak:eng
		;;
	replace_ibus_deamon)
		ibus-daemon --daemonize --replace --xim
		;;
	*)
		echo 'unknown command noooo'
		;;
esac
