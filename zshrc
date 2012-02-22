# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=2000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/arash/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Add to path
PATH=~/.cabal/bin:$PATH
PATH=~/.bin:$PATH

# Initialize colors.
autoload -U colors
colors

# Other modules we want to source
. ~/.zsh/zsh_aliases
. ~/.zsh/zshrc.zsh-template # uncomment to activate oh-my-zsh
# . ~/.zsh/zsh_prompt

##############################
# Key bidings
bindkey ";5C" forward-word
bindkey ";5D" backward-word

##############################
# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Temporary folderjumps
alias m='cd ~/repos/Water/mainline'
