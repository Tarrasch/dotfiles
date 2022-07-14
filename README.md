This repository contains a dotfiles  setup that *suits me*.

One nice thing with my dotfiles is that most lines are well documented.
Additionally I've tried to unbloat it in recent years (2021 and 2022).

## Getting started

```{bash}
# Install basic software I use daily.
sudo apt-get install git vim zsh

# Ok, now we can get the dotfiles...
git clone https://github.com/Tarrasch/dotfiles.git

# Set up git config
git config --global core.excludesfile ~/.gitignore-global
git config --global core.pager 'less -+$LESS -R'

# Fix fonts for vim-airline (more info below)
# 2022 update: unclear if necessary.
fc-cache -vf ~/.fonts

# Set keyboard layout to colemak on the "system level".
sudo dpkg-reconfigure keyboard-configuration


# Now we can run ./.run.sh
cd ~/dotfiles
./symlink_dotfiles.sh
```

Now reopen a new terminal

```{bash}
# Install zsh plugins
zplug install

# Set layout if it's not set.
unikey_and_colemak.sh try_reset_2
```

Other tasks:

  * Install Solarized. [Link](https://github.com/Anthony25/gnome-terminal-colors-solarized)
  * `chsh --shell /usr/bin/zsh` (Requires re-login!)
  * In personal computers, generate [ssh keys](https://help.github.com/articles/generating-ssh-keys/#platform-linux)
