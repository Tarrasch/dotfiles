export ZPLUG_HOME=~/.zplug  # Explicitly set default

source ~/dotfiles/zsh/zplug-2.4.2/init.zsh

zplug "Tarrasch/zsh-functional"
zplug "Tarrasch/zsh-bd"
# zplug "Tarrasch/zsh-command-not-found"  # Not sure why it doesn't work ...
zplug "Tarrasch/zsh-colors"
zplug "Tarrasch/zsh-autoenv"
zplug "Tarrasch/zsh-i-know"
zplug "Tarrasch/pure"
zplug "Tarrasch/zsh-mcd"
zplug "Tarrasch/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

zplug load
