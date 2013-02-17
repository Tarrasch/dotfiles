# Load antigen
. ~/.zsh/antigen/antigen.zsh

# Load oh-my-zsh
antigen-lib

# Auto env
antigen-bundle kennethreitz/autoenv

# My own plugins
antigen-bundle Tarrasch/zsh-functional
antigen-bundle Tarrasch/zsh-mcd

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle command-not-found

# Syntax highlighting bundle.
antigen-bundle zsh-users/zsh-syntax-highlighting

# History search
antigen-bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen-theme kolo

# Tell antigen that you're done.
antigen-apply
