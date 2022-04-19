#!/bin/zsh

if [[ ! $PWD == *dotfiles ]]; then
    echo "must run from dotfiles directory"
    return 1
fi

##### Copy over files
mkdir -p .local_backup/
time=$(date +%s)
bupf=.local_backup/$time/
mkdir $bupf
files_to_symlink=(zshrc vimrc zsh vim bin fonts gitignore-global tmux.conf)

for f in $files_to_symlink
do
    echo $f
    src="$PWD/$f"
    dest="$HOME/.${f##*/}"
    if diff "$src" "$dest" >/dev/null ; then
        echo $f are equal, no action taken
    else
        mv "$dest" "$bupf"
        ln -s "$src" "$dest"
    fi
done

read \?" awaiting keypress ... "

##### Configure sudoers file
sudo echo "Just asking for password"
echo "run 'sudo visudo --check' to see that current state validates before we start messing"
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

EOL
