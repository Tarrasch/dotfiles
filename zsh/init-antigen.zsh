# Load antigen
. ~/.zsh/antigen/antigen.zsh

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

# TODO: MOVE TO OTHER FILE!!
# bind UP and DOWN arrow keys for zsh-history-substring-search
zmodload zsh/terminfo

# Hint from http://ubuntuforums.org/showthread.php?t=796627
# Basically by sourcing the /etc/lsb-release you get some
# shell variables set for you, like $DISTRIB_RELEASE
[[ -s "/etc/lsb-release" ]] && . /etc/lsb-release

if [[ $DISTRIB_RELEASE == "13.10" ]]
then
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
elif [[ $DISTRIB_RELEASE == "12.04" ]]
then
  # But this below works ($terminfo[kcuu1]=='A') withou the '^[['
  # At least for somewhat older Ubuntu versions like 12.04
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# And omg can somebody explain why the below doesn't work!?!?
# echo $terminfo[kcuu1]
# bindkey "^[[$terminfo[kcuu1]" history-substring-search-up
# bindkey "^[[$terminfo[kcud1]" history-substring-search-down
