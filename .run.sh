#!/bin/sh


mkdir .local_backup/
time=`date +%s`
bupf=.local_backup/$time/
mkdir $bupf

for f in $PWD/*
do
    echo $f
    mv "$HOME/.${f##*/}" "$bupf"
    ln -s "$f" "$HOME/.${f##*/}"
done

