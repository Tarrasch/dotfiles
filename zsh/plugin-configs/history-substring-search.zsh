# bind UP and DOWN arrow keys for zsh-history-substring-search
zmodload zsh/terminfo

# It seems like the following works good for Ubuntu 13.10+,
# I've now removed all intelligent version checking, because
# at the time of writing all older versions are now history.
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
