HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000

# Add to path
PATH=~/.cabal/bin:$PATH
PATH=~/.bin:$PATH

# Initialize colors
autoload -U colors
colors

# Other modules we want to source
. ~/.zsh/zsh_aliases

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
