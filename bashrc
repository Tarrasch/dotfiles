# I keep this bashrc simple. As I nowadays use zsh.

BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"

PS1="\n$RED\$(date +%H:%M)$NO_COLOR \$ $GREEN\n"
PS1="$PS1→ \[$NO_COLOR\]"

alias canhaz='sudo apt-get install'
