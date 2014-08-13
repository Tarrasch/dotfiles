#!/bin/sh

##### Copy over files
mkdir .local_backup/
time=`date +%s`
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

##### NeoBundle installation
echo << EOL
Don't forget to run:

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

EOL
