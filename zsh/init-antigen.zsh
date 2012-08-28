# Load antigen
. ~/.zsh/antigen/antigen.zsh

# Load oh-my-zsh
antigen-lib

# Auto env
antigen-bundle kennethreitz/autoenv

# Functional
antigen-bundle Tarrasch/zsh-functional

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle command-not-found

# Syntax highlighting bundle.
antigen-bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen-theme kolo

# Tell antigen that you're done.
antigen-apply
