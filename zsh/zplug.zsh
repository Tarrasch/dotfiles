export zplug_home=~/.zplug  # explicitly set default

source ~/dotfiles/zsh/zplug-2.4.2/init.zsh

zplug "tarrasch/zsh-functional"
zplug "tarrasch/zsh-colors"
zplug "tarrasch/zsh-autoenv"
zplug "tarrasch/zsh-i-know"
zplug "tarrasch/zsh-mcd"
zplug "tarrasch/zsh-syntax-highlighting"
zplug 'dracula/zsh', as:theme
zplug "zsh-users/zsh-history-substring-search"

zplug load
