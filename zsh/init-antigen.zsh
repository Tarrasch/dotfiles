# Load antigen
. ~/.zsh/antigen/antigen.zsh

# Example usage:
#
#    local-test-and-delete zsh-i-know
#
# replacing
#
#    antigen-bundle Tarrasch/zsh-i-know
#
# And then do
#
#    $ ik zsh-i-know && git add --all . && git commit -m'yay'
#
# From ~/repos/zsh-i-know
#
local-test-and-delete () {
  REPOS='/home/arash/repos'
  REPO="$REPOS/$1"
  trash-put $(-antigen-get-clone-dir $REPO)
  antigen-bundle $REPO
}

# My own plugins
antigen-bundle Tarrasch/zsh-functional
antigen-bundle Tarrasch/zsh-mcd
antigen-bundle Tarrasch/zsh-command-not-found
antigen-bundle Tarrasch/zsh-autoenv
antigen-bundle Tarrasch/zsh-bd
antigen-bundle Tarrasch/zsh-i-know
antigen-bundle Tarrasch/zsh-colors

# Syntax highlighting bundle.
antigen-bundle zsh-users/zsh-syntax-highlighting

# History search
antigen-bundle zsh-users/zsh-history-substring-search

# Load the theme
# Note: antigen-theme is stupid and have undocumented conventions
# antigen-bundle sindresorhus/pure
antigen-bundle Tarrasch/pure # My own version is purer
# antigen-bundle Tarrasch/zsh-prompt-powerline
# antigen theme https://gist.github.com/3750104.git agnoster
setopt prompt_subst

# Tell antigen that you're done.
antigen-apply
