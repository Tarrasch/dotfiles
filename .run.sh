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

