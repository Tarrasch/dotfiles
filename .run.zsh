#!/bin/zsh

##### Copy over files
mkdir .local_backup/
time=$(date +%s)
bupf=.local_backup/$time/
mkdir $bupf

for f in $PWD/*
do
    echo $f
    src=$f
    dest="$HOME/.${f##*/}"
    if diff "$src" "$dest" >/dev/null ; then
        echo $f are equal, no action taken
    else
        mv "$dest" "$bupf"
        ln -s "$f" "$dest"
    fi
done

mkdir "$HOME/.ssh"
ln -s "$PWD/.ssh/rc" "$HOME/.ssh/rc"

##### Git config
git config --global core.excludesfile ~/.gitignore-global

##### Fix fonts for vim-airline
fc-cache -vf ~/.fonts

read \?" awaiting keypress ... "

##### Configure sudoers file
sudo echo "Just asking for password"
echo "run 'sudo visudo --check' to see that current state validates (before we start messing)"
cat << EOL
Ok, now we will run for you

sudo visudo --file=/etc/sudoers.d/arash-extra-rules

and paste in the following:

""""""""""""""""
$(cat $PWD/.etc/sudoers.d/arash-extra-rules)
""""""""""""""""

EOL

read \?" awaiting keypress ... "

sudo visudo --file=/etc/sudoers.d/arash-extra-rules
sudo visudo --check


cat << EOL

Now lets install some packages

Also, after fixing your keyboard layout to colemak. Do it also at the "system
level". Otherwise you'll have this annoying bug where the layouts are different
for laptop and USB-keyboard.

""""""""""""""""
sudo dpkg-reconfigure keyboard-configuration
""""""""""""""""

EOL
