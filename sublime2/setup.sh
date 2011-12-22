#!/bin/sh
# Setup a machine for Sublime Text 2

DOTFILES="$HOME/dotfiles"
time=`date +%s`

# symlink settings in
sublime_dir="$HOME/.config/sublime-text-2/Packages"
mv "$sublime_dir/User" "$sublime_dir/User.backup.${time}"
ln -s "$DOTFILES/sublime2/User/" "${sublime_dir}/"
