# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000
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
# . ~/.zsh/zsh_prompt

##############################
# Key bidings
bindkey ";5C" forward-word
bindkey ";5D" backward-word

##############################
# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Initialize antigen
. ~/.zsh/init-antigen.zsh

# Python autocompletion (http://stackoverflow.com/a/246779/621449)
export PYTHONSTARTUP=~/.pythonrc

# I know what I'm doing function
alias ik='echo "Are you sure you want to do this? (y/n)" && read -qs'
