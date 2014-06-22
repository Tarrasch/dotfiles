# bind UP and DOWN arrow keys for zsh-history-substring-search
zmodload zsh/terminfo

# Hint from http://ubuntuforums.org/showthread.php?t=796627
# Basically by sourcing the /etc/lsb-release you get some
# shell variables set for you, like $DISTRIB_RELEASE
[[ -s "/etc/lsb-release" ]] && . /etc/lsb-release

if [[ $DISTRIB_RELEASE == "13.10" ||
      $DISTRIB_RELEASE == "14.04" ]]
then
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
elif [[ $DISTRIB_RELEASE == "12.04" ]]
then
  # But this below works ($terminfo[kcuu1]=='A') withou the '^[['
  # At least for somewhat older Ubuntu versions like 12.04
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
else
  # This worked for me on the debian machines at Spotify
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi
